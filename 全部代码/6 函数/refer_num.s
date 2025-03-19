	.file	"refer_num.c"
	.text
	.globl	func_value_num
	.type	func_value_num, @function
func_value_num:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$3, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_value_num, .-func_value_num
	.globl	func_refer_num_pointer
	.type	func_refer_num_pointer, @function
func_refer_num_pointer:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$11, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_refer_num_pointer, .-func_refer_num_pointer
	.globl	func_refer_num_u64
	.type	func_refer_num_u64, @function
func_refer_num_u64:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$2023, (%rax)
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_refer_num_u64, .-func_refer_num_u64
	.globl	day
	.data
	.align 4
	.type	day, @object
	.size	day, 4
day:
	.long	2
	.globl	month
	.align 4
	.type	month, @object
	.size	month, 4
month:
	.long	9
	.globl	year
	.align 4
	.type	year, @object
	.size	year, 4
year:
	.long	1970
	.section	.rodata
.LC0:
	.string	"\345\200\274\344\274\240\351\200\222\357\274\232  "
.LC1:
	.string	"   \350\260\203\347\224\250\345\211\215 = %d  \n"
.LC2:
	.string	"   \350\260\203\347\224\250\345\220\216 = %d  \n"
.LC3:
	.string	"   \350\277\224\345\233\236\345\200\274 = %d  \n"
	.align 8
.LC4:
	.string	"\345\274\225\347\224\250\344\274\240\351\200\222\357\274\214\346\214\207\351\222\210\346\250\241\345\274\217\357\274\232  "
.LC5:
	.string	"   \350\277\224\345\233\236\345\200\274 = %p  \n"
	.align 8
.LC6:
	.string	"\345\274\225\347\224\250\344\274\240\351\200\222\357\274\21464\344\275\215\345\234\260\345\235\200\346\250\241\345\274\217\357\274\232  "
.LC7:
	.string	"   \350\277\224\345\233\236\345\200\274 = %#llx  \n"
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
	subq	$32, %rsp
	movl	$.LC0, %edi
	call	puts
	movl	day(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	day(%rip), %eax
	movl	%eax, %edi
	call	func_value_num
	movl	%eax, -4(%rbp)
	movl	day(%rip), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$.LC4, %edi
	call	puts
	movl	month(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$month, %edi
	call	func_refer_num_pointer
	movq	%rax, -16(%rbp)
	movl	month(%rip), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$.LC6, %edi
	call	puts
	movl	year(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	$year, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	func_refer_num_u64
	movq	%rax, -32(%rbp)
	movl	year(%rip), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
