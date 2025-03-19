.data

num_int64: 
    .quad 0x0 

str_int64:
    .string "addl  int64  value = %#llX \n"

str_flow_int32:
    .string "flow  int32  value = %#X \n"

str_flow_int64:
    .string "flow  int64  value = %#llX \n"

.text
.global main

main : 
    pushq %rbp
    movq %rsp, %rbp 

    # 64位变量，执行32位加法。操作数据段
    movq $0x3333333355555555, %r9 
    movq %r9, num_int64(%rip)
    addl $0x11111111, num_int64(%rip) 
    movq num_int64(%rip), %rsi 
    leaq str_int64(%rip), %rdi 
    callq printf

    # 32位变量，32位溢出。操作寄存器
    movl $0xFFFFFFFF, %edx
    addl $0x2, %edx 
    leaq str_flow_int32(%rip), %rdi 
    movl %edx, %esi
    callq printf 

    # 64位变量，32位溢出。操作寄存器
    movq $0x55555555FFFFFFFF, %rbx 
    addl $0x2, %ebx    # 导致高位清零
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，16位溢出。操作寄存器
    movq $0x55555555FFFFFFFF, %rbx 
    addw $0x2, %bx    
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，8位溢出。操作寄存器
    movq $0x55555555FFFFFFFF, %rbx 
    addb $0x2, %bh    
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，8位溢出。操作寄存器
    movq $0x55555555FFFFFFFF, %rbx 
    addb $0x2, %bl    
    leaq str_flow_int64(%rip), %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位变量，32位溢出。操作数据段
    movq $0x55555555FFFFFFFF, %r9 
    movq %r9, num_int64(%rip)
    addl $0x2, num_int64(%rip)
    leaq str_flow_int64(%rip), %rdi 
    movq num_int64(%rip), %rsi 
    callq printf 

    popq %rbp
    retq 
