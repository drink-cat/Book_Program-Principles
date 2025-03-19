	.file	"field_addr.c"
	.section	.rodata
.LC0:
	.string	"\n %s \n"
.LC1:
	.string	"struct  addr = %p %llu \n"
	.align 8
.LC2:
	.string	"height  addr = %p %llu  value = %d \n"
	.align 8
.LC3:
	.string	"weight  addr = %p %llu  value = %d \n"
	.align 8
.LC4:
	.string	"speed   addr = %p %llu  value = %lld \n"
	.align 8
.LC5:
	.string	"notUse  addr = %p %llu  value = %d \n"
	.text
	.globl	print_cat
	.type	print_cat, @function
print_cat:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	addq	$4, %rax
	movq	-16(%rbp), %rcx
	leaq	4(%rcx), %rsi
	movl	%edx, %ecx
	movq	%rax, %rdx
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	-16(%rbp), %rcx
	leaq	8(%rcx), %rsi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movl	16(%rax), %edx
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	-16(%rbp), %rcx
	leaq	16(%rcx), %rsi
	movl	%edx, %ecx
	movq	%rax, %rdx
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_cat, .-print_cat
	.comm	cat_red,24,16
	.section	.rodata
.LC6:
	.string	"Cat_t size = %d \n"
.LC7:
	.string	"in Data area : "
.LC8:
	.string	"in Heap area : "
.LC9:
	.string	"in Stack area : "
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
	movl	$24, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$111, cat_red(%rip)
	movl	$222, cat_red+4(%rip)
	movq	$333, cat_red+8(%rip)
	movl	$0, cat_red+16(%rip)
	movl	$24, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$444, (%rax)
	movq	-8(%rbp), %rax
	movl	$555, 4(%rax)
	movq	-8(%rbp), %rax
	movq	$666, 8(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 16(%rax)
	movl	$777, -32(%rbp)
	movl	$888, -28(%rbp)
	movq	$999, -24(%rbp)
	movl	$0, -16(%rbp)
	movl	$cat_red, %esi
	movl	$.LC7, %edi
	call	print_cat
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	call	print_cat
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	call	print_cat
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
