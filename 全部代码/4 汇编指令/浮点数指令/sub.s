
.data 

float64 : 
    .double 88888.888

float32 : 
    .float 55555.55

tmp32 : 
    .float 77777.77

str_64 : 
    .string " float64 = %.5f  \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 减法。64位
    movsd float64(%rip), %xmm0  # 64位，浮点数，xmm0
    movq $333, %r9              # 64位，整数，r9
    cvtsi2sd %r9, %xmm7         # 64位，整数转浮点数
    subsd %xmm7, %xmm0          # xmm0 = xmm0 - xmm7 
    movq $str_64, %rdi 
    callq printf 

    # 减法。32位
    movss float32(%rip), %xmm0  # 32位，浮点数，xmm0
    subss tmp32(%rip), %xmm0    # xmm0 = xmm0 - tmp32
    movq $str_64, %rdi 
    cvtss2sd %xmm0, %xmm0       # 32位浮点数转64位浮点数
    callq printf 

    popq %rbp 
    retq 
