	.file	"byte_transfer.c"
	.globl	chars
	.data
	.type	chars, @object
	.size	chars, 4
chars:
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.globl	char_p
	.bss
	.align 8
	.type	char_p, @object
	.size	char_p, 8
char_p:
	.zero	8
	.globl	short_p
	.align 8
	.type	short_p, @object
	.size	short_p, 8
short_p:
	.zero	8
	.globl	int_p
	.align 8
	.type	int_p, @object
	.size	int_p, 8
int_p:
	.zero	8
	.section	.rodata
.LC0:
	.string	"\345\255\227\350\212\202\346\225\260\347\273\204\347\232\204\345\234\260\345\235\200 = %p \n"
	.align 8
.LC1:
	.string	"char  \345\234\260\345\235\200 = %p  \345\200\274 = %#9x \n"
	.align 8
.LC2:
	.string	"short \345\234\260\345\235\200 = %p  \345\200\274 = %#9x \n"
	.align 8
.LC3:
	.string	"int   \345\234\260\345\235\200 = %p  \345\200\274 = %#9x \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$chars, char_p(%rip)
	movq	$chars, short_p(%rip)
	movq	$chars, int_p(%rip)
	movl	$chars, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	char_p(%rip), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	char_p(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	short_p(%rip), %rax
	movzwl	(%rax), %eax
	movswl	%ax, %edx
	movq	short_p(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	int_p(%rip), %rax
	movl	(%rax), %edx
	movq	int_p(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
