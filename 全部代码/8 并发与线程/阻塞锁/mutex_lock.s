	.file	"mutex_lock.c"
	.globl	mutexlock
	.data
	.align 32
	.type	mutexlock, @object
	.size	mutexlock, 40
mutexlock:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.zero	20
	.comm	mutexattr,4,4
	.section	.rodata
	.align 8
.LC0:
	.string	" %s  __lock=%d __count=%d __owner=%d \n"
	.text
	.globl	print_lock
	.type	print_lock, @function
print_lock:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	mutexlock+8(%rip), %esi
	movl	mutexlock+4(%rip), %ecx
	movl	mutexlock(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_lock, .-print_lock
	.section	.rodata
.LC1:
	.string	" son os_tid = %d  got lock \n"
.LC2:
	.string	"son lock"
	.text
	.globl	thread_func_lock
	.type	thread_func_lock, @function
thread_func_lock:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$186, %edi
	movl	$0, %eax
	call	syscall
	movl	%eax, -4(%rbp)
	movl	$mutexlock, %edi
	call	pthread_mutex_lock
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	sleep
	movl	$.LC2, %edi
	call	print_lock
	movl	$mutexlock, %edi
	call	pthread_mutex_unlock
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	thread_func_lock, .-thread_func_lock
	.globl	create_thread
	.type	create_thread, @function
create_thread:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-8(%rbp), %rax
	movl	$0, %ecx
	movl	$thread_func_lock, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create
	leaq	-16(%rbp), %rax
	movl	$0, %ecx
	movl	$thread_func_lock, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	create_thread, .-create_thread
	.section	.rodata
.LC3:
	.string	" main os_tid = %d \n"
.LC4:
	.string	" pthread_mutex_t size = %d \n"
.LC5:
	.string	"main init"
.LC6:
	.string	"main lock1"
.LC7:
	.string	"main lock2"
.LC8:
	.string	"main unlock1"
.LC9:
	.string	"main unlock2"
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
	movl	$186, %edi
	movl	$0, %eax
	call	syscall
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$40, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$mutexattr, %edi
	call	pthread_mutexattr_init
	movl	$1, %esi
	movl	$mutexattr, %edi
	call	pthread_mutexattr_settype
	movl	$mutexattr, %esi
	movl	$mutexlock, %edi
	call	pthread_mutex_init
	movl	$.LC5, %edi
	call	print_lock
	movl	$mutexlock, %edi
	call	pthread_mutex_lock
	movl	$.LC6, %edi
	call	print_lock
	movl	$0, %eax
	call	create_thread
	movl	$1, %edi
	call	sleep
	movl	$mutexlock, %edi
	call	pthread_mutex_lock
	movl	$.LC7, %edi
	call	print_lock
	movl	$mutexlock, %edi
	call	pthread_mutex_unlock
	movl	$.LC8, %edi
	call	print_lock
	movl	$mutexlock, %edi
	call	pthread_mutex_unlock
	movl	$.LC9, %edi
	call	print_lock
	movl	$5, %edi
	call	sleep
	movl	$mutexlock, %edi
	call	pthread_mutex_destroy
	movl	$mutexattr, %edi
	call	pthread_mutexattr_destroy
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
