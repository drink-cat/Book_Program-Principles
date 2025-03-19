	.file	"refer.c"
	.globl	tom
	.data
	.align 16
	.type	tom, @object
	.size	tom, 24
tom:
	.quad	555
	.quad	33
	.quad	22
	.comm	copy,24,16
	.comm	refer,8,8
	.section	.rodata
.LC0:
	.string	"tom    addr = %p \n"
.LC1:
	.string	"copy   addr = %p \n"
	.align 8
.LC2:
	.string	"refer  addr = %p  value = %#llx \n"
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
	movq	tom(%rip), %rax
	movq	%rax, copy(%rip)
	movq	tom+8(%rip), %rax
	movq	%rax, copy+8(%rip)
	movq	tom+16(%rip), %rax
	movq	%rax, copy+16(%rip)
	movq	$tom, refer(%rip)
	movl	$tom, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$copy, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	refer(%rip), %rax
	movq	%rax, %rdx
	movl	$refer, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
