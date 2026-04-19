// #include <ctype.h>
// #include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <termios.h>
#include <unistd.h>

#include "tokenizer.h"

/* Convenience macro to silence compiler warnings about unused function
 * parameters. */
#define unused __attribute__((unused))

/* Whether the shell is connected to an actual terminal or not. */
bool shell_is_interactive;

/* File descriptor for the shell input */
int shell_terminal;

/* Terminal mode settings for the shell */
struct termios shell_tmodes;

/* Process group id for the shell */
pid_t shell_pgid;

int cmd_exit(struct tokens *tokens);
int cmd_help(struct tokens *tokens);
int cmd_pwd(struct tokens *tokens);
int cmd_cd(struct tokens *tokens);

/* Built-in command functions take token array (see parse.h) and return int */
typedef int cmd_fun_t(struct tokens *tokens);

/* Built-in command struct and lookup table */
typedef struct fun_desc {
  cmd_fun_t *fun;
  char *cmd;
  char *doc;
} fun_desc_t;

typedef struct redirect_file {
  char *in_file;
  char *out_file;
} redirect_file_t;

fun_desc_t cmd_table[] = {
    {cmd_help, "?", "show this help menu"},
    {cmd_exit, "exit", "exit the command shell"},
    {cmd_pwd, "pwd", "print the name of current/working directory"},
    {cmd_cd, "cd", "change the current working directory"},
};

/* Prints a helpful description for the given command */
int cmd_help(unused struct tokens *tokens) {
  for (unsigned int i = 0; i < sizeof(cmd_table) / sizeof(fun_desc_t); i++)
    printf("%s - %s\n", cmd_table[i].cmd, cmd_table[i].doc);
  return 1;
}

/* Exits this shell */
int cmd_exit(unused struct tokens *tokens) { exit(0); }

int cmd_pwd(unused struct tokens *tokens) {
  char buffer[4096];
  char *ret;
  ret = getcwd(buffer, sizeof(buffer));
  if (ret != NULL) {
    printf("%s\n", buffer);
  } else {
    return -1;
  }
  return 1;
}

int cmd_cd(struct tokens *tokens) {
  char *dest = tokens_get_token(tokens, 1);
  int res = chdir(dest);
  if (res == -1) {
    printf("Invalid path %s\n", dest);
    return -1;
  }
  return 1;
}

/* Looks up the built-in command, if it exists. */
int lookup(char cmd[]) {
  for (unsigned int i = 0; i < sizeof(cmd_table) / sizeof(fun_desc_t); i++)
    if (cmd && (strcmp(cmd_table[i].cmd, cmd) == 0))
      return i;
  return -1;
}

/* Intialization procedures for this shell */
void init_shell() {
  /* Our shell is connected to standard input. */
  shell_terminal = STDIN_FILENO;

  /* Check if we are running interactively */
  shell_is_interactive = isatty(shell_terminal);

  if (shell_is_interactive) {
    /* If the shell is not currently in the foreground, we must pause the shell
     * until it becomes a foreground process. We use SIGTTIN to pause the shell.
     * When the shell gets moved to the foreground, we'll receive a SIGCONT. */
    while (tcgetpgrp(shell_terminal) != (shell_pgid = getpgrp()))
      kill(-shell_pgid, SIGTTIN);

    /* Saves the shell's process id */
    shell_pgid = getpid();

    /* Take control of the terminal */
    tcsetpgrp(shell_terminal, shell_pgid);

    /* Save the current termios to a variable, so it can be restored later. */
    tcgetattr(shell_terminal, &shell_tmodes);
  }
}

void prompt() {
  char buffer[4096];
  getcwd(buffer, sizeof(buffer));
  fprintf(stdout, "%s> ", buffer);
}

void redirect(redirect_file_t *rd_f) {
  int fd;

  if (rd_f->in_file != NULL) {
    fd = open(rd_f->in_file, O_RDONLY);

    if (fd < 0) {
      perror("open input file failed");
      exit(1);
    }

    dup2(fd, STDIN_FILENO);
    close(fd);
  }

  if (rd_f->out_file != NULL) {
    // O_CREAT: Create the file if it does not exist
    // O_TRUNC: Clear the contents of the file if it exists
    // O_WRONLY: Write-only mode
    // 0644: File creation permissions (rw-r--r--)
    fd = open(rd_f->out_file, O_CREAT | O_TRUNC | O_WRONLY, 0644);

    if (fd < 0) {
      perror("open outpu file failed");
      exit(1);
    }

    dup2(fd, STDOUT_FILENO);
    close(fd);
  }
}

void execute_single_cmd(char *args[], redirect_file_t *rd_f) {
  char *path = strdup(getenv("PATH"));
  char *ptr;
  char *tk;

  redirect(rd_f);

  if (strchr(args[0], '/') != NULL) {
    execv(args[0], args);
  } else {

    char full_path[1024];
    tk = strtok_r(path, ":", &ptr);

    while (tk != NULL) {
      snprintf(full_path, sizeof(full_path), "%s/%s", tk, args[0]);
      int ret = access(full_path, X_OK);
      if (ret == 0) {
        execv(full_path, args);
        break;
      }
      tk = strtok_r(NULL, ":", &ptr);
    }
  }

  fprintf(stderr, "%s: command not found\n", args[0]);
  free(path);
  exit(1);
}

int execute_cmd(struct tokens *tokens) {
  int len = tokens_get_length(tokens);
  int N = 0;

  for (int i = 0; i < len; ++i) {
    if (strcmp(tokens_get_token(tokens, i), "|") == 0)
      N++;
  }

  int pipes[N][2];

  for (int i = 0; i < N; ++i) {
    int ret = pipe(pipes[i]);
    if (ret == -1) {
      perror("pipe failure");
      exit(EXIT_FAILURE);
    }
  }

  int idx = 0;
  int cmd_nums = N + 1;
  for (int i = 0; i < cmd_nums; ++i) {

    char *args[64];
    int argc = 0;
    redirect_file_t rd_f = {};
    // FIXME: beacause rd_f is null, so when call rd_f->in_file , we access the
    // NULL memory, which is a undefined behaivor...
    char *tk;

    while (idx < len) {
      tk = tokens_get_token(tokens, idx++);

      if (strcmp(tk, "|") == 0) {
        break;

      } else if (strcmp(tk, "<") == 0) {
        rd_f.in_file = tokens_get_token(tokens, idx++);

      } else if (strcmp(tk, ">") == 0) {
        rd_f.out_file = tokens_get_token(tokens, idx++);

      } else {
        args[argc++] = tk;
      }
    }

    args[argc] = NULL;

    pid_t pid = fork();

    if (pid == -1) {
      perror("fork failure");
      exit(EXIT_FAILURE);
    }

    if (pid == 0) {
      if (i > 0) {
        dup2(pipes[i - 1][0], STDIN_FILENO);
      }

      if (i < N) {
        dup2(pipes[i][1], STDOUT_FILENO);
      }

      for (int j = 0; j < N; ++j) {
        close(pipes[j][0]);
        close(pipes[j][1]);
      }

      execute_single_cmd(args, &rd_f);
      exit(1);
    }
  }

  for (int i = 0; i < N; ++i) {
    close(pipes[i][0]);
    close(pipes[i][1]);
  }

  for (int i = 0; i < cmd_nums; ++i) {
    wait(NULL);
  }

  return 1;
}

int main(unused int argc, unused char *argv[]) {
  init_shell();

  static char line[4096];

  /* Please only print shell prompts when standard input is not a tty */
  if (shell_is_interactive)
    prompt();

  while (fgets(line, 4096, stdin)) {
    /* Split our line into words. */
    struct tokens *tokens = tokenize(line);

    /* Find which built-in function to run. */
    int fundex = lookup(tokens_get_token(tokens, 0));

    if (fundex >= 0) {
      cmd_table[fundex].fun(tokens);
    } else {
      execute_cmd(tokens);
    }

    if (shell_is_interactive)
      prompt();
    /* Please only print shell prompts when standard input is not a tty */

    /* Clean up memory */
    tokens_destroy(tokens);
  }

  return 0;
}
