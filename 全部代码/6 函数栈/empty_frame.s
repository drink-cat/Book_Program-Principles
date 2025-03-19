.data

age : 
    .quad 100 

str_age : 
    .string " age = %d \n"

str_tmp : 
    .string " some string \n"

.text
.global main 

main : 
    pushq %rbp
    movq %rsp, %rbp 

    callq print_age  #  age = 100 
    callq empty_1
    callq print_age  #  age = 100 
    callq empty_2
    callq print_age  #  age = 102 
   # callq empty_3  # 报错。Segmentation fault
    callq print_age 

    popq %rbp 
    retq 

print_age :  # 打印变量
    pushq %rbp
    movq %rsp, %rbp 

    movq $str_age, %rdi 
    movq age(%rip), %rsi 
    callq printf 

    popq %rbp 
    retq 

empty_1 : # 空frame
    retq 

empty_2 : # 空frame
    addq $2, age(%rip) 
    retq 

empty_3 : # 空frame # 报错了。
    movq $str_tmp, %rdi 
    callq printf # 中间少了一个rbp，退出函数时，出错
    retq 


