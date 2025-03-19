
.global main

.data

# 字符串，打印多个int值
out_str :
    .string "params : %d , %d \n"

.text 

# 自定义函数，入参使用函数栈 rbp rsp 
func_self_param :
    pushq %rbp
    movq %rsp, %rbp 

    movq $out_str, %rdi  # printf的第一个参数
    movl 16(%rbp), %esi  # 接收入参1
    movl 20(%rbp), %edx  # 接收入参2
    callq printf 

    popq %rbp
    retq 

main:
    pushq %rbp 
    movq %rsp, %rbp 

    subq $32, %rsp   # 扩大栈

    movl $777, 0(%rsp)   # 入参1，使用 rsp+0
    movl $888, 4(%rsp)   # 入参2，使用 rsp+4
    callq func_self_param  # 调用函数 func_self_param

    addq $32, %rsp   # 缩小栈。必须和上方的扩大栈配合使用。

    popq %rbp 
    retq 
