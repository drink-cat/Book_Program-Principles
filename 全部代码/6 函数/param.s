	.file	"param.c"
	.section	.rodata
.LC0:
	.string	"\345\207\275\346\225\260\346\262\241\346\234\211\345\205\245\345\217\202 "
	.text
	.globl	func_no_param
	.type	func_no_param, @function
func_no_param:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC0, %edi
	call	puts
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_no_param, .-func_no_param
	.section	.rodata
.LC1:
	.string	"\345\207\275\346\225\260\346\234\2111\344\270\252\345\205\245\345\217\202 %d \n"
	.text
	.globl	func_1_param
	.type	func_1_param, @function
func_1_param:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_1_param, .-func_1_param
	.section	.rodata
	.align 8
.LC2:
	.string	"\345\207\275\346\225\260\346\234\2115\344\270\252\345\205\245\345\217\202 %d %d %d %d %d \n"
	.text
	.globl	func_5_param
	.type	func_5_param, @function
func_5_param:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	-20(%rbp), %edi
	movl	-16(%rbp), %esi
	movl	-12(%rbp), %ecx
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_5_param, .-func_5_param
	.section	.rodata
	.align 8
.LC3:
	.string	"\345\207\275\346\225\260\346\234\2119\344\270\252\345\205\245\345\217\202 %d %d %d %d %d %d %d %d %d \n"
	.text
	.globl	func_9_param
	.type	func_9_param, @function
func_9_param:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	movl	-20(%rbp), %r8d
	movl	-16(%rbp), %edi
	movl	-12(%rbp), %ecx
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	32(%rbp), %esi
	movl	%esi, 24(%rsp)
	movl	24(%rbp), %esi
	movl	%esi, 16(%rsp)
	movl	16(%rbp), %esi
	movl	%esi, 8(%rsp)
	movl	-24(%rbp), %esi
	movl	%esi, (%rsp)
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	func_9_param, .-func_9_param
	.section	.rodata
	.align 8
.LC4:
	.string	"\345\207\275\346\225\260\346\234\211double/int\345\205\245\345\217\202 %f %f %d %d \n"
	.text
	.globl	func_double_int_param
	.type	func_double_int_param, @function
func_double_int_param:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, -32(%rbp)
	movsd	-32(%rbp), %xmm1
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$2, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	func_double_int_param, .-func_double_int_param
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, %eax
	call	func_no_param
	movl	$100, %edi
	call	func_1_param
	movl	$500, %r8d
	movl	$400, %ecx
	movl	$300, %edx
	movl	$200, %esi
	movl	$100, %edi
	call	func_5_param
	movl	$900, 16(%rsp)
	movl	$800, 8(%rsp)
	movl	$700, (%rsp)
	movl	$600, %r9d
	movl	$500, %r8d
	movl	$400, %ecx
	movl	$300, %edx
	movl	$200, %esi
	movl	$100, %edi
	call	func_9_param
	movabsq	$4626947591664639672, %rdx
	movabsq	$4622443992037269176, %rax
	movl	$200, %esi
	movl	$100, %edi
	movq	%rdx, -8(%rbp)
	movsd	-8(%rbp), %xmm1
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	call	func_double_int_param
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
