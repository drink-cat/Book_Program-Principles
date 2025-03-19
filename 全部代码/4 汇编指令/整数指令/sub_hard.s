.data

num_int64: 
    .quad 0x0 

str_int64:
    .string "subl  int64  value = %#llX \n"

str_flow_int32:
    .string "flow  int32  value = %#X \n"

str_flow_int64:
    .string "flow  int64  value = %#llX \n"

.text
.global main

main : 
    pushq %rbp
    movq %rsp, %rbp 

    # 64位变量，执行32位减法。操作数据段
    movq $0x3333333377777777, %r9 
    movq %r9, num_int64(%rip)
    subl $0x11111111, num_int64(%rip) 
    movq num_int64(%rip), %rsi 
    leaq str_int64(%rip), %rdi 
    callq printf

    # 32位变量，32位溢出。操作寄存器
    movl $0x00000001, %edx
    subl $0x2, %edx 
    leaq str_flow_int32(%rip), %rdi 
    movl %edx, %esi
    callq printf 

    # 64位变量，32位溢出。操作寄存器
    movq $0x5555555500000001, %rbx 
    subl $0x2, %ebx    # 导致高位清零
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，16位溢出。操作寄存器
    movq $0x5555555500000001, %rbx 
    subw $0x2, %bx    
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，8位溢出。操作寄存器
    movq $0x5555555500000001, %rbx 
    subb $0x2, %bh    
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，8位溢出。操作寄存器
    movq $0x5555555500000001, %rbx 
    subb $0x2, %bl    
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，32位溢出。操作数据段
    movq $0x5555555500000001, %r9 
    movq %r9, num_int64(%rip)
    subl $0x2, num_int64(%rip)
    leaq str_flow_int64(%rip), %rdi 
    movq num_int64(%rip), %rsi 
    callq printf 

    popq %rbp
    retq 
