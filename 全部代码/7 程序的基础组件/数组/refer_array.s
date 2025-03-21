	.file	"refer_array.c"
	.globl	num_array
	.data
	.align 4
	.type	num_array, @object
	.size	num_array, 8
num_array:
	.long	10000
	.long	20000
	.text
	.globl	add_by_name
	.type	add_by_name, @function
add_by_name:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	5(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movq	-8(%rbp), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	addl	$5, %edx
	movl	%edx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	add_by_name, .-add_by_name
	.globl	add_by_ptr
	.type	add_by_ptr, @function
add_by_ptr:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	800(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movq	-8(%rbp), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	addl	$800, %edx
	movl	%edx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	add_by_ptr, .-add_by_ptr
	.section	.rodata
.LC0:
	.string	"\n %s \n"
.LC1:
	.string	" arr[0] = %d \n"
.LC2:
	.string	" arr[1] = %d \n"
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB4:
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
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_array, .-print_array
	.section	.rodata
.LC3:
	.string	"add_by_name :"
.LC4:
	.string	"add_by_ptr :"
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
	movl	$num_array, %edi
	call	add_by_name
	movl	$num_array, %esi
	movl	$.LC3, %edi
	call	print_array
	movl	$num_array, %edi
	call	add_by_ptr
	movl	$num_array, %esi
	movl	$.LC4, %edi
	call	print_array
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
