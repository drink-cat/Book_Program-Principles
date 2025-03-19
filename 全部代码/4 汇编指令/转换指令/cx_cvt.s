.data 

str_32:
    .string " 32bit   edx = %#11X   eax = %#11X  \n"

str_64:
    .string " 64bit   rdx = %#19llX   rax = %#19llX  \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp , %rbp 

    # cltd 32位。最高位为1
    movl $0x81111111, %eax  # 32位。最高位为1
    cltd            # 符号扩展。eax > edx:eax 
    movq $str_32, %rdi   
    movl %edx, %esi 
    movl %eax, %edx 
    callq printf 

    # cltd 32位。最高位为0
    movl $0x31111111, %eax  # 32位。最高位为0
    cltd            # 符号扩展。eax > edx:eax 
    movq $str_32, %rdi  
    movl %edx, %esi 
    movl %eax, %edx 
    callq printf 

    # cqto 64位。最高位为1
    movq $0x8111111111111111, %rax  # 64位。最高位为1
    cqto                    # 符号扩展。rax > rdx:rax 
    movq $str_64, %rdi 
    movq %rdx, %rsi 
    movq %rax, %rdx 
    callq printf 

    # cqto 64位。最高位为0 
    movq $0x3111111111111111, %rax  # 64位。最高位为0 
    cqto                    # 符号扩展。rax > rdx:rax 
    movq $str_64, %rdi 
    movq %rdx, %rsi 
    movq %rax, %rdx 
    callq printf 

    popq %rbp 
    retq 
