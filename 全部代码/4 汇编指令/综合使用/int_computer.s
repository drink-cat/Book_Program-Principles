.data

int64_aa :  # 64位整数
    .quad 0x0 

int64_bb :  # 64位整数
    .quad 0x0 

int64_xx :  # 运算的结果
    .quad 0x0 

input_op :  # 运算符
    .byte 0x0,0x0,0x0,0x0,0x0

str_tips :  # 提示
    .string ">> Please input like  1 + 2 \n"

str_read :  # 输入
    .string "%lld  %s  %lld"

str_out : # 输出
    .string "output  :  %lld  %s  %lld  =  %lld \n\n"

str_error :  # 错误
    .string " wrong params : %lld  %s  %lld \n\n"

# 运算符
op_add : .string "+"    # 加法
op_sub : .string "-"    # 减法
op_mul : .string "*"    # 乘法
op_div : .string "/"    # 除法取商
op_yu  : .string "%"    # 除法取余

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
    movq $int64_aa, %rsi    # 变量aa
    movq $input_op, %rdx    # 运算符
    movq $int64_bb, %rcx    # 变量bb
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

    # 除法取商
    movq $input_op, %rdi 
    movq $op_div, %rsi 
    callq strcmp        # 比较运算符
    cmpq $0, %rax 
    je mark_div 

    # 除法取余
    movq $input_op, %rdi 
    movq $op_yu, %rsi 
    callq strcmp        # 比较运算符
    cmpq $0, %rax 
    je mark_yu 

    # 参数错误
    jmp mark_error 

mark_add : 
    movq int64_aa(%rip), %r8    # 变量aa
    movq int64_bb(%rip), %r9    # 变量bb
    addq %r9, %r8               # r8 = r8 + r9 
    movq %r8, int64_xx(%rip)    # 保存结果
    jmp mark_out

mark_sub : 
    movq int64_aa(%rip), %r8    # 变量aa
    movq int64_bb(%rip), %r9    # 变量bb
    subq %r9, %r8               # r8 = r8 - r9 
    movq %r8, int64_xx(%rip)    # 保存结果
    jmp mark_out

mark_mul : 
    movq int64_aa(%rip), %rax   # 变量aa
    movq int64_bb(%rip), %r9    # 变量bb
    imulq %r9                   # rax = rax * r9 
    movq %rax, int64_xx(%rip)   # 保存结果
    jmp mark_out

mark_div : 
    movq int64_aa(%rip), %rax   # 变量aa
    movq int64_bb(%rip), %r9    # 变量bb
    cqto                        # 符号扩展
    idivq %r9                   # rax = rax / r9 
    movq %rax, int64_xx(%rip)   # 保存结果
    jmp mark_out

mark_yu : 
    movq int64_aa(%rip), %rax   # 变量aa
    movq int64_bb(%rip), %r9    # 变量bb
    cqto                        # 符号扩展
    idivq %r9                   # rdx = rax % r9 
    movq %rdx, int64_xx(%rip)   # 保存结果
    jmp mark_out

mark_error :  # 错误
    movq $str_error, %rdi 
    movq int64_aa(%rip), %rsi 
    movq $input_op, %rdx 
    movq int64_bb(%rip), %rcx 
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

    movq $str_out, %rdi 
    movq int64_aa(%rip), %rsi   # 变量aa
    movq $input_op, %rdx        # 运算符
    movq int64_bb(%rip), %rcx   # 变量bb
    movq int64_xx(%rip), %r8    # 结果
    callq printf 

    popq %rbp 
    retq 
