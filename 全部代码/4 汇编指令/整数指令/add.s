.data

num_int64: 
    .quad 0x0  # 64位

str_int8:
    .string "  int8   value = %#X \n"

str_int16:
    .string "  int16  value = %#X \n"

str_int32:
    .string "  int32  value = %#X \n"

str_int64:
    .string "  int64  value = %lld \n"

.text
.global main

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64 , %rsp 

    # 64位。操作寄存器
    movq $2000, %rcx
    addq $3, %rcx       # 应用于寄存器
    movq $str_int64, %rdi 
    movq %rcx, %rsi
    callq printf

    # 64位。操作栈
    movq $2000, -8(%rbp) 
    addq $5, -8(%rbp)   # 应用于栈
    movq $str_int64, %rdi 
    movq -8(%rbp) , %rsi
    callq printf

    # 64位。操作数据段
    movq $2000, num_int64(%rip) 
    addq $7, num_int64(%rip)    # 应用于数据段
    leaq str_int64(%rip), %rdi 
    movq num_int64(%rip) , %rsi 
    callq printf 

    # 8位。操作寄存器
    movb $0x22, %al     # 写1个字节   
    addb $0x11, %al     # 加法，8位
    movzbl %al, %esi    # 把1个字节扩展为4个字节
    leaq str_int8(%rip), %rdi 
    callq printf 

    # 16位。操作寄存器
    movw $0x3333, %ax   # 写2个字节
    addw $0x2222, %ax   # 加法，16位
    movzwl %ax, %esi    # 把2个字节扩展为4个字节
    leaq str_int16(%rip), %rdi 
    callq printf 

    # 32位。操作寄存器
    movl $0x55555555, %esi # 写4个字节
    addl $0x2222, %esi     # 加法，32位
    leaq str_int32(%rip), %rdi 
    callq printf 

    addq $64 , %rsp 
    popq %rbp
    retq 
