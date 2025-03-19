	.file	"scan_field.c"
	.comm	dog,32,32
	.section	.rodata
.LC1:
	.string	"addr = %llu  struct  \n\n"
.LC2:
	.string	"addr = %llu  name = %s \n"
.LC3:
	.string	"addr = %llu  height = %f \n"
.LC4:
	.string	"addr = %llu  speed = %d \n"
	.align 8
.LC5:
	.string	"addr = %llu  score[0] = %lld \n"
	.align 8
.LC6:
	.string	"addr = %llu  score[1] = %lld \n"
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
	subq	$48, %rsp
	movl	$1766944578, dog(%rip)
	movw	$24916, dog+4(%rip)
	movb	$0, dog+6(%rip)
	movl	.LC0(%rip), %eax
	movl	%eax, dog+8(%rip)
	movl	$555, dog+12(%rip)
	movq	$666, dog+16(%rip)
	movq	$777, dog+24(%rip)
	movq	$dog, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movq	-8(%rbp), %rax
	addq	$12, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	addq	$24, %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1102226391
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
