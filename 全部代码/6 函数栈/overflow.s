
.global main

.text 

# 函数，给递归使用
func_self : 
    pushq %rbp
    movq %rsp, %rbp 

    subq $64, %rsp    # 栈扩容

    callq func_self   # 递归，调用自身

    addq $64, %rsp    # 栈缩容

    popq %rbp 
    retq 

main : 
    pushq %rbp
    movq %rsp, %rbp 

    callq func_self    # 调用函数。触发栈溢出

    movq $0 , %rax 
    popq %rbp 
    retq 
