	.file	"structure.c"
	.text
	.globl	func_sum_num
	.type	func_sum_num, @function
func_sum_num:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	cvtsi2ss	-4(%rbp), %xmm0
	movss	%xmm0, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, -24(%rbp)
	movss	-24(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_sum_num, .-func_sum_num
	.section	.rodata
.LC0:
	.string	"\345\207\275\346\225\260\347\232\204\350\277\224\345\233\236\345\200\274 = %6.2f \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$3, -4(%rbp)
	movl	$5, -12(%rbp)
	leaq	-12(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	func_sum_num
	movss	%xmm0, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC0, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
