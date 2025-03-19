	.file	"offset_field.c"
	.section	.rodata
.LC0:
	.string	"River addr = %llu \n"
.LC1:
	.string	"Fish  addr = %llu \n"
	.align 8
.LC2:
	.string	"River width = %d  depth = %d \n"
.LC3:
	.string	"Fish  length = %lld \n"
	.text
	.globl	func_river
	.type	func_river, @function
func_river:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	$8, -8(%rbp)
	movq	-40(%rbp), %rax
	subq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$10, %edi
	call	putchar
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_river, .-func_river
	.section	.rodata
	.align 8
.LC4:
	.string	"Fish {length=%lld} is swimming in River {width=%d depth=%d} \n"
	.text
	.globl	func_fish_swim
	.type	func_fish_swim, @function
func_fish_swim:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_fish_swim, .-func_fish_swim
	.comm	fish,24,16
	.section	.rodata
.LC5:
	.string	"river_off1 = %llu \n"
.LC6:
	.string	"river_off2 = %llu \n"
.LC7:
	.string	"river_depth_off = %llu \n"
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
	subq	$48, %rsp
	movq	$8, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	$0, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movq	$12, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movq	$100, fish(%rip)
	movl	$3, fish+8(%rip)
	movl	$2, fish+12(%rip)
	movq	$func_fish_swim, fish+16(%rip)
	movl	$fish+8, %edi
	call	func_river
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
