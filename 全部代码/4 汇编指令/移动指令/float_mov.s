.data

float64_aa :        # 64位浮点数数组
    .double 22.22   # 元素1 
    .double 33.33   # 元素2 

float32_bb :        # 32位浮点数
    .float 55.55    

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 寄存器与寄存器
    movsd %xmm2, %xmm3      # 64位，把xmm2写到xmm3
    movss %xmm5, %xmm6      # 32位，把xmm5写到xmm6

    # 寄存器与变量内存
    movsd float64_aa(%rip), %xmm3   # 64位，把变量float64_aa写到xmm3
    movsd %xmm3, float64_aa(%rip)   # 64位，把xmm3写到变量float64_aa
    movsd float64_aa+8(%rip), %xmm3 # 64位，把变量(float64_aa+8)写到xmm3
    movsd %xmm3, float64_aa+8(%rip) # 64位，把xmm3写到变量(float64_aa+8)
    movss float32_bb(%rip), %xmm5   # 32位，把变量float32_bb写到xmm5
    movss %xmm5, float32_bb(%rip)   # 32位，把xmm5写到变量float32_bb

    # 寄存器与栈内存
    movsd -8(%rbp), %xmm5   # 64位，把内存(rbp-8)写到xmm5
    movsd %xmm5, -8(%rbp)   # 64位，把xmm5写到内存(rbp-8)
    movss -16(%rbp), %xmm6  # 32位，把内存(rbp-16)写到xmm6
    movss %xmm6, -16(%rbp)  # 32位，把xmm6写到内存(rbp-16)

    addq $64, %rsp 
    popq %rbp 
    retq 
