	.file	"dump.c"
	.globl	bird_color
	.data
	.align 4
	.type	bird_color, @object
	.size	bird_color, 4
bird_color:
	.long	1364349780
	.globl	bird_speed
	.align 8
	.type	bird_speed, @object
	.size	bird_speed, 8
bird_speed:
	.quad	8174723217654970232
	.globl	tom
	.align 16
	.type	tom, @object
	.size	tom, 16
tom:
	.long	-1044200508
	.zero	4
	.quad	-3327364263599220776
	.text
	.globl	func_num
	.type	func_num, @function
func_num:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	sall	$8, %eax
	addl	$7, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_num, .-func_num
	.section	.rodata
.LC0:
	.string	" %12s  addr = %p \n"
	.text
	.globl	func_print_addr
	.type	func_print_addr, @function
func_print_addr:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_print_addr, .-func_print_addr
	.section	.rodata
.LC1:
	.string	"bird_color"
.LC2:
	.string	"bird_speed"
.LC3:
	.string	"tom"
.LC4:
	.string	"tom.color"
.LC5:
	.string	"tom.speed"
.LC6:
	.string	"func_num"
	.align 8
.LC7:
	.string	" func_num  before = %#X  after = %#X \n"
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
	subq	$16, %rsp
	movl	$bird_color, %esi
	movl	$.LC1, %edi
	call	func_print_addr
	movl	$bird_speed, %esi
	movl	$.LC2, %edi
	call	func_print_addr
	movl	$tom, %esi
	movl	$.LC3, %edi
	call	func_print_addr
	movl	$tom, %esi
	movl	$.LC4, %edi
	call	func_print_addr
	movl	$tom+8, %esi
	movl	$.LC5, %edi
	call	func_print_addr
	movl	$func_num, %esi
	movl	$.LC6, %edi
	call	func_print_addr
	movl	$-1583176796, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	func_num
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
