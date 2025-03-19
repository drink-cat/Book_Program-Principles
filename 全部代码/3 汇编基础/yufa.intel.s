	.file	"yufa.c"
	.intel_syntax noprefix
	.globl	global_age
	.data
	.align 4
	.type	global_age, @object
	.size	global_age, 4
global_age:
	.long	300
	.section	.rodata
.LC0:
	.string	"age = %d \n"
	.text
	.globl	print_age
	.type	print_age, @function
print_age:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR [rbp-20], edi
	mov	eax, DWORD PTR [rbp-20]
	add	eax, 5
	mov	DWORD PTR [rbp-4], eax
	mov	eax, DWORD PTR [rbp-4]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC0
	mov	eax, 0
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_age, .-print_age
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR [rbp-4], 200
	mov	eax, DWORD PTR global_age[rip]
	mov	edi, eax
	call	print_age
	mov	eax, DWORD PTR [rbp-4]
	mov	edi, eax
	call	print_age
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
