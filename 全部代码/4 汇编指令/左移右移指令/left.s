.data 

num32: 
    .long 0x0

num64 : 
    .quad 0x0

str_num32 : 
    .string "  int32 = %#X   \n"

str_num64 : 
    .string "  int64 = %#llX   \n"

str_num32_cmp :     # 对比
    .string "  int32  shl = %#X   sal = %#X \n"

.text 
.global main 

main : 
    pushq %rbp
    movq %rsp, %rbp 
    subq $64 , %rsp 

    # 32位。操作寄存器
    movl $0x88888888, %r8d 
    shll $8 , %r8d          # 逻辑左移
    movq $str_num32 , %rdi 
    movl %r8d , %esi 
    callq printf 

    # 32位。操作栈内存
    movl $0x77777777, -4(%rbp) 
    shll $8 , -4(%rbp)      # 逻辑左移
    movq $str_num32 , %rdi 
    movl -4(%rbp)  , %esi 
    callq printf 

    # 32位。操作数据段内存
    movl $0x66666666, num32(%rip) 
    shll $8 , num32(%rip)   # 逻辑左移
    movq $str_num32 , %rdi 
    movl num32(%rip) , %esi 
    callq printf 

    # 64位。移动32位。操作寄存器
    movq $0x3333333355555555, %rcx 
    shll $8 , %ecx          # 逻辑左移。高位清0
    movq $str_num64 , %rdi 
    movq %rcx , %rsi 
    callq printf 

    # 64位。移动32位。操作数据段
    movq $0x3333333355555555, %rcx 
    movq %rcx , num64(%rip)
    shll $8 , num64(%rip)   # 逻辑左移。
    movq $str_num64 , %rdi 
    movq num64(%rip), %rsi 
    callq printf 

    # 32位。操作寄存器。右侧低位为1 
    movl $0x11111111, %ebx 
    shll $8 , %ebx          # 逻辑左移
    movl $0x11111111, %r8d 
    sall $8 , %r8d          # 算术左移
    movq $str_num32_cmp , %rdi 
    movl %ebx , %esi 
    movl %r8d , %edx 
    callq printf 

    # 64位。操作寄存器
    movq $0x2222222233333333, %rcx 
    shlq $16 , %rcx          # 逻辑左移。
    movq $str_num64 , %rdi 
    movq %rcx , %rsi 
    callq printf 

    # 16位。操作寄存器
    movl $0x55667788, %ebx 
    shlw $4, %bx            # 逻辑左移。
    movq $str_num32, %rdi 
    movl %ebx, %esi 
    callq printf 

    # 8位。操作寄存器
    movl $0x55667788, %ebx 
    shlb $4, %bl            # 逻辑左移。
    movq $str_num32, %rdi 
    movl %ebx, %esi 
    callq printf 

    addq $64 , %rsp 
    popq %rbp 
    retq 
