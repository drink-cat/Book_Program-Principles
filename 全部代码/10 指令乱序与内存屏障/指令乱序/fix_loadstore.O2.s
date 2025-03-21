	.file	"fix_loadstore.c"
	.text
	.p2align 4,,15
	.globl	func_load_store
	.type	func_load_store, @function
func_load_store:
.LFB0:
	.cfi_startproc
	movl	$600, ff(%rip)
	movl	ee(%rip), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	func_load_store, .-func_load_store
	.p2align 4,,15
	.globl	func_load_store_depend
	.type	func_load_store_depend, @function
func_load_store_depend:
.LFB1:
	.cfi_startproc
	movl	ee(%rip), %eax
	leal	600(%rax), %edx
	movl	%edx, ff(%rip)
	ret
	.cfi_endproc
.LFE1:
	.size	func_load_store_depend, .-func_load_store_depend
	.p2align 4,,15
	.globl	func_load_store_func
	.type	func_load_store_func, @function
func_load_store_func:
.LFB2:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	ee(%rip), %ebx
	xorl	%eax, %eax
	call	func_empty
	movl	%ebx, %eax
	movl	$600, ff(%rip)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_load_store_func, .-func_load_store_func
	.p2align 4,,15
	.globl	func_load_store_barrier
	.type	func_load_store_barrier, @function
func_load_store_barrier:
.LFB3:
	.cfi_startproc
	movl	ee(%rip), %eax
	movl	$600, ff(%rip)
	ret
	.cfi_endproc
.LFE3:
	.size	func_load_store_barrier, .-func_load_store_barrier
	.p2align 4,,15
	.globl	func_load_store_barrier2
	.type	func_load_store_barrier2, @function
func_load_store_barrier2:
.LFB4:
	.cfi_startproc
	movl	ee(%rip), %eax
#APP
# 44 "fix_loadstore.c" 1
	mfence
# 0 "" 2
#NO_APP
	movl	$600, ff(%rip)
	ret
	.cfi_endproc
.LFE4:
	.size	func_load_store_barrier2, .-func_load_store_barrier2
	.globl	ff
	.data
	.align 4
	.type	ff, @object
	.size	ff, 4
ff:
	.long	200
	.globl	ee
	.align 4
	.type	ee, @object
	.size	ee, 4
ee:
	.long	100
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
