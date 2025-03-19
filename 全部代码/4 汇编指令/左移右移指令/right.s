.data 

num32: 
    .long 0x0

num64 : 
    .quad 0x0

str_num32 : 
    .string "  int32 = %#19X   \n"

str_num64 : 
    .string "  int64 = %#19llX   \n"

str_num32_cmp : 
    .string "  int32   shr = %#10X   sar = %#10X \n"

.text 
.global main 

main : 
    pushq %rbp
    movq %rsp, %rbp 
    subq $64 , %rsp 

    # 32位。操作寄存器
    movl $0x88888888, %r8d 
    shrl $8 , %r8d          # 逻辑右移
    movq $str_num32 , %rdi 
    movl %r8d , %esi 
    callq printf 

    # 32位。操作栈
    movl $0x77777777, -4(%rbp) 
    shrl $8 , -4(%rbp)      # 逻辑右移
    movq $str_num32 , %rdi 
    movl -4(%rbp)  , %esi 
    callq printf 

    # 32位。操作数据段
    movl $0x66666666, num32(%rip) 
    shrl $8 , num32(%rip)   # 逻辑右移
    movq $str_num32 , %rdi 
    movl num32(%rip) , %esi 
    callq printf 

    # 64位。移动32位。操作寄存器
    movq $0x3333333355555555, %rcx 
    shrl $8 , %ecx          # 逻辑右移。高位清0
    movq $str_num64 , %rdi 
    movq %rcx , %rsi 
    callq printf 

    # 64位。移动32位。操作数据段
    movq $0x3333333355555555, %rcx 
    movq %rcx , num64(%rip)
    shrl $8 , num64(%rip)   # 逻辑右移。
    movq $str_num64 , %rdi 
    movq num64(%rip) , %rsi 
    callq printf 

    # 32位。操作寄存器。左侧高位为0
    movl $0x33333333, %ebx 
    shrl $8 , %ebx          # 逻辑右移。左侧补0
    movl $0x33333333, %r8d 
    sarl $8 , %r8d          # 算术右移。左侧补符号位
    movq $str_num32_cmp , %rdi 
    movl %ebx , %esi 
    movl %r8d , %edx 
    callq printf 

    # 32位。操作寄存器。左侧高位为1
    movl $0x88888888, %ebx 
    shrl $8 , %ebx          # 逻辑右移。左侧补0
    movl $0x88888888, %r8d 
    sarl $8 , %r8d          # 算术右移。左侧补符号位
    movq $str_num32_cmp , %rdi 
    movl %ebx , %esi 
    movl %r8d , %edx 
    callq printf 

    # 16位。操作寄存器
    movl $0x55667788, %ebx 
    shrw $4, %bx            # 逻辑右移。
    movq $str_num32, %rdi 
    movl %ebx, %esi 
    callq printf 

    # 8位。操作寄存器
    movl $0x55667788, %ebx 
    shrb $4, %bl            # 逻辑右移。
    movq $str_num32, %rdi 
    movl %ebx, %esi 
    callq printf 

    addq $64 , %rsp 
    popq %rbp 
    retq 
