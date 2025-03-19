	.file	"head.c"
	.section	.rodata
.LC0:
	.string	"Animal addr = %p \n"
	.align 8
.LC1:
	.string	"Animal %s with color %#x is sleeping \n\n"
	.text
	.globl	animal_sleep
	.type	animal_sleep, @function
animal_sleep:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	animal_sleep, .-animal_sleep
	.section	.rodata
.LC2:
	.string	"Bird addr = %p \n"
	.align 8
.LC3:
	.string	"Bird %s is flying at height %f \n\n"
	.text
	.globl	bird_fly
	.type	bird_fly, @function
bird_fly:
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
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	%rdx, %rsi
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	bird_fly, .-bird_fly
	.comm	lucy,32,32
	.section	.rodata
.LC5:
	.string	"struct Animal  size = %d \n\n"
.LC6:
	.string	"struct Bird    size = %d \n\n"
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
	movl	$2036561228, lucy(%rip)
	movb	$0, lucy+4(%rip)
	movl	$-237582153, lucy+16(%rip)
	movabsq	$4626978553912077844, %rax
	movq	%rax, lucy+24(%rip)
	movl	$20, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$32, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$lucy, %edi
	call	animal_sleep
	movl	$lucy, %edi
	call	bird_fly
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
