.data

int32_aa :   # 记录入参
    .long 0x0 

str_tip :    # 输入1个数字。 0表示false，其他表示true
    .string "Please input num : 0 = false , other = true  \n"

str_input :  # 输入1个数字。
    .string "%d"

str_step :   # 打印顺序
    .string " step = %d \n"

.text
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 提示
    movq $str_tip, %rdi 
    callq printf 

    # 输入
    movq $str_input, %rdi 
    movq $int32_aa, %rsi 
    callq scanf 

# -------------------------------------
    cmpl $0x0, int32_aa(%rip) # 比较
    jne mark_step_3     # 不相等就跳转 3

mark_step_1 :           # step 1
    movl $1, %esi 
    movq $str_step, %rdi 
    callq printf 
    cmpl $0x0, int32_aa(%rip)  # 比较
    jne mark_step_4     # 不相等就跳转 4

mark_step_2 :           # step 2
    movl $2, %esi 
    movq $str_step, %rdi 
    callq printf 
    cmpl $0x0, int32_aa(%rip)  # 比较
    jne mark_step_out   # 不相等就跳转 out
    
mark_step_3 :           # step 3
    movl $3, %esi 
    movq $str_step, %rdi 
    callq printf 
    cmpl $0x0, int32_aa(%rip)  # 比较
    jne mark_step_1     # 不相等就跳转 1

mark_step_4 :           # step 4
    movl $4, %esi 
    movq $str_step, %rdi 
    callq printf 
    cmpl $0x0, int32_aa(%rip)  # 比较
    jne mark_step_2     # 不相等就跳转 2

mark_step_out :         # step out

    popq %rbp 
    retq 
