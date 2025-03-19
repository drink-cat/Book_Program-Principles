	.file	"name_cpp.cpp"
	.text
	.globl	_Z13study_at_2023diPc
	.type	_Z13study_at_2023diPc, @function
_Z13study_at_2023diPc:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movl	%edi, -12(%rbp)
	movq	%rsi, -24(%rbp)
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z13study_at_2023diPc, .-_Z13study_at_2023diPc
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
