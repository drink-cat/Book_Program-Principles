	.file	"inline.c"
	.text
	.globl	func_without_inline
	.type	func_without_inline, @function
func_without_inline:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$555, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	func_without_inline, .-func_without_inline
	.globl	func_test
	.type	func_test, @function
func_test:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L4
.L6:
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	addl	$333, %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	func_without_inline
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
.L4:
	cmpl	$776, -4(%rbp)
	jle	.L6
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_test, .-func_test
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
