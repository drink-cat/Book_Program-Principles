.data

int64_arr :     # 整数数组。多个元素。
    .quad 0xA1A2A3A4A5A6A7A8    # 元素1
    .quad 0xB1B2B3B4B5B6B7B8    # 元素2
    .quad 0xC1C2C3C4C5C6C7C8    # 元素3

str_addr :  # 数组的地址
    .string " Array   addr = %#llX  \n"

str_element :   # 元素的地址和值
    .string " Element   addr = %#llX   value = %#llX  \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 打印数组的地址
    movq $int64_arr, %r8        # 绝对寻址。取符号的地址
    movq %r8, %rdi  
    callq func_print_addr 

    # 打印数组的地址
    leaq int64_arr(%rip), %r9   # 相对寻址。取符号的地址
    movq %r9, %rdi  
    callq func_print_addr 

    # 打印第2个元素
    movq $int64_arr, %r8        # 绝对寻址
    addq $8, %r8                # 地址加上偏移8
    movq (%r8), %r9             # 取值
    movq %r8, %rdi 
    movq %r9, %rsi 
    callq func_print_element 

    # 打印第2个元素
    leaq int64_arr+8(%rip), %r8    # 相对寻址
    movq int64_arr+8(%rip), %r9    # 取值
    movq %r8, %rdi 
    movq %r9, %rsi 
    callq func_print_element 

    popq %rbp 
    retq 

# -----------------
func_print_addr :   # 函数，打印数组的地址
    pushq %rbp 
    movq %rsp, %rbp 

    movq %rdi, %rsi     # 入参。数组的地址
    movq $str_addr, %rdi 
    callq printf 

    popq %rbp 
    retq 

# -----------------
func_print_element :    # 函数，打印某个元素的地址和值
    pushq %rbp 
    movq %rsp, %rbp 

    movq %rdi, %r8      # 入参。某个元素的地址
    movq %rsi, %r9      # 入参。某个元素的值

    movq $str_element, %rdi 
    movq %r8, %rsi 
    movq %r9, %rdx 
    callq printf 

    popq %rbp
    retq 
