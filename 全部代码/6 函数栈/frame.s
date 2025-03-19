
.global main 

.data
print_main :
    .string "main()     curr_rbp = %#x  curr_rsp = %#x  frame_rbp = %#x  frame_rip = %#x \n"
print_func_a :
    .string "func_a()   curr_rbp = %#x  curr_rsp = %#x  frame_rbp = %#x  frame_rip = %#x \n"
print_func_aa :
    .string "func_aa()  curr_rbp = %#x  curr_rsp = %#x  frame_rbp = %#x  frame_rip = %#x \n"

.text

# 函数  
func_aa :       
    pushq %rbp 
    movq %rsp, %rbp 

    subq $16, %rsp      # 扩容

    movq $print_func_aa, %rdi 
    movq %rbp, %rsi     # 当前的rbp
    movq %rsp, %rdx     # 当前的rsp
    movq 0(%rbp), %rcx  # 上一个rbp
    movq 8(%rbp), %r8   # rip
    callq printf 

    addq $16, %rsp      # 缩容

    popq %rbp 
    retq                # 退出函数。rip出栈

# 函数  
func_a :      
    pushq %rbp 
    movq %rsp, %rbp 

    subq $16, %rsp      # 扩容

    movq $print_func_a, %rdi 
    movq %rbp, %rsi     # 当前的rbp
    movq %rsp, %rdx     # 当前的rsp
    movq 0(%rbp), %rcx  # 上一个rbp
    movq 8(%rbp), %r8   # rip
    callq printf 

    callq func_aa       # 调用函数。rip入栈

    addq $16, %rsp      # 缩容

    popq %rbp 
    retq                # 退出函数。rip出栈

# 函数  
main :    
    pushq %rbp 
    movq %rsp, %rbp 

    movq $print_main, %rdi 
    movq %rbp, %rsi     # 当前的rbp
    movq %rsp, %rdx     # 当前的rsp
    movq 0(%rbp), %rcx  # 上一个rbp
    movq 8(%rbp), %r8   # rip
    callq printf 

    callq func_a        # 调用函数。rip入栈

    movq $0, %rax    # 返回值

    popq %rbp 
    retq                # 退出函数。rip出栈
