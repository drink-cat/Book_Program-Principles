
.global main 

.data

str_num : 
    .string " rbx = %lld  rcx = %lld \n"

.text 

func_ignore :       # 函数。没有push、pop

    addq $222, %rbx     # 加法。rbx=rbx+222
    subq $111, %rcx     # 减法。rcx=rcx-111

    retq                # ret和call对应。


main : 
    pushq %rbp
    movq %rsp, %rbp 

    movq $333, %rbx     # 赋值，把333赋给rbx
    movq $888, %rcx     # 赋值，把888赋给rcx

    callq func_ignore   # 调用函数

    movq $str_num, %rdi 
    movq %rbx, %rsi 
    movq %rcx, %rdx 
    callq printf        # 输出

    popq %rbp 
    retq 
