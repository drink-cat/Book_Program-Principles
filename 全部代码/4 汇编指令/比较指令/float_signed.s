.data 

float64_aa : 
    .double 0 

float64_bb : 
    .double 0 

str_read :  # 输入
    .string "%lf %lf"

str_big :   # 大于
    .string "Result :  %f   >   %f \n\n"

str_small :  # 小于
    .string "Result :  %f   <   %f \n\n"

str_equal :  # 等于
    .string "Result :  %f   ==   %f \n\n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 输入2个变量
    movq $str_read , %rdi 
    movq $float64_aa, %rsi      # 变量aa
    movq $float64_bb, %rdx      # 变量bb
    callq scanf  

    # 比较
    movsd float64_aa(%rip), %xmm0   # 变量aa
    movsd float64_bb(%rip), %xmm1   # 变量bb
    ucomisd  %xmm1 , %xmm0          # 比较 result = xmm0 - xmm1 

    # 分支。大于、小于、等于
    ja tmp_big          # aa > bb 
    jb tmp_small        # aa < bb 
    je tmp_equal        # aa == bb 

tmp_big :
    movq $str_big, %rdi 
    jmp tmp_out 

tmp_small :
    movq $str_small, %rdi 
    jmp tmp_out 

tmp_equal :
    movq $str_equal, %rdi 
    jmp tmp_out 

tmp_out :       # 输出
    movsd float64_aa(%rip), %xmm0   # 变量aa
    movsd float64_bb(%rip), %xmm1   # 变量bb
    callq printf 

    popq %rbp 
    retq 
