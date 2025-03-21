	.file	"without_volatile.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	" thread change loop_mark to %d \n"
	.text
	.p2align 4,,15
	.globl	thread_func
	.type	thread_func, @function
thread_func:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %edi
	call	sleep
	xorl	%esi, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	$0, loop_mark(%rip)
	call	printf
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	thread_func, .-thread_func
	.p2align 4,,15
	.globl	func_order
	.type	func_order, @function
func_order:
.LFB21:
	.cfi_startproc
	movl	num_aa(%rip), %eax
	movl	$5, num_cc(%rip)
	movl	%eax, num_bb(%rip)
	ret
	.cfi_endproc
.LFE21:
	.size	func_order, .-func_order
	.p2align 4,,15
	.globl	func_loop
	.type	func_loop, @function
func_loop:
.LFB22:
	.cfi_startproc
	movl	loop_mark(%rip), %edx
	movq	loop_count(%rip), %rax
	testl	%edx, %edx
	jne	.L10
	movq	%rax, loop_count(%rip)
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movabsq	$9000000000000, %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	addq	$1, %rax
	cmpq	%rdx, %rax
	jle	.L8
	movq	%rax, loop_count(%rip)
	ret
	.cfi_endproc
.LFE22:
	.size	func_loop, .-func_loop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	" num  bb = %d  cc = %d \n"
.LC2:
	.string	" loop  count = %lld \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	num_aa(%rip), %esi
	movl	$5, %edx
	movl	$.LC1, %edi
	xorl	%eax, %eax
	movl	$5, num_cc(%rip)
	movl	%esi, num_bb(%rip)
	call	printf
	leaq	8(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$thread_func, %edx
	xorl	%esi, %esi
	call	pthread_create
	movl	loop_mark(%rip), %edx
	movq	loop_count(%rip), %rax
	testl	%edx, %edx
	jne	.L18
.L12:
	movq	%rax, loop_count(%rip)
	movq	loop_count(%rip), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	movabsq	$9000000000000, %rdx
	.p2align 4,,10
	.p2align 3
.L15:
	addq	$1, %rax
	cmpq	%rdx, %rax
	jle	.L15
	jmp	.L12
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	loop_count
	.bss
	.align 8
	.type	loop_count, @object
	.size	loop_count, 8
loop_count:
	.zero	8
	.globl	loop_mark
	.data
	.align 4
	.type	loop_mark, @object
	.size	loop_mark, 4
loop_mark:
	.long	1
	.globl	num_cc
	.align 4
	.type	num_cc, @object
	.size	num_cc, 4
num_cc:
	.long	3
	.globl	num_bb
	.align 4
	.type	num_bb, @object
	.size	num_bb, 4
num_bb:
	.long	2
	.globl	num_aa
	.align 4
	.type	num_aa, @object
	.size	num_aa, 4
num_aa:
	.long	1
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
