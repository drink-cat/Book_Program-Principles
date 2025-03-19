.data

int64_aa : 
    .quad 0x0 

int64_bb : 
    .quad 0x0 

int64_cc : 
    .quad 0x0 

str_tip :   # 校验3个数是否满足规则
    .string "Check rule :    ( aa > 100 && bb > 100 ) || cc > 100  \n"

str_tip2 :  # 输入3个数字
    .string "Please input like : 11 300 22 \n"

str_input : # 输入3个数字
    .string "%lld %lld %lld"

str_match_yes :  
    .string "Match = true \n\n"

str_match_no :  
    .string "Match = false \n\n"
    
.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 提示
    movq $str_tip, %rdi 
    callq printf 
    movq $str_tip2, %rdi 
    callq printf 

    # 输入
    movq $str_input, %rdi 
    movq $int64_aa, %rsi 
    movq $int64_bb, %rdx 
    movq $int64_cc, %rcx
    callq scanf 

    # 判断规则   ( aa > 100 && bb > 100 ) || cc > 100 

    cmpq $100, int64_aa(%rip)   # 判断 aa > 100
    jle tmp_next                # 小于等于，就跳转
    cmpq $100, int64_bb(%rip)   # 判断 bb > 100
    jle tmp_next                # 小于等于，就跳转
    jmp tmp_match_yes           # 无条件跳转。满足规则

tmp_next : 
    cmpq $100, int64_cc(%rip)   # 判断 cc > 100 
    jg tmp_match_yes            # 大于就跳转。满足规则 
    jmp tmp_match_no            # 无条件跳转。不满足规则

tmp_match_yes : # 满足规则
    movq $str_match_yes, %rdi 
    callq printf 
    jmp tmp_out 

tmp_match_no : # 不满足规则
    movq $str_match_no, %rdi 
    callq printf 

tmp_out :   # 退出

    popq %rbp 
    retq 
