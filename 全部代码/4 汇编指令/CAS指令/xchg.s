.data

int32_aa :      # 变量 aa
    .long 0x0 

int32_bb :      # 变量 bb
    .long 0x0 

str_tip :       # 提示
    .string "Please input like : 100  200 \n"

str_input :     # 输入
    .string "%d %d"

str_before :    # 执行前
    .string "Before xchg :  aa = %d    bb = %d \n"

str_after :     # 执行后
    .string "After  xchg :  aa = %d    bb = %d \n"

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
    movq $int32_bb, %rdx 
    callq scanf 

    callq func_xchg     # 执行交换函数

    popq %rbp 
    retq 

func_xchg :
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    movq $str_before, %rdi 
    movl int32_aa(%rip),%esi 
    movl int32_bb(%rip),%edx 
    callq printf 

    movl int32_aa(%rip), %eax   # 读aa
    xchgl %eax, int32_bb(%rip)  # 交换 aa bb
    movl %eax, int32_aa(%rip)   # 写aa

    movq $str_after, %rdi 
    movl int32_aa(%rip),%esi 
    movl int32_bb(%rip),%edx 
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq  
