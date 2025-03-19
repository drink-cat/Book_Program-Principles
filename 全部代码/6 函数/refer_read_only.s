	.file	"refer_read_only.c"
	.text
	.globl	func_value
	.type	func_value, @function
func_value:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movsd	%xmm0, -32(%rbp)
	movq	-24(%rbp), %rax
	addq	$666, %rax
	movq	%rax, -8(%rbp)
	movsd	-32(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_value, .-func_value
	.globl	func_pointer
	.type	func_pointer, @function
func_pointer:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	addq	$666, %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_pointer, .-func_pointer
	.globl	speed
	.data
	.align 8
	.type	speed, @object
	.size	speed, 8
speed:
	.quad	120
	.globl	height
	.align 8
	.type	height, @object
	.size	height, 8
height:
	.long	1610612736
	.long	1077986918
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	height(%rip), %rax
	movq	speed(%rip), %rdx
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	%rdx, %rdi
	call	func_value
	movl	$height, %esi
	movl	$speed, %edi
	call	func_pointer
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1082445824
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
