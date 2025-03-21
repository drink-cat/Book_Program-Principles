	.file	"num_array.c"
	.globl	int32_arr
	.data
	.align 4
	.type	int32_arr, @object
	.size	int32_arr, 12
int32_arr:
	.long	100
	.long	200
	.zero	4
	.globl	int64_arr
	.align 16
	.type	int64_arr, @object
	.size	int64_arr, 24
int64_arr:
	.quad	555
	.quad	666
	.zero	8
	.section	.rodata
.LC0:
	.string	"int32_arr  size = %d \n"
.LC1:
	.string	"int64_arr  size = %d \n"
.LC2:
	.string	"int32_arr[2]    value = %d \n"
	.align 8
.LC3:
	.string	"int64_arr[2]    value = %lld \n"
	.align 8
.LC4:
	.string	"*(int32_ptr + 1)    value = %d \n"
	.align 8
.LC5:
	.string	"*(int64_ptr + 1)    value = %lld \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$12, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$24, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$101, int32_arr(%rip)
	movl	$202, int32_arr+4(%rip)
	movl	$303, int32_arr+8(%rip)
	movq	$555000, int64_arr(%rip)
	movq	$666000, int64_arr+8(%rip)
	movq	$777000, int64_arr+16(%rip)
	movl	int32_arr+8(%rip), %eax
	movl	%eax, -4(%rbp)
	movq	int64_arr+16(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	$int32_arr, -24(%rbp)
	movq	$int64_arr, -32(%rbp)
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	$222, (%rax)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	$666111, (%rax)
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
