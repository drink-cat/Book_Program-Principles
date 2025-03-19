.data 

int64 : 
    .quad 333 

int32 : 
    .long 222 

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 比较整数。64位 
    cmpq %rcx, %rdx         # 比较寄存器与寄存器
    cmpq %rcx, int64(%rip)  # 比较寄存器与变量
    cmpq int64(%rip), %rcx  # 比较寄存器与变量
    cmpq %rcx, -8(%rbp)     # 比较寄存器与栈内存
    cmpq -8(%rbp), %rcx     # 比较寄存器与栈内存
    cmpq $0x77, %rdx        # 比较立即数与寄存器
    cmpq $0x77, int64(%rip) # 比较立即数与变量

    # 比较整数。32位
    cmpl %ecx, %edx        # 比较寄存器与寄存器
    cmpl %ecx, -4(%rbp)    # 比较寄存器与栈内存
    cmpl %ecx, int32(%rip) # 比较寄存器与变量
    cmpl $0x77, %edx       # 比较立即数与寄存器

    # 比较整数。16位
    cmpw %cx, %dx         # 比较寄存器与寄存器
    cmpw %cx, -2(%rbp)    # 比较寄存器与栈内存
    cmpw %cx, int32(%rip) # 比较寄存器与变量
    cmpw $0x77, %dx       # 比较立即数与寄存器

    # 比较整数。8位 
    cmpb %cl, %dl         # 比较寄存器与寄存器
    cmpb %cl, -1(%rbp)    # 比较寄存器与栈内存
    cmpb %cl, int32(%rip) # 比较寄存器与变量
    cmpb $0x77, %dl       # 比较立即数与寄存器

    addq $64, %rsp 
    popq %rbp 
    retq 
