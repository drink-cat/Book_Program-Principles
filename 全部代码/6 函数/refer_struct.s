	.file	"refer_struct.c"
	.text
	.globl	func_value_as_param
	.type	func_value_as_param, @function
func_value_as_param:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$100, 16(%rbp)
	movq	$200, 24(%rbp)
	movq	$300, 32(%rbp)
	movq	$400, 40(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_value_as_param, .-func_value_as_param
	.globl	func_value_as_return
	.type	func_value_as_return, @function
func_value_as_return:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	$500, -32(%rbp)
	movq	$600, -24(%rbp)
	movq	$700, -16(%rbp)
	movq	$800, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-40(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_value_as_return, .-func_value_as_return
	.globl	func_value_pointer
	.type	func_value_pointer, @function
func_value_pointer:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$1000, (%rax)
	movq	-8(%rbp), %rax
	movq	$2000, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$3000, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$4000, 24(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_value_pointer, .-func_value_pointer
	.section	.rodata
	.align 8
.LC0:
	.string	"  %s  addr = %p  age = %lld  speed = %lld  height = %lld  weight = %lld \n"
	.text
	.globl	print_cat
	.type	print_cat, @function
print_cat:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rsi
	movq	-16(%rbp), %rax
	movq	16(%rax), %r8
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rsi, (%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_cat, .-print_cat
	.comm	cat_tom,32,32
	.section	.rodata
.LC1:
	.string	"\345\200\274\344\274\240\351\200\222\357\274\232\344\275\234\344\270\272\345\205\245\345\217\202 "
.LC2:
	.string	"\350\260\203\347\224\250\345\211\215"
.LC3:
	.string	"\350\260\203\347\224\250\345\220\216"
.LC4:
	.string	"\345\200\274\344\274\240\351\200\222\357\274\232\344\275\234\344\270\272\350\277\224\345\233\236\345\200\274 "
.LC5:
	.string	"\345\274\225\347\224\250\344\274\240\351\200\222\357\274\232\346\214\207\351\222\210 "
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	$1, cat_tom(%rip)
	movq	$2, cat_tom+8(%rip)
	movq	$3, cat_tom+16(%rip)
	movq	$4, cat_tom+24(%rip)
	movl	$.LC1, %edi
	call	puts
	movl	$cat_tom, %esi
	movl	$.LC2, %edi
	call	print_cat
	movq	cat_tom(%rip), %rax
	movq	%rax, (%rsp)
	movq	cat_tom+8(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	cat_tom+16(%rip), %rax
	movq	%rax, 16(%rsp)
	movq	cat_tom+24(%rip), %rax
	movq	%rax, 24(%rsp)
	call	func_value_as_param
	movl	$cat_tom, %esi
	movl	$.LC3, %edi
	call	print_cat
	movl	$10, %edi
	call	putchar
	movl	$.LC4, %edi
	call	puts
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	func_value_as_return
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	call	print_cat
	movl	$10, %edi
	call	putchar
	movl	$.LC5, %edi
	call	puts
	movl	$cat_tom, %esi
	movl	$.LC2, %edi
	call	print_cat
	movl	$cat_tom, %edi
	call	func_value_pointer
	movl	$cat_tom, %esi
	movl	$.LC3, %edi
	call	print_cat
	movl	$10, %edi
	call	putchar
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
