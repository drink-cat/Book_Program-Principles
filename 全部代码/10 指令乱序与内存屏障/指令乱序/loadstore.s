	.file	"loadstore.c"
	.globl	ee
	.data
	.align 4
	.type	ee, @object
	.size	ee, 4
ee:
	.long	100
	.globl	ff
	.align 4
	.type	ff, @object
	.size	ff, 4
ff:
	.long	200
	.text
	.globl	func_load_load
	.type	func_load_load, @function
func_load_load:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	ee(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	ff(%rip), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	func_load_load, .-func_load_load
	.globl	func_load_store
	.type	func_load_store, @function
func_load_store:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	ee(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	$600, ff(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	func_load_store, .-func_load_store
	.globl	func_store_store
	.type	func_store_store, @function
func_store_store:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$500, ee(%rip)
	movl	$600, ff(%rip)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_store_store, .-func_store_store
	.globl	func_store_load
	.type	func_store_load, @function
func_store_load:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$500, ee(%rip)
	movl	ff(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	ee(%rip), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_store_load, .-func_store_load
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
