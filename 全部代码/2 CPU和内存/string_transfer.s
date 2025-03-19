	.file	"string_transfer.c"
	.globl	ptr
	.section	.rodata
.LC0:
	.string	"night moon"
	.data
	.align 8
	.type	ptr, @object
	.size	ptr, 8
ptr:
	.quad	.LC0
	.globl	int_p
	.bss
	.align 8
	.type	int_p, @object
	.size	int_p, 8
int_p:
	.zero	8
	.section	.rodata
.LC1:
	.string	"\345\255\227\347\254\246\344\270\262 = %s \n"
	.align 8
.LC2:
	.string	"\345\215\225\344\270\252\345\255\227\350\212\202 \345\234\260\345\235\200 = %p  \345\200\274 = %#x \n"
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
	movq	ptr(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	ptr(%rip), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	ptr(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	ptr(%rip), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movq	ptr(%rip), %rdx
	leaq	1(%rdx), %rcx
	movl	%eax, %edx
	movq	%rcx, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	ptr(%rip), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movq	ptr(%rip), %rdx
	leaq	2(%rdx), %rcx
	movl	%eax, %edx
	movq	%rcx, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	ptr(%rip), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movq	ptr(%rip), %rdx
	leaq	3(%rdx), %rcx
	movl	%eax, %edx
	movq	%rcx, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	ptr(%rip), %rax
	movq	%rax, int_p(%rip)
	movq	int_p(%rip), %rax
	movl	(%rax), %edx
	movq	int_p(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
