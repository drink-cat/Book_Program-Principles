	.file	"type_pointer.c"
	.globl	int32
	.data
	.align 4
	.type	int32, @object
	.size	int32, 4
int32:
	.long	200
	.globl	int32_ptr
	.align 8
	.type	int32_ptr, @object
	.size	int32_ptr, 8
int32_ptr:
	.quad	int32
	.globl	float64
	.align 8
	.type	float64, @object
	.size	float64, 8
float64:
	.long	1717986918
	.long	1082219622
	.globl	float64_ptr
	.align 8
	.type	float64_ptr, @object
	.size	float64_ptr, 8
float64_ptr:
	.quad	float64
	.globl	int16_arr
	.align 2
	.type	int16_arr, @object
	.size	int16_arr, 6
int16_arr:
	.value	7
	.value	8
	.value	9
	.globl	int16_arr_ptr
	.align 8
	.type	int16_arr_ptr, @object
	.size	int16_arr_ptr, 8
int16_arr_ptr:
	.quad	int16_arr+2
	.section	.rodata
	.align 8
.LC0:
	.string	" func Cat is running at speed %d \n"
	.text
	.globl	func_cat_run
	.type	func_cat_run, @function
func_cat_run:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_cat_run, .-func_cat_run
	.globl	func_ptr
	.data
	.align 8
	.type	func_ptr, @object
	.size	func_ptr, 8
func_ptr:
	.quad	func_cat_run
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
	movq	int32_ptr(%rip), %rax
	movl	$300, (%rax)
	movq	float64_ptr(%rip), %rdx
	movabsq	$4649075219193166561, %rax
	movq	%rax, (%rdx)
	movq	func_ptr(%rip), %rax
	movl	$77, %edi
	call	*%rax
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
