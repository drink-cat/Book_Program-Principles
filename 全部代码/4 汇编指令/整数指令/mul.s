
.data 

num_int32 :
    .long 0x0 

str_int32 :
    .string " int32 = %d \n"

str_int64 :
    .string " int64 = %lld \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 64位。操作寄存器
    movq $333333333333333, %r8 
    imulq $2 , %r8 ,  %r9       # r9 = 2 * r8 
    movq $str_int64 , %rdi 
    movq %r9, %rsi 
    callq printf 

    # 32位。操作寄存器
    movl $3, -4(%rbp) 
    imull $2 , -4(%rbp) , %r9d   # r9d = 2 * (-4(%rbp)) 
    movq $str_int32 , %rdi
    movl %r9d, %esi
    callq printf 

    # 32位。操作寄存器
    movl $3, %eax  
    movl $5, %r8d 
    imull %r8d           # eax = eax * r8d 
    movq $str_int32 , %rdi
    movl %eax, %esi
    callq printf 
    
    # 32位。操作栈
    movl $3, %eax   
    movl $6, -4(%rbp)  
    imull -4(%rbp)        # eax = eax * (-4(%rbp)) 
    movq $str_int32 , %rdi 
    movl %eax, %esi 
    callq printf 

    # 32位。操作数据段
    movl $3, %eax  
    movl $7, num_int32(%rip) 
    imull num_int32(%rip)   # eax = eax * (num_int32(%rip)) 
    movq $str_int32, %rdi 
    movl %eax, %esi 
    callq printf 

    # 16位。操作寄存器
    movw $3, %ax  
    movw $8, %r8w 
    imulw %r8w           # ax = ax * r8w
    movq $str_int32 , %rdi
    movzwl %ax, %eax 
    movl %eax, %esi 
    callq printf 
    
    # 8位。操作寄存器
    movb $3, %al  
    movb $9, %r8b 
    imulb %r8b           # al = al * r8b 
    movq $str_int32 , %rdi 
    movzbl %al, %eax 
    movl %eax, %esi 
    callq printf 

    # 32位。操作寄存器。双操作数。
    movl $3, %ecx 
    movl $-11, %edx 
    imull %edx, %ecx    # ecx = ecx * edx 
    movq $str_int32, %rdi 
    movl %ecx, %esi 
    callq printf 

    addq $64, %rsp 
    popq %rbp  
    retq  
