.data

int64_aa:
    .quad 0x0

int64_bb:
    .quad 0x0

str_read :  # 输入
    .string "%lld %lld"

str_big :   # 大于
    .string "Result :  %lld %#llX   >   %lld %#llX \n\n"

str_small :  # 小于
    .string "Result :  %lld %#llX   <   %lld %#llX \n\n"

str_equal :  # 等于
    .string "Result :  %lld %#llX   ==   %lld %#llX \n\n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 输入2个变量
    movq $str_read, %rdi 
    movq $int64_aa, %rsi        # 变量aa
    movq $int64_bb, %rdx        # 变量bb
    callq scanf 

    # 比较2个变量
    movq int64_aa(%rip), %rax   # 变量aa
    movq int64_bb(%rip), %rbx   # 变量bb
    cmpq %rbx, %rax             # 比较  result = rax - rbx 

    # 分支。大于、小于、等于
    jg tmp_big              # aa > bb 
    jl tmp_small            # aa < bb 
    je tmp_eq               # aa == bb 

tmp_big :       # aa > bb 
    movq $str_big, %rdi 
    jmp tmp_out 

tmp_small :     # aa < bb 
    movq $str_small, %rdi 
    jmp tmp_out 

tmp_eq :        # aa == bb 
    movq $str_equal, %rdi 

tmp_out :   # 输出
    movq int64_aa(%rip), %rsi   # 变量aa
    movq %rsi, %rdx             # 变量aa
    movq int64_bb(%rip), %rcx   # 变量bb
    movq %rcx, %r8              # 变量bb
    callq printf 

    popq %rbp 
    retq 
