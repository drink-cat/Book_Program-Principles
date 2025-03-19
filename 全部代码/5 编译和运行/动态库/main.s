	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"%-20s  addr = %#14llX"
.LC1:
	.string	"    value = %#X "
	.text
	.globl	print_symbol
	.type	print_symbol, @function
print_symbol:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	cmpl	$0, -20(%rbp)
	je	.L2
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
.L2:
	movl	$10, %edi
	call	putchar
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_symbol, .-print_symbol
	.globl	main_month
	.data
	.align 4
	.type	main_month, @object
	.size	main_month, 4
main_month:
	.long	-235736076
	.section	.rodata
.LC2:
	.string	"== main_print() == "
.LC3:
	.string	"shared_color"
.LC4:
	.string	"main_month"
.LC5:
	.string	"shared_dance()"
.LC6:
	.string	"printf()"
	.text
	.globl	main_print
	.type	main_print, @function
main_print:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	$shared_unused, -8(%rbp)
	movq	$shared_unused2, -16(%rbp)
	movl	$1118481, -20(%rbp)
	movq	$shared_color, -32(%rbp)
	movq	$main_month, -40(%rbp)
	movq	$shared_dance, -48(%rbp)
	movq	$printf, -56(%rbp)
	movl	$2236962, -60(%rbp)
	movl	shared_color(%rip), %eax
	movl	%eax, -64(%rbp)
	movl	main_month(%rip), %eax
	movl	%eax, -68(%rbp)
	movl	$3355443, -72(%rbp)
	movl	$.LC2, %edi
	call	puts
	movl	-64(%rbp), %edx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	call	print_symbol
	movl	-68(%rbp), %edx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	call	print_symbol
	movq	-48(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$.LC5, %edi
	call	print_symbol
	movq	-56(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$.LC6, %edi
	call	print_symbol
	movl	$10, %edi
	call	putchar
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main_print, .-main_print
	.section	.rodata
	.align 8
.LC7:
	.string	"== main  section  .GOT.PLT == "
	.align 8
.LC8:
	.string	"shared_dance_GOT_PLT  before call = %#14llX  \n"
	.align 8
.LC9:
	.string	"shared_dance_GOT_PLT  after  call = %#14llX  \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$1903326068, shared_color(%rip)
	movq	$6295600, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movl	$0, %eax
	call	shared_dance
	movl	$.LC7, %edi
	call	puts
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$0, %eax
	call	main_print
	movl	$900000, %edi
	call	sleep
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
