.data 

int64_aa : 
    .quad 0x0 

str_tip :  # 从0累加到输入的数
    .string "Sum from 0 to input number \n"

str_tip2 : 
    .string "Please input num that is bigger than 0 \n"

str_input :  # 输入1个数
    .string "%lld"

str_sum : 
    .string "Sum = %lld \n\n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp , %rbp 

    # 提示
    movq $str_tip, %rdi 
    callq printf 
    movq $str_tip2, %rdi 
    callq printf 

    # 输入
    movq $str_input, %rdi 
    movq $int64_aa, %rsi 
    callq scanf 

    # 把 1 到 aa 的数，累加

    movq $0, %r8    # 下标，依次递增
    movq $0, %r9    # 累加的结果 

# -------------------------------------

tmp_loop :              # 循环
    cmpq int64_aa(%rip), %r8  # 判断边界
    jg  tmp_loop_out    # 大于就跳转，退出循环

    addq %r8, %r9       # 累加1个数 
    incq %r8            # 下标+1 
    jmp tmp_loop        # 无条件跳转，继续循环  

# -------------------------------------

tmp_loop_out :          # 退出循环

    movq $str_sum, %rdi 
    movq %r9, %rsi      # 打印结果
    callq printf 

    popq %rbp 
    retq 
