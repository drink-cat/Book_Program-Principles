.data

byteArr_aa : 
    .zero 100   # 字节数组。长度100

byteArr_bb : 
    .zero 100   # 字节数组。长度100

str_input :     # 输入
    .string "%s  %s"

str_tip :       # 提示
    .string " >> Please input like :   hello  world \n"

str_bigger :    # 大于
    .string " output :  %s  >  %s \n\n"

str_smaller :   # 小于
    .string " output :  %s  <  %s \n\n"

str_equal :     # 等于
    .string " output :  %s  ==  %s \n\n"

.text
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 查看。
    movq $str_tip, %rdi 
    callq printf 

    # 输入。
    movq $str_input, %rdi 
    movq $byteArr_aa, %rsi 
    movq $byteArr_bb, %rdx  
    callq scanf 
    
# --------------------------------------------------
    movq $0, %r9            # 下标。依次遍历字节。

mark_loop :                 # 循环。
    movq $byteArr_aa, %rax  # 变量aa的地址
    addq %r9, %rax          # 找到当前的内存地址
    movb (%rax), %al        # 取一个字节
    movq $byteArr_bb, %rbx  # 变量bb的地址
    addq %r9, %rbx          # 找到当前的内存地址
    movb (%rbx), %bl        # 取一个字节
    
    cmpb $0, %al        # aa到达末尾就退出循环
    je mark_out_loop    
    cmpb $0, %bl        # bb到达末尾就退出循环
    je mark_out_loop    

    cmpb %bl, %al       # 比较单个字节的大小
    ja mark_bigger      # 大于 
    jb mark_smaller     # 小于 

    incq %r9            # 下标+1。遍历后续的字节
    jmp mark_loop       # 继续循环

# --------------------------------------------------
mark_out_loop :             # 退出循环。
    movq $byteArr_aa, %rax  # 变量aa的地址
    addq %r9, %rax          # 找到当前的内存地址
    movb (%rax), %al        # 取一个字节
    movq $byteArr_bb, %rbx  # 变量bb的地址
    addq %r9, %rbx          # 找到当前的内存地址
    movb (%rbx), %bl        # 取一个字节

    cmpb $0, %al        # aa判断末尾
    jne mark_tail

    cmpb $0, %bl        # bb判断末尾
    jne mark_tail

    jmp mark_equal      # aa、bb同时到达末尾，说明相等

mark_tail : 
    cmpb $0, %al        # aa判断末尾
    je mark_smaller     # aa更小

    cmpb $0, %bl        # bb判断末尾
    je mark_bigger      # bb更小

# --------------------------------------------------
mark_bigger :       # 大于
    movq $str_bigger, %rdi 
    jmp mark_print

mark_smaller :      # 小于
    movq $str_smaller, %rdi 
    jmp mark_print

mark_equal :        # 等于
    movq $str_equal, %rdi 
    jmp mark_print

mark_print :        # 输出
    movq $byteArr_aa, %rsi 
    movq $byteArr_bb, %rdx 
    callq printf 

    popq %rbp 
    retq 
