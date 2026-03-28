
word_helpers.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <get_word>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	53                   	push   %rbx
   5:	48 83 ec 48          	sub    $0x48,%rsp
   9:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
   d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  11:	48 c7 45 d0 10 00 00 	movq   $0x10,-0x30(%rbp)
  18:	00 
  19:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
  20:	00 
  21:	eb 10                	jmp    33 <get_word+0x33>
  23:	83 7d cc ff          	cmpl   $0xffffffff,-0x34(%rbp)
  27:	75 0a                	jne    33 <get_word+0x33>
  29:	b8 00 00 00 00       	mov    $0x0,%eax
  2e:	e9 26 01 00 00       	jmp    159 <get_word+0x159>
  33:	e8 00 00 00 00       	call   38 <get_word+0x38>
			34: R_X86_64_PLT32	__ctype_b_loc-0x4
  38:	48 8b 18             	mov    (%rax),%rbx
  3b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  3f:	48 89 c7             	mov    %rax,%rdi
  42:	e8 00 00 00 00       	call   47 <get_word+0x47>
			43: R_X86_64_PLT32	fgetc-0x4
  47:	89 45 cc             	mov    %eax,-0x34(%rbp)
  4a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  4d:	48 98                	cltq
  4f:	48 01 c0             	add    %rax,%rax
  52:	48 01 d8             	add    %rbx,%rax
  55:	0f b7 00             	movzwl (%rax),%eax
  58:	0f b7 c0             	movzwl %ax,%eax
  5b:	25 00 04 00 00       	and    $0x400,%eax
  60:	85 c0                	test   %eax,%eax
  62:	74 bf                	je     23 <get_word+0x23>
  64:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  68:	48 89 c7             	mov    %rax,%rdi
  6b:	e8 00 00 00 00       	call   70 <get_word+0x70>
			6c: R_X86_64_PLT32	malloc-0x4
  70:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  74:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  79:	75 16                	jne    91 <get_word+0x91>
  7b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 82 <get_word+0x82>
			7e: R_X86_64_PC32	.rodata-0x4
  82:	e8 00 00 00 00       	call   87 <get_word+0x87>
			83: R_X86_64_PLT32	perror-0x4
  87:	b8 00 00 00 00       	mov    $0x0,%eax
  8c:	e9 c8 00 00 00       	jmp    159 <get_word+0x159>
  91:	8b 45 cc             	mov    -0x34(%rbp),%eax
  94:	89 c7                	mov    %eax,%edi
  96:	e8 00 00 00 00       	call   9b <get_word+0x9b>
			97: R_X86_64_PLT32	tolower-0x4
  9b:	89 c1                	mov    %eax,%ecx
  9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  a1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  a5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  a9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  ad:	48 01 d0             	add    %rdx,%rax
  b0:	89 ca                	mov    %ecx,%edx
  b2:	88 10                	mov    %dl,(%rax)
  b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  b8:	48 3b 45 d0          	cmp    -0x30(%rbp),%rax
  bc:	75 49                	jne    107 <get_word+0x107>
  be:	48 d1 65 d0          	shlq   $1,-0x30(%rbp)
  c2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  c6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  ca:	48 89 d6             	mov    %rdx,%rsi
  cd:	48 89 c7             	mov    %rax,%rdi
  d0:	e8 00 00 00 00       	call   d5 <get_word+0xd5>
			d1: R_X86_64_PLT32	realloc-0x4
  d5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  d9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  de:	75 1f                	jne    ff <get_word+0xff>
  e0:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # e7 <get_word+0xe7>
			e3: R_X86_64_PC32	.rodata+0x3
  e7:	e8 00 00 00 00       	call   ec <get_word+0xec>
			e8: R_X86_64_PLT32	perror-0x4
  ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  f0:	48 89 c7             	mov    %rax,%rdi
  f3:	e8 00 00 00 00       	call   f8 <get_word+0xf8>
			f4: R_X86_64_PLT32	free-0x4
  f8:	b8 00 00 00 00       	mov    $0x0,%eax
  fd:	eb 5a                	jmp    159 <get_word+0x159>
  ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 103:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 107:	e8 00 00 00 00       	call   10c <get_word+0x10c>
			108: R_X86_64_PLT32	__ctype_b_loc-0x4
 10c:	48 8b 18             	mov    (%rax),%rbx
 10f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 113:	48 89 c7             	mov    %rax,%rdi
 116:	e8 00 00 00 00       	call   11b <get_word+0x11b>
			117: R_X86_64_PLT32	fgetc-0x4
 11b:	89 45 cc             	mov    %eax,-0x34(%rbp)
 11e:	8b 45 cc             	mov    -0x34(%rbp),%eax
 121:	48 98                	cltq
 123:	48 01 c0             	add    %rax,%rax
 126:	48 01 d8             	add    %rbx,%rax
 129:	0f b7 00             	movzwl (%rax),%eax
 12c:	0f b7 c0             	movzwl %ax,%eax
 12f:	25 00 04 00 00       	and    $0x400,%eax
 134:	85 c0                	test   %eax,%eax
 136:	0f 85 55 ff ff ff    	jne    91 <get_word+0x91>
 13c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 140:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 144:	48 01 d0             	add    %rdx,%rax
 147:	c6 00 00             	movb   $0x0,(%rax)
 14a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
 14e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 152:	48 89 10             	mov    %rdx,(%rax)
 155:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 159:	48 83 c4 48          	add    $0x48,%rsp
 15d:	5b                   	pop    %rbx
 15e:	5d                   	pop    %rbp
 15f:	c3                   	ret

0000000000000160 <count_words>:
 160:	55                   	push   %rbp
 161:	48 89 e5             	mov    %rsp,%rbp
 164:	48 83 ec 30          	sub    $0x30,%rsp
 168:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
 16c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
 170:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 177:	00 00 
 179:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 17d:	31 c0                	xor    %eax,%eax
 17f:	eb 3b                	jmp    1bc <count_words+0x5c>
 181:	48 83 7d f0 01       	cmpq   $0x1,-0x10(%rbp)
 186:	75 0e                	jne    196 <count_words+0x36>
 188:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 18c:	48 89 c7             	mov    %rax,%rdi
 18f:	e8 00 00 00 00       	call   194 <count_words+0x34>
			190: R_X86_64_PLT32	free-0x4
 194:	eb 26                	jmp    1bc <count_words+0x5c>
 196:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 19a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 19e:	48 89 d6             	mov    %rdx,%rsi
 1a1:	48 89 c7             	mov    %rax,%rdi
 1a4:	e8 00 00 00 00       	call   1a9 <count_words+0x49>
			1a5: R_X86_64_PLT32	add_word-0x4
 1a9:	48 85 c0             	test   %rax,%rax
 1ac:	75 0e                	jne    1bc <count_words+0x5c>
 1ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1b2:	48 89 c7             	mov    %rax,%rdi
 1b5:	e8 00 00 00 00       	call   1ba <count_words+0x5a>
			1b6: R_X86_64_PLT32	free-0x4
 1ba:	eb 1e                	jmp    1da <count_words+0x7a>
 1bc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
 1c0:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
 1c4:	48 89 d6             	mov    %rdx,%rsi
 1c7:	48 89 c7             	mov    %rax,%rdi
 1ca:	e8 31 fe ff ff       	call   0 <get_word>
 1cf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 1d3:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
 1d8:	75 a7                	jne    181 <count_words+0x21>
 1da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1de:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
 1e5:	00 00 
 1e7:	74 05                	je     1ee <count_words+0x8e>
 1e9:	e8 00 00 00 00       	call   1ee <count_words+0x8e>
			1ea: R_X86_64_PLT32	__stack_chk_fail-0x4
 1ee:	c9                   	leave
 1ef:	c3                   	ret

00000000000001f0 <less_count>:
 1f0:	55                   	push   %rbp
 1f1:	48 89 e5             	mov    %rsp,%rbp
 1f4:	48 83 ec 10          	sub    $0x10,%rsp
 1f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 1fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 200:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 204:	8b 50 08             	mov    0x8(%rax),%edx
 207:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 20b:	8b 40 08             	mov    0x8(%rax),%eax
 20e:	39 c2                	cmp    %eax,%edx
 210:	7c 2f                	jl     241 <less_count+0x51>
 212:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 216:	8b 50 08             	mov    0x8(%rax),%edx
 219:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 21d:	8b 40 08             	mov    0x8(%rax),%eax
 220:	39 c2                	cmp    %eax,%edx
 222:	75 24                	jne    248 <less_count+0x58>
 224:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 228:	48 8b 10             	mov    (%rax),%rdx
 22b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 22f:	48 8b 00             	mov    (%rax),%rax
 232:	48 89 d6             	mov    %rdx,%rsi
 235:	48 89 c7             	mov    %rax,%rdi
 238:	e8 00 00 00 00       	call   23d <less_count+0x4d>
			239: R_X86_64_PLT32	strcmp-0x4
 23d:	85 c0                	test   %eax,%eax
 23f:	79 07                	jns    248 <less_count+0x58>
 241:	b8 01 00 00 00       	mov    $0x1,%eax
 246:	eb 05                	jmp    24d <less_count+0x5d>
 248:	b8 00 00 00 00       	mov    $0x0,%eax
 24d:	83 e0 01             	and    $0x1,%eax
 250:	c9                   	leave
 251:	c3                   	ret

0000000000000252 <less_word>:
 252:	55                   	push   %rbp
 253:	48 89 e5             	mov    %rsp,%rbp
 256:	48 83 ec 10          	sub    $0x10,%rsp
 25a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 25e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 262:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 266:	48 8b 10             	mov    (%rax),%rdx
 269:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 26d:	48 8b 00             	mov    (%rax),%rax
 270:	48 89 d6             	mov    %rdx,%rsi
 273:	48 89 c7             	mov    %rax,%rdi
 276:	e8 00 00 00 00       	call   27b <less_word+0x29>
			277: R_X86_64_PLT32	strcmp-0x4
 27b:	c1 e8 1f             	shr    $0x1f,%eax
 27e:	c9                   	leave
 27f:	c3                   	ret
