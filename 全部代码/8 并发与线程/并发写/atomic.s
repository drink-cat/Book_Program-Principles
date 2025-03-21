	.file	"atomic.c"
	.globl	eee
	.data
	.align 4
	.type	eee, @object
	.size	eee, 4
eee:
	.long	111
	.globl	lock
	.bss
	.align 4
	.type	lock, @object
	.size	lock, 4
lock:
	.zero	4
	.globl	exg
	.data
	.align 4
	.type	exg, @object
	.size	exg, 4
exg:
	.long	777
	.text
	.globl	func_spin_lock
	.type	func_spin_lock, @function
func_spin_lock:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
.L4:
	movq	-24(%rbp), %rdx
	movl	$0, %eax
	movl	$1, %ecx
	lock cmpxchgl	%ecx, (%rdx)
	sete	%al
	movb	%al, -1(%rbp)
	cmpb	$0, -1(%rbp)
	je	.L2
	jmp	.L5
.L2:
	jmp	.L4
.L5:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_spin_lock, .-func_spin_lock
	.section	.rodata
	.align 8
.LC0:
	.string	"after op . ret = %d  eee = %d \n"
	.align 8
.LC1:
	.string	"after op . ret2 = %d  eee = %d \n"
.LC2:
	.string	"after op . lock = %d \n"
	.align 8
.LC3:
	.string	"after op . ret3 = %d  lock = %d \n"
	.align 8
.LC4:
	.string	"after op . ret4 = %d  lock = %d \n"
	.align 8
.LC5:
	.string	"after exchange . retOld = %d  exg = %d \n"
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
	subq	$16, %rsp
	movl	$111, -12(%rbp)
	leaq	-12(%rbp), %rdx
	movl	(%rdx), %eax
	movl	$222, %ecx
	lock cmpxchgl	%ecx, eee(%rip)
	movl	%eax, %ecx
	sete	%al
	testb	%al, %al
	jne	.L7
	movl	%ecx, (%rdx)
.L7:
	movb	%al, -1(%rbp)
	movl	eee(%rip), %edx
	movzbl	-1(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-12(%rbp), %rdx
	movl	(%rdx), %eax
	movl	$333, %ecx
	lock cmpxchgl	%ecx, eee(%rip)
	movl	%eax, %ecx
	sete	%al
	testb	%al, %al
	jne	.L8
	movl	%ecx, (%rdx)
.L8:
	movb	%al, -2(%rbp)
	movl	eee(%rip), %edx
	movzbl	-2(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$lock, %edi
	call	func_spin_lock
	movl	lock(%rip), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %eax
	movl	$333, %edx
	lock cmpxchgl	%edx, lock(%rip)
	sete	%al
	movb	%al, -3(%rbp)
	movl	lock(%rip), %edx
	movzbl	-3(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$555, %eax
	movl	$666, %edx
	lock cmpxchgl	%edx, lock(%rip)
	sete	%al
	movb	%al, -4(%rbp)
	movl	lock(%rip), %edx
	movzbl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$999, %eax
	xchgl	exg(%rip), %eax
	movl	%eax, -8(%rbp)
	movl	exg(%rip), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
