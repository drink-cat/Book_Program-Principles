.data 

int64_aa :      # 64位整数
    .quad 0x0 

float64_bb :    # 64位浮点数
    .double 0 

str_tip :       # 输入1个整数、1个浮点数 
    .string "Please input like : 300  55.66 \n"

str_input :     # 输入1个整数、1个浮点数 
    .string "%lld %lf"

str_sum :       # 结果
    .string "Sum = %lf \n"

.text
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 提示
    movq $str_tip, %rdi     # 参数1
    callq printf            # 调用输出函数

    # 输入 
    movq $str_input, %rdi   # 参数1
    movq $int64_aa, %rsi    # 参数2，整数变量的地址
    movq $float64_bb, %rdx  # 参数3，浮点数变量的地址
    callq scanf             # 调用输入函数

    movq int64_aa(%rip), %rdi       # 参数1，整数
    movsd float64_bb(%rip), %xmm0   # 参数2，浮点数
    callq func_sum                  # 调用函数

    popq %rbp 
    retq 

func_sum :          # 自定义函数。sum = 整数 + 浮点数
    pushq %rbp         # rbp入栈   
    movq %rsp, %rbp    # rsp赋给rbp 

    movq %rdi, %r8          # 参数1，整数
    movsd %xmm0, %xmm6      # 参数2，浮点数

    cvtsi2sd %r8, %xmm5     # 整数转浮点数
    addsd %xmm5, %xmm6      # 浮点数加法

    movq $str_sum, %rdi     # 参数1，字符串
    movsd %xmm6, %xmm0      # 参数2，浮点数
    callq printf            # 调用输出函数

    popq %rbp       # rbp出栈
    retq            # 退出函数。
