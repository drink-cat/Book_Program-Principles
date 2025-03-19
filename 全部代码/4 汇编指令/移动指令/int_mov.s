.data

int64_aa :      # 64位整数
    .quad 0x1 

int32_bb :      # 32位整数数组
    .long 0x2   # 元素1
    .long 0x3   # 元素2

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 立即数与寄存器、内存
    movq $0x7172, %rax              # 64位，把0x7172写到rax
    movq $0x7172, int64_aa(%rip)    # 64位，把0x7172写到变量int64_aa
    movq $0x7172, -16(%rbp)         # 64位，把0x7172写到内存(rbp-16)
    movl $0x6162, int32_bb+4(%rip)  # 32位，把0x6162写到变量(int32_bb+4)
    movl $0x6162, %ecx      # 32位，把0x6162写到ecx
    movw $0x6162, %cx       # 16位，把0x6162写到cx 
    movw $0x6162, -8(%rbp)  # 16位，把0x6162写到内存(rbp-8)
    movb $0x61, %cl         # 8位，把0x61写到cl
    movb $0x61, -8(%rbp)    # 8位，把0x61写到内存(rbp-8)

    # 寄存器与寄存器
    movq %rcx, %rax     # 64位，把rcx写到rax
    movl %ecx, %eax     # 32位，把ecx写到eax
    movw %cx, %ax       # 16位，把cx写到ax
    movb %cl, %al       # 8位，把cl写到al
    movb %ch, %ah       # 8位，把ch写到ah

    # 寄存器与变量内存
    movq %rax, int64_aa(%rip)   # 64位，把rax写到变量int64_aa
    movq int64_aa(%rip), %rax   # 64位，把变量int64_aa写到rax
    movl %ebx, int32_bb+4(%rip) # 32位，把ebx写到变量(int32_bb+4)
    movl int32_bb+4(%rip), %ebx # 32位，把变量(int32_bb+4)写到ebx
    movw %bx, int32_bb(%rip)    # 16位，把bx写到变量int32_bb
    movw int32_bb(%rip), %bx    # 16位，把变量int32_bb写到bx
    movb %bl, int32_bb(%rip)    # 8位，把bl写到变量int32_bb
    movb int32_bb(%rip), %bl    # 8位，把变量int32_bb写到bl

    # 寄存器与栈内存
    movq %rax, -16(%rbp)    # 64位，把rax写到内存(rbp-16) 
    movq -16(%rbp), %rax    # 64位，把内存(rbp-16)写到rax 
    movl %eax, -16(%rbp)    # 32位，把eax写到内存(rbp-16) 
    movl -16(%rbp), %eax    # 32位，把内存(rbp-16)写到eax 
    movw %ax, -16(%rbp)     # 16位，把ax写到内存(rbp-16) 
    movw -16(%rbp), %ax     # 16位，把内存(rbp-16)写到ax 
    movb %al, -16(%rbp)     # 8位，把al写到内存(rbp-16) 
    movb -16(%rbp), %al     # 8位，把内存(rbp-16)写到al 

    addq $64, %rsp 
    popq %rbp 
    retq 
