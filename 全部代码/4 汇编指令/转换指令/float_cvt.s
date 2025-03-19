.data 

float32 : 
    .float -111.777

float64 : 
    .double 555.666

str_32_to_64 : 
    .string " float32 = %.3f   float64 = %.3f \n" 

str_64_to_32 : 
    .string " float64 = %.3f   float32 = %.3f \n" 

str_i2f_64 : 
    .string " int64 = %lld   float64 = %.3f \n"

str_f2i_64 : 
    .string " float64 = %.3f   int64 = %lld \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 浮点数，32位转64位
    movss float32(%rip), %xmm0  # 浮点数，32位
    cvtss2sd %xmm0, %xmm1       # 浮点数，32位转64位
    movq $str_32_to_64, %rdi 
    cvtss2sd %xmm0, %xmm0   # %f 表示64位浮点数
    callq printf 

    # 浮点数，64位转32位
    movsd float64(%rip), %xmm0  # 浮点数，64位
    cvtsd2ss %xmm0, %xmm1       # 浮点数，64位转32位
    movq $str_64_to_32, %rdi 
    cvtss2sd %xmm1, %xmm1   # %f 表示64位浮点数
    callq printf 

    # 整数转浮点数，64位 
    movq $77777, %r8        # 整数，64位
    cvtsi2sd %r8, %xmm0     # 整数转浮点数，64位 
    movq $str_i2f_64, %rdi 
    movq %r8, %rsi 
    callq printf 

    # 浮点数转整数，64位。没有四舍五入
    movsd float64(%rip), %xmm0  # 浮点数，64位
    cvttsd2si %xmm0, %r8        # 浮点数转整数，64位 
    movq $str_f2i_64, %rdi 
    movq %r8, %rsi  
    callq printf 

    # 浮点数转整数，64位。四舍五入
    movsd float64(%rip), %xmm0  # 浮点数，64位
    cvtsd2si %xmm0, %r8         # 浮点数转整数，64位 
    movq $str_f2i_64, %rdi 
    movq %r8, %rsi  
    callq printf 

    # 整数转浮点数，32位 
    movl $-8888, %r8d       # 整数，32位
    cvtsi2ss %r8d, %xmm0    # 整数转浮点数，32位 
    movq $str_i2f_64, %rdi 
    movslq %r8d, %r8        # 符号扩展，32位转64位
    movq %r8, %rsi 
    cvtss2sd %xmm0, %xmm0   # 浮点数，32位转64位
    callq printf 

    # 浮点数转整数，32位 。没有四舍五入
    movss float32(%rip), %xmm0  # 浮点数，32位
    cvttss2si %xmm0, %r8d       # 浮点数转整数，32位 
    movq $str_f2i_64, %rdi 
    cvtss2sd %xmm0, %xmm0   # 浮点数，32位转64位
    movslq %r8d , %r8       # 符号扩展，32位转64位
    movq %r8 , %rsi 
    callq printf 

    # 浮点数转整数，32位 。四舍五入
    movss float32(%rip), %xmm0  # 浮点数，32位
    cvtss2si %xmm0, %r8d        # 浮点数转整数，32位 
    movq $str_f2i_64, %rdi 
    cvtss2sd %xmm0, %xmm0   # 浮点数，32位转64位
    movslq %r8d , %r8       # 符号扩展，32位转64位
    movq %r8 , %rsi 
    callq printf 

    popq %rbp 
    retq 
