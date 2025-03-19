.global main 

.data
out_str : 
    .string "return values :  %d  %d  \n"

.text 

# 返回值使用函数栈 
func_self_stack : 
    pushq %rbp 
    movq %rsp, %rbp 

    movl $777, 16(%rbp)  # 返回值1，在函数栈写一个int
    movl $555, 24(%rbp)  # 返回值2，在函数栈写一个int

    popq %rbp 
    retq 

main : 
    pushq %rbp
    movq %rsp, %rbp 

    subq $64, %rsp   # 扩大栈

    callq func_self_stack  # 调用函数，获得返回值

    movq $out_str, %rdi 
    movl 0(%rsp), %esi   # 从栈上取返回值1
    movl 8(%rsp), %edx   # 从栈上取返回值2
    callq printf 

    addq $64, %rsp   # 缩小栈。必须和扩大栈对应

    popq %rbp
    retq 
