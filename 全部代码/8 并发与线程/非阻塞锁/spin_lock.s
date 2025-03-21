	.file	"spin_lock.c"
	.globl	spinlock_aa
	.data
	.align 4
	.type	spinlock_aa, @object
	.size	spinlock_aa, 4
spinlock_aa:
	.long	3333
	.section	.rodata
.LC0:
	.string	" spinlock size = %d \n"
.LC1:
	.string	" after init . value = %d \n"
.LC2:
	.string	" after trylock . value = %d \n"
.LC3:
	.string	" after unlock . value = %d \n"
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
	movl	$4, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %esi
	movl	$spinlock_aa, %edi
	call	pthread_spin_init
	movl	spinlock_aa(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$spinlock_aa, %edi
	call	pthread_spin_trylock
	movl	spinlock_aa(%rip), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$spinlock_aa, %edi
	call	pthread_spin_unlock
	movl	spinlock_aa(%rip), %eax
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
