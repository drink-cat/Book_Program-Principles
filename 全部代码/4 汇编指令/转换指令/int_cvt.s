.data

str_int32 :   # 查看16进制
    .string " int32   movsX = %#X   movzX = %#X  \n"

str_int64 :   # 查看16进制
    .string " int64   movsX = %#llX   movzX = %#llX \n"

str_64to16 :  # 64位转16位
    .string " to_small  int64 = %lld %#llX   int16 = %d %#X \n"

str_64to32 :  # 64位转32位
    .string " to_small  int64 = %lld %#llX   int32 = %d %#X \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp , %rbp 
    subq $64, %rsp 

    # 8位转32位。操作寄存器
    movb $0x41, %cl     # 8位。最高位是0
    movsbl %cl, %eax    # 符号扩展
    movzbl %cl, %ebx    # 零扩展 
    movq $str_int32, %rdi  
    movl %eax, %esi 
    movl %ebx, %edx 
    callq printf 

    # 8位转32位。操作寄存器
    movb $0x81, %cl     # 8位。最高位是1
    movsbl %cl, %eax    # 符号扩展
    movzbl %cl, %ebx    # 零扩展 
    movq $str_int32, %rdi  
    movl %eax, %esi 
    movl %ebx, %edx 
    callq printf 

    # 16位转64位。操作寄存器
    movw $0x8221, %cx   # 16位。最高位是1
    movswq %cx, %rax    # 符号扩展
    movzwq %cx, %rbx    # 零扩展
    movq $str_int64, %rdi 
    movq %rax, %rsi 
    movq %rbx, %rdx 
    callq printf 

   # 16位转64位。操作内存
    movw $0x8331, -2(%rbp)  # 16位。最高位是1
    movswq -2(%rbp), %r8    # 符号扩展
    movzwq -2(%rbp), %r9    # 零扩展
    movq $str_int64, %rdi 
    movq %r8, %rsi 
    movq %r9, %rdx 
    callq printf 

    # 32位转64位。操作寄存器
    movl $0x81111551, %ecx  # 32位。最高位是1
    movslq %ecx, %rax       # 符号扩展
    movl %ecx, %ebx         # 零扩展
    movq $str_int64, %rdi 
    movq %rax, %rsi 
    movq %rbx, %rdx 
    callq printf 

    # 64位转16位。操作寄存器
    movq $-99, %rax     # 64位。最高位是1
    movw %ax, %bx       # 截取16位
    movq $str_64to16, %rdi 
    movq %rax, %rsi 
    movq %rax, %rdx 
    movswl %bx, %ecx 
    movl %ecx, %r8d 
    callq printf 

    # 64位转32位。操作内存
    movq $77, -32(%rbp)    # 64位。最高位是0
    movl -32(%rbp), %eax   # 截取32位
    movq $str_64to32, %rdi 
    movq -32(%rbp), %rsi 
    movq %rsi, %rdx 
    movl %eax, %ecx 
    movl %ecx, %r8d 
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq 
