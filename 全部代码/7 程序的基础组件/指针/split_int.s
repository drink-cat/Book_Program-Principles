.data 

int32_arr :  # 32位整数的数组
    .long 0x11111111
    .long 0xAAAAAAAA

str32: .string  " int32 =  %#X  %#X \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    movq $int32_arr, %rdi 
    callq print_4byte 

    movq $int32_arr, %r8           # 取地址
    movq $0x2222222233333333, %r9  # 写值。64位。
    movq %r9, (%r8) 

    movq $int32_arr, %rdi 
    callq print_4byte 

    movq $int32_arr, %r8    # 取地址
    movw $0xBBBB, 0(%r8)    # 写值。16位。
    movw $0xCCCC, 2(%r8)    # 写值。16位。
    movw $0xDDDD, 4(%r8)    # 写值。16位。
    movw $0xEEEE, 6(%r8)    # 写值。16位。

    movq $int32_arr, %rdi 
    callq print_4byte 

    popq %rbp 
    retq 

print_4byte :       # 每次打印4个字节 
    pushq %rbp 
    movq %rsp, %rbp 

    movq %rdi, %r8      # 地址。指针。
    movl 0(%r8), %esi   # 取第1个整数。地址+0 
    movl 4(%r8), %edx   # 取第2个整数。地址+4 

    movq $str32, %rdi
    callq printf 

    popq %rbp 
    retq 
