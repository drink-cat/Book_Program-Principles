	.file	"bit_field.c"
	.section	.rodata
.LC0:
	.string	"%s = "
.LC1:
	.string	"%d "
.LC2:
	.string	" "
	.text
	.globl	print_bit
	.type	print_bit, @function
print_bit:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	movl	-28(%rbp), %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L3
	movl	$.LC2, %edi
	call	puts
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_bit, .-print_bit
	.comm	header,2,2
	.section	.rodata
.LC3:
	.string	"struct size = %d \n"
.LC4:
	.string	"struct addr = %p \n"
.LC5:
	.string	"header.open1  = %u \n"
.LC6:
	.string	"header.close1 = %d \n"
.LC7:
	.string	"header.ping2  = %d \n"
.LC8:
	.string	"header.urg4   = %d  %#X \n"
.LC9:
	.string	"header.seq8   = %d  %#X \n"
.LC10:
	.string	"byte[0] = %#hhX \n"
.LC11:
	.string	"byte[1] = %#hhX \n"
.LC12:
	.string	"byte[0]"
.LC13:
	.string	"byte[1]"
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
	subq	$32, %rsp
	movl	$2, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movzbl	header(%rip), %eax
	orl	$1, %eax
	movb	%al, header(%rip)
	movzbl	header(%rip), %eax
	orl	$2, %eax
	movb	%al, header(%rip)
	movzbl	header(%rip), %eax
	andl	$-13, %eax
	orl	$8, %eax
	movb	%al, header(%rip)
	movzbl	header(%rip), %eax
	andl	$15, %eax
	orl	$-48, %eax
	movb	%al, header(%rip)
	movb	$55, header+1(%rip)
	movl	$header, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movzbl	header(%rip), %eax
	andl	$1, %eax
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movzbl	header(%rip), %eax
	shrb	%al
	andl	$1, %eax
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movzbl	header(%rip), %eax
	shrb	$2, %al
	andl	$3, %eax
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movzbl	header(%rip), %eax
	shrb	$4, %al
	movzbl	%al, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movzbl	header+1(%rip), %eax
	movzbl	%al, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movq	$header, -32(%rbp)
	movl	$10, %edi
	call	putchar
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	$8, %edx
	movl	%eax, %esi
	movl	$.LC12, %edi
	call	print_bit
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	$8, %edx
	movl	%eax, %esi
	movl	$.LC13, %edi
	call	print_bit
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
