	.file	"loadstore.c"
	.text
	.p2align 4,,15
	.globl	func_load_load
	.type	func_load_load, @function
func_load_load:
.LFB0:
	.cfi_startproc
	movl	ee(%rip), %eax
	addl	ff(%rip), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	func_load_load, .-func_load_load
	.p2align 4,,15
	.globl	func_load_store
	.type	func_load_store, @function
func_load_store:
.LFB1:
	.cfi_startproc
	movl	$600, ff(%rip)
	movl	ee(%rip), %eax
	ret
	.cfi_endproc
.LFE1:
	.size	func_load_store, .-func_load_store
	.p2align 4,,15
	.globl	func_store_store
	.type	func_store_store, @function
func_store_store:
.LFB2:
	.cfi_startproc
	movl	$500, ee(%rip)
	movl	$600, ff(%rip)
	ret
	.cfi_endproc
.LFE2:
	.size	func_store_store, .-func_store_store
	.p2align 4,,15
	.globl	func_store_load
	.type	func_store_load, @function
func_store_load:
.LFB3:
	.cfi_startproc
	movl	ff(%rip), %eax
	movl	$500, ee(%rip)
	addl	$500, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	func_store_load, .-func_store_load
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
