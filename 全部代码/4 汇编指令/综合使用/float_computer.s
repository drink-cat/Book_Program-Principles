.data

float64_aa :  # 64位浮点数
    .double 0x1 

float64_bb :  # 64位浮点数
    .double 0x2 

float64_xx :  # 运算的结果
    .double 0x3 

input_op :  # 运算符
    .byte 0x0,0x0,0x0,0x0,0x0

str_tips :  # 提示
    .string ">> Please input like  1.2 * 2.3 \n"

str_read :  # 输入
    .string "%lf %s %lf"

str_tmp : 
    .string "operator :   %s \n"

str_out : # 输出
    .string "output   :   %f  %s  %f  =  %f \n\n"

str_error :  # 错误
    .string " wrong params :   %f  %s  %f \n\n"

# 运算符
op_add : .string "+"    # 加法
op_sub : .string "-"    # 减法
op_mul : .string "*"    # 乘法
op_div : .string "/"    # 除法

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 提示
    movq $str_tips, %rdi 
    callq printf 

    # 输入
    movq $str_read , %rdi 
    movq $float64_aa, %rsi    # 变量aa
    movq $input_op, %rdx    # 运算符
    movq $float64_bb, %rcx    # 变量bb
    callq scanf 

    # 加法
    movq $input_op, %rdi 
    movq $op_add, %rsi 
    callq strcmp        # 比较运算符
    cmpq $0, %rax 
    je mark_add 

    # 减法
    movq $input_op, %rdi 
    movq $op_sub, %rsi 
    callq strcmp        # 比较运算符
    cmpq $0, %rax 
    je mark_sub 

    # 乘法
    movq $input_op, %rdi 
    movq $op_mul, %rsi 
    callq strcmp        # 比较运算符
    cmpq $0, %rax 
    je mark_mul 

    # 除法
    movq $input_op, %rdi 
    movq $op_div, %rsi 
    callq strcmp        # 比较运算符
    cmpq $0, %rax 
    je mark_div 

    # 参数错误
    jmp mark_error 

mark_add : 
    movsd float64_aa(%rip), %xmm0    # 变量aa
    movsd float64_bb(%rip), %xmm1    # 变量bb
    addsd %xmm1, %xmm0               # xmm0 = xmm0 + xmm1 
    movsd %xmm0, float64_xx(%rip)    # 保存结果
    jmp mark_out

mark_sub : 
    movsd float64_aa(%rip), %xmm0    # 变量aa
    movsd float64_bb(%rip), %xmm1    # 变量bb
    subsd %xmm1, %xmm0               # xmm0 = xmm0 - xmm1 
    movsd %xmm0, float64_xx(%rip)    # 保存结果
    jmp mark_out

mark_mul : 
    movsd float64_aa(%rip), %xmm0    # 变量aa
    movsd float64_bb(%rip), %xmm1    # 变量bb
    mulsd %xmm1, %xmm0               # xmm0 = xmm0 * xmm1 
    movsd %xmm0, float64_xx(%rip)    # 保存结果
    jmp mark_out

mark_div : 
    movsd float64_aa(%rip), %xmm0    # 变量aa
    movsd float64_bb(%rip), %xmm1    # 变量bb
    divsd %xmm1, %xmm0               # xmm0 = xmm0 / xmm1 
    movsd %xmm0, float64_xx(%rip)    # 保存结果
    jmp mark_out

mark_error :  # 错误
    movq $str_error, %rdi 
    movsd float64_aa(%rip), %xmm0 
    movq $input_op, %rsi  
    movsd float64_bb(%rip), %xmm1 
    callq printf 
    jmp mark_last 

mark_out : # 输出
    callq func_print_out  # 调用函数

mark_last : 

    popq %rbp 
    retq 

# ---------   输出函数 
func_print_out :   
    pushq %rbp 
    movq %rsp, %rbp 

    movq $str_tmp, %rdi 
    movq $input_op, %rsi 
    callq printf 

    movq $str_out, %rdi 
    movsd float64_aa(%rip), %xmm0   # 变量aa
    movq $input_op, %rsi            # 运算符
    movsd float64_bb(%rip), %xmm1   # 变量bb
    movsd float64_xx(%rip), %xmm2   # 结果
    callq printf 

    popq %rbp 
    retq 
