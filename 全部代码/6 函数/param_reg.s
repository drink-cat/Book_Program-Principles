
.global main 

.data

# 字符串，打印多个int值
out_str :
    .string "params : %d , %d , %d  \n"

.text

# 自定义函数，入参使用寄存器 rax rbx rcx 
func_self_param:
    pushq %rbp
    movq %rsp,%rbp 

    movq $out_str, %rdi  # printf的第一个参数
    movl %eax, %esi  # 接收入参1
    movl %ebx, %edx  # 接收入参2
    movl %ecx, %ecx  # 接收入参3
    callq printf     # 调用函数 printf

    popq %rbp 
    retq 

# main func
main:
    pushq %rbp
    movq %rsp, %rbp 

    movl $111, %eax  # 入参1，使用 rax
    movl $222, %ebx  # 入参2，使用 rbx
    movl $333, %ecx  # 入参3，使用 rcx
    callq func_self_param  # 调用函数 func_self_param

    popq %rbp
    retq 
