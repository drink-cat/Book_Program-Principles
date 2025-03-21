	.file	"struct_array.c"
	.globl	desk_arr
	.data
	.align 16
	.type	desk_arr, @object
	.size	desk_arr, 24
desk_arr:
	.long	5000
	.value	600
	.zero	2
	.zero	16
	.section	.rodata
.LC0:
	.string	"struct size = %d \n"
.LC1:
	.string	"array  size = %d \n"
.LC2:
	.string	"desk_arr[2].length = %d \n"
.LC3:
	.string	"desk_arr[2].width  = %d \n"
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
	subq	$16, %rsp
	movl	$8, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$24, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$1000, desk_arr+16(%rip)
	movw	$200, desk_arr+20(%rip)
	movl	desk_arr+16(%rip), %eax
	movl	%eax, -4(%rbp)
	movzwl	desk_arr+20(%rip), %eax
	movw	%ax, -6(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movswl	-6(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
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
