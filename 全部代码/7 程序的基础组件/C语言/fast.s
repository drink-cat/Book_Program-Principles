	.file	"fast.c"
	.globl	int32_aa
	.data
	.align 4
	.type	int32_aa, @object
	.size	int32_aa, 4
int32_aa:
	.long	287454020
	.globl	int32_bb
	.align 4
	.type	int32_bb, @object
	.size	int32_bb, 4
int32_bb:
	.long	1432778632
	.globl	int32_arr
	.align 4
	.type	int32_arr, @object
	.size	int32_arr, 8
int32_arr:
	.long	-858993460
	.long	-572662307
	.globl	cat_tom
	.align 4
	.type	cat_tom, @object
	.size	cat_tom, 8
cat_tom:
	.long	-1583176796
	.long	-1313688652
	.section	.rodata
	.align 8
.LC0:
	.string	" func Bird is flying at height %d \n"
	.text
	.globl	func_bird_fly
	.type	func_bird_fly, @function
func_bird_fly:
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
	.size	func_bird_fly, .-func_bird_fly
	.section	.rodata
	.align 8
.LC1:
	.string	" func Cat is running at speed %d \n"
	.text
	.globl	func_cat_run
	.type	func_cat_run, @function
func_cat_run:
.LFB3:
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
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_cat_run, .-func_cat_run
	.comm	func_ptr,8,8
	.section	.rodata
	.align 8
.LC2:
	.string	" %15s   addr = %llu   value = %#X  \n"
	.text
	.globl	print_int32
	.type	print_int32, @function
print_int32:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_int32, .-print_int32
	.section	.rodata
.LC3:
	.string	"int32_aa"
.LC4:
	.string	"int32_bb"
.LC5:
	.string	"int32_arr[0]"
.LC6:
	.string	"int32_arr[1]"
.LC7:
	.string	"cat_age"
.LC8:
	.string	"cat_speed"
.LC9:
	.string	"\n === after modify int32 ===\n"
.LC10:
	.string	"\n === see func pointer ===\n"
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
	subq	$16, %rsp
	movl	$int32_aa, %esi
	movl	$.LC3, %edi
	call	print_int32
	movl	$int32_bb, %esi
	movl	$.LC4, %edi
	call	print_int32
	movl	$int32_arr, %esi
	movl	$.LC5, %edi
	call	print_int32
	movl	$int32_arr+4, %esi
	movl	$.LC6, %edi
	call	print_int32
	movl	$cat_tom, %esi
	movl	$.LC7, %edi
	call	print_int32
	movl	$cat_tom+4, %esi
	movl	$.LC8, %edi
	call	print_int32
	movl	$.LC9, %edi
	call	puts
	movq	$int32_aa, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$-1430532899, (%rax)
	movq	$cat_tom+4, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$-1044200508, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, int32_bb(%rip)
	movl	$int32_aa, %esi
	movl	$.LC3, %edi
	call	print_int32
	movl	$cat_tom+4, %esi
	movl	$.LC8, %edi
	call	print_int32
	movl	$.LC10, %edi
	call	puts
	movq	$func_bird_fly, func_ptr(%rip)
	movq	func_ptr(%rip), %rax
	movl	$200, %edi
	call	*%rax
	movq	$func_cat_run, func_ptr(%rip)
	movq	func_ptr(%rip), %rax
	movl	$300, %edi
	call	*%rax
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
