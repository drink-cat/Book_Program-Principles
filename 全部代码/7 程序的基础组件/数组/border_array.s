	.file	"border_array.c"
	.globl	array
	.data
	.align 4
	.type	array, @object
	.size	array, 8
array:
	.long	-1583176796
	.long	-1313688652
	.globl	bb16
	.align 2
	.type	bb16, @object
	.size	bb16, 2
bb16:
	.value	-15934
	.globl	cc16
	.align 2
	.type	cc16, @object
	.size	cc16, 2
cc16:
	.value	-11822
	.globl	dd32
	.align 4
	.type	dd32, @object
	.size	dd32, 4
dd32:
	.long	-505224220
	.section	.rodata
	.align 8
.LC0:
	.string	"%8s    addr = %#X  %llu    size = %d \n"
	.text
	.globl	print_param
	.type	print_param, @function
print_param:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_param, .-print_param
	.section	.rodata
.LC1:
	.string	"  int32 = %13d  %#13X \n"
	.text
	.globl	print_int32
	.type	print_int32, @function
print_int32:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edx
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
	.size	print_int32, .-print_int32
	.section	.rodata
.LC2:
	.string	"array"
.LC3:
	.string	"bb16"
.LC4:
	.string	"cc16"
.LC5:
	.string	"dd32"
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
	movl	$array, %eax
	movl	$8, %edx
	movq	%rax, %rsi
	movl	$.LC2, %edi
	call	print_param
	movl	$bb16, %eax
	movl	$2, %edx
	movq	%rax, %rsi
	movl	$.LC3, %edi
	call	print_param
	movl	$cc16, %eax
	movl	$2, %edx
	movq	%rax, %rsi
	movl	$.LC4, %edi
	call	print_param
	movl	$dd32, %eax
	movl	$4, %edx
	movq	%rax, %rsi
	movl	$.LC5, %edi
	call	print_param
	movl	array(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	array+4(%rip), %eax
	movl	%eax, -8(%rbp)
	movl	array+8(%rip), %eax
	movl	%eax, -12(%rbp)
	movl	array+12(%rip), %eax
	movl	%eax, -16(%rbp)
	movl	$10, %edi
	call	putchar
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	print_int32
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	print_int32
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	print_int32
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	print_int32
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
