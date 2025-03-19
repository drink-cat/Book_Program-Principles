	.file	"return_hard.c"
	.globl	Tom
	.data
	.align 16
	.type	Tom, @object
	.size	Tom, 16
Tom:
	.quad	33
	.long	0
	.long	1078689792
	.text
	.globl	func_1_return_pionter
	.type	func_1_return_pionter, @function
func_1_return_pionter:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$Tom, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_1_return_pionter, .-func_1_return_pionter
	.globl	func_1_return_pionter2
	.type	func_1_return_pionter2, @function
func_1_return_pionter2:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-4(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_1_return_pionter2, .-func_1_return_pionter2
	.globl	func_1_return_struct
	.type	func_1_return_struct, @function
func_1_return_struct:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	Tom(%rip), %rax
	movq	Tom+8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rbx
	movq	%rcx, %rax
	movq	%rdx, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_1_return_struct, .-func_1_return_struct
	.section	.rodata
	.align 8
.LC0:
	.string	"\345\207\275\346\225\260\350\277\224\345\233\2361\344\270\252\345\205\250\345\261\200\345\217\230\351\207\217\347\232\204\346\214\207\351\222\210     = %p \n"
	.align 8
.LC1:
	.string	"\345\207\275\346\225\260\350\277\224\345\233\2361\344\270\252\346\240\210\345\206\205\345\217\230\351\207\217\347\232\204\346\214\207\351\222\210     = %p \n"
	.align 8
.LC2:
	.string	"\345\207\275\346\225\260\350\277\224\345\233\2361\344\270\252\345\244\226\351\203\250struct\347\232\204\346\213\267\350\264\235   = %p \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$0, %eax
	call	func_1_return_pionter
	movq	%rax, -8(%rbp)
	movl	$0, %eax
	call	func_1_return_pionter2
	movq	%rax, -16(%rbp)
	movl	$0, %eax
	call	func_1_return_struct
	movq	%rax, %rdx
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rdx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$9999999, %edi
	call	sleep
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
