.data

str64 : 
    .string " int64  %#llX \n"

str32 : 
    .string " int32  %#X \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 64位。操作寄存器
    movq $0x1010101010101010, %rax  # 64位，寄存器
    movq $0x0101010101010101, %rbx  # 64位，寄存器
    xorq %rbx, %rax                 # 64位，位异或
    movq $str64, %rdi 
    movq %rax, %rsi 
    callq printf 

    # 64位。操作寄存器
    movq $0x55667788AABBCCDD, %rbx  # 64位，寄存器
    xorq %rbx, %rbx                 # 64位，位异或
    movq $str64, %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 32位。操作寄存器
    movl $0xAABBCCDD, %ecx  # 32位，寄存器
    movl $0x00BBFF00, %edx  # 32位，寄存器
    xorl %edx, %ecx         # 32位，位异或
    movq $str32, %rdi 
    movl %ecx, %esi 
    callq printf 

    # 32位。操作栈内存
    movl $0xAABBCCDD, -8(%rbp)  # 32位，栈
    xorl $0x00BBFF00, -8(%rbp)  # 32位，位异或
    movq $str32, %rdi 
    movl -8(%rbp) , %esi 
    callq printf 

    # 16位。操作寄存器
    movl $0xAAAAAAAA, %ebx  # 32位，占位 
    movw $0xCCCC, %bx       # 16位，寄存器 
    xorw $0xFF00, %bx       # 16位，位异或 
    movq $str32, %rdi 
    movl %ebx, %esi 
    callq printf 

    # 8位。操作寄存器
    movl $0xAAAAAAAA, %ebx  # 32位，占位 
    movb $0xCC, %bl         # 8位，寄存器 
    xorb $0xFF, %bl         # 8位，位异或 
    movq $str32, %rdi 
    movl %ebx, %esi 
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq 
