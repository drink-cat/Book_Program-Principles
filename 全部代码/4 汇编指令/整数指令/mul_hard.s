.data 

str_r9 : 
    .string "int64  r9 = %#llX  rdx = %#X \n"

str_int32 : 
    .string "int32  edx = %#X  eax = %#X \n"

str_int64 : 
    .string "int64  rdx = %#llX  rax = %#llX \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 64位，三操作数，溢出
    movq $0x11111111, %rdx         # 写值，64位，rdx占位
    movq $0x3333333322222222, %r9  # 写值，64位，r9
    movq $0x55667788AABBCCDD, %r8  # 写值，64位，r8
    imulq $16, %r8, %r9            # r9 = 16 * r8
    movq $str_r9, %rdi 
    movq %r9, %rsi 
    movq %rdx, %rdx 
    callq printf 

    # 32位，三操作数，溢出
    movq $0x11111111, %rdx         # 写值，64位，rdx占位
    movq $0x3333333322222222, %r9  # 写值，64位，r9
    movl $0xAABBCCDD, %r8d         # 写值，32位，r8d
    imull $16 , %r8d , %r9d        # r9d = 16 * r8d 。高位清零
    movq $str_r9, %rdi 
    movq %r9 , %rsi  
    movq %rdx, %rdx 
    callq printf 

    # 32位，单操作数，溢出
    movl $0x22222222, %edx      # 写值，32位，edx占位
    movl $0x55667788, %eax      # 写值，32位，eax
    movl $1, %r8d 
    shll $12, %r8d              # 16进制，4位一组
    imull %r8d                  # 结果在 edx eax 
    movq $str_int32, %rdi 
    movl %edx, %esi 
    movl %eax, %edx 
    callq printf 

    # 32位，单操作数，有符号乘法，负数，溢出
    movl $0x22222222, %edx     # 写值，32位，edx占位
    movl $0xF6E6D6C6, %eax     # 写值，32位，eax，负数
    movl $1, %ecx 
    shll $12, %ecx             # 16进制，4位一组
    imull %ecx                 # 结果在 edx eax 
    movq $str_int32, %rdi 
    movl %edx, %esi 
    movl %eax, %edx 
    callq printf 

    # 32位，单操作数，无符号乘法，溢出
    movl $0x22222222, %edx     # 写值，32位，edx占位
    movl $0xF6E6D6C6, %eax     # 写值，32位，eax，负数
    movl $1, %ecx 
    shll $12, %ecx             # 16进制，4位一组
    mull %ecx                  # 结果在 edx eax 
    movq $str_int32, %rdi 
    movl %edx, %esi 
    movl %eax, %edx 
    callq printf 

    # 64位，单操作数，溢出 
    movq $0x2222222222222222, %rdx  # 写值，64位，rdx占位
    movq $0x33445566778899AA, %rax  # 写值，64位，rax
    movq $1, %r8 
    shlq $12, %r8           # 16进制，4位一组 
    imulq %r8               # 结果在 rdx rax 
    movq $str_int64, %rdi 
    movq %rdx, %rsi 
    movq %rax, %rdx 
    callq printf 

    popq %rbp 
    retq 
