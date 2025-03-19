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
    movq $0x0F0F0F0F0F0F0F0F, %rax  # 64位，寄存器
    notq %rax                       # 64位，位非
    movq $str64, %rdi 
    movq %rax, %rsi 
    callq printf 

    # 32位。操作寄存器
    movl $0xAAAA7777, %ecx  # 32位，寄存器
    notl %ecx               # 32位，位非
    movq $str32, %rdi 
    movl %ecx, %esi 
    callq printf 

    # 32位。操作栈内存
    movl $0xAAAA7777, -8(%rbp)  # 32位，栈
    notl -8(%rbp)               # 32位，位非
    movq $str32, %rdi 
    movl -8(%rbp) , %esi 
    callq printf 

    # 16位。操作寄存器
    movl $0xAAAAAAAA, %ebx  # 32位，占位 
    movw $0xCCCC, %bx       # 16位，寄存器 
    notw %bx                # 16位，位非 
    movq $str32, %rdi 
    movl %ebx, %esi 
    callq printf 

    # 8位。操作寄存器
    movl $0xAAAAAAAA, %ebx  # 32位，占位 
    movb $0xCC, %bl         # 8位，寄存器 
    notb %bl                # 8位，位非 
    movq $str32, %rdi 
    movl %ebx, %esi 
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq 
