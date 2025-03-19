	.file	"depth.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"func_6  param addr = %p  %llu \n"
	.text
	.globl	func_6
	.type	func_6, @function
func_6:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_6, .-func_6
	.section	.rodata
	.align 8
.LC1:
	.string	"func_5  param addr = %p  %llu \n"
	.text
	.globl	func_5
	.type	func_5, @function
func_5:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	func_6
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_5, .-func_5
	.section	.rodata
	.align 8
.LC2:
	.string	"func_4  param addr = %p  %llu \n"
	.text
	.globl	func_4
	.type	func_4, @function
func_4:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	func_5
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_4, .-func_4
	.section	.rodata
	.align 8
.LC3:
	.string	"func_3  param addr = %p  %llu \n"
	.text
	.globl	func_3
	.type	func_3, @function
func_3:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	func_4
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	func_3, .-func_3
	.section	.rodata
	.align 8
.LC4:
	.string	"func_2  param addr = %p  %llu \n"
	.text
	.globl	func_2
	.type	func_2, @function
func_2:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	func_3
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	func_2, .-func_2
	.section	.rodata
	.align 8
.LC5:
	.string	"func_1  param addr = %p  %llu \n"
	.text
	.globl	func_1
	.type	func_1, @function
func_1:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	func_2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	func_1, .-func_1
	.section	.rodata
	.align 8
.LC6:
	.string	"main    param addr = %p  %llu \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -4(%rbp)
	leaq	-4(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	func_1
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
