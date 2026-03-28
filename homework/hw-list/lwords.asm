
lwords.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 50          	sub    $0x50,%rsp
   8:	89 7d bc             	mov    %edi,-0x44(%rbp)
   b:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
   f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  16:	00 00 
  18:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  1c:	31 c0                	xor    %eax,%eax
  1e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  22:	48 89 c7             	mov    %rax,%rdi
  25:	e8 00 00 00 00       	call   2a <main+0x2a>
			26: R_X86_64_PLT32	init_words-0x4
  2a:	83 7d bc 01          	cmpl   $0x1,-0x44(%rbp)
  2e:	7f 18                	jg     48 <main+0x48>
  30:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 37 <main+0x37>
			33: R_X86_64_PC32	stdin-0x4
  37:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  3b:	48 89 d6             	mov    %rdx,%rsi
  3e:	48 89 c7             	mov    %rax,%rdi
  41:	e8 00 00 00 00       	call   46 <main+0x46>
			42: R_X86_64_PLT32	count_words-0x4
  46:	eb 78                	jmp    c0 <main+0xc0>
  48:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%rbp)
  4f:	eb 67                	jmp    b8 <main+0xb8>
  51:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  54:	48 98                	cltq
  56:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  5d:	00 
  5e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  62:	48 01 d0             	add    %rdx,%rax
  65:	48 8b 00             	mov    (%rax),%rax
  68:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 6f <main+0x6f>
			6b: R_X86_64_PC32	.rodata-0x4
  6f:	48 89 c7             	mov    %rax,%rdi
  72:	e8 00 00 00 00       	call   77 <main+0x77>
			73: R_X86_64_PLT32	fopen-0x4
  77:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  7b:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80:	75 13                	jne    95 <main+0x95>
  82:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 89 <main+0x89>
			85: R_X86_64_PC32	.rodata-0x2
  89:	e8 00 00 00 00       	call   8e <main+0x8e>
			8a: R_X86_64_PLT32	perror-0x4
  8e:	b8 01 00 00 00       	mov    $0x1,%eax
  93:	eb 5c                	jmp    f1 <main+0xf1>
  95:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  99:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  9d:	48 89 d6             	mov    %rdx,%rsi
  a0:	48 89 c7             	mov    %rax,%rdi
  a3:	e8 00 00 00 00       	call   a8 <main+0xa8>
			a4: R_X86_64_PLT32	count_words-0x4
  a8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  ac:	48 89 c7             	mov    %rax,%rdi
  af:	e8 00 00 00 00       	call   b4 <main+0xb4>
			b0: R_X86_64_PLT32	fclose-0x4
  b4:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
  b8:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  bb:	3b 45 bc             	cmp    -0x44(%rbp),%eax
  be:	7c 91                	jl     51 <main+0x51>
  c0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  c4:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # cb <main+0xcb>
			c7: R_X86_64_REX_GOTPCRELX	less_count-0x4
  cb:	48 89 d6             	mov    %rdx,%rsi
  ce:	48 89 c7             	mov    %rax,%rdi
  d1:	e8 00 00 00 00       	call   d6 <main+0xd6>
			d2: R_X86_64_PLT32	wordcount_sort-0x4
  d6:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # dd <main+0xdd>
			d9: R_X86_64_PC32	stdout-0x4
  dd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  e1:	48 89 d6             	mov    %rdx,%rsi
  e4:	48 89 c7             	mov    %rax,%rdi
  e7:	e8 00 00 00 00       	call   ec <main+0xec>
			e8: R_X86_64_PLT32	fprint_words-0x4
  ec:	b8 00 00 00 00       	mov    $0x0,%eax
  f1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  f5:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  fc:	00 00 
  fe:	74 05                	je     105 <main+0x105>
 100:	e8 00 00 00 00       	call   105 <main+0x105>
			101: R_X86_64_PLT32	__stack_chk_fail-0x4
 105:	c9                   	leave
 106:	c3                   	ret

#   int main(int argc, char* argv[]) {
#      word_count_list_t word_counts;
#      init_words(&word_counts);
#
#      if (argc <= 1) {
#         count_words(&word_counts, stdin);
#      } else {
#         for (int i = 1; i < argc; i++) {
#               FILE* fp = fopen(argv[i], "r");
#               if (fp == NULL) {
#                  perror("fopen"); 
#                  return 1;
#               }
#               count_words(&word_counts, fp);
#               fclose(fp);
#         }
#      }
#
#      wordcount_sort(&word_counts, less_count);
#      fprint_words(&word_counts, stdout);
#
#      return 0;
#   }