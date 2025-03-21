	.file	"with_volatile.c"
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
	movl	$0, loop_mark(%rip)
	movl	loop_mark(%rip), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
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
	movl	%eax, num_bb(%rip)
	movl	$5, num_cc(%rip)
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
	movq	loop_count(%rip), %rax
	movabsq	$9000000000000, %rcx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	addq	$1, %rax
	cmpq	%rcx, %rax
	jg	.L9
.L5:
	movl	loop_mark(%rip), %edx
	testl	%edx, %edx
	jne	.L7
.L9:
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
	movl	num_aa(%rip), %eax
	movl	$.LC1, %edi
	movl	%eax, num_bb(%rip)
	movl	$5, num_cc(%rip)
	xorl	%eax, %eax
	movl	num_cc(%rip), %edx
	movl	num_bb(%rip), %esi
	call	printf
	leaq	8(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$thread_func, %edx
	xorl	%esi, %esi
	call	pthread_create
	movq	loop_count(%rip), %rax
	movabsq	$9000000000000, %rcx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L14:
	addq	$1, %rax
	cmpq	%rcx, %rax
	jg	.L18
.L12:
	movl	loop_mark(%rip), %edx
	testl	%edx, %edx
	jne	.L14
.L18:
	movq	%rax, loop_count(%rip)
	movq	loop_count(%rip), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	sleep
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
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
