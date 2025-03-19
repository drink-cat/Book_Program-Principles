
// 在函数中计算局部变量，然后调用另一个函数，之后继续计算变量
// 会先把中间结果，从寄存器存入栈
// 因为调用函数，会把寄存器覆盖，导致数据丢失

int func_hello(int num)
{
    int tmp = num + 3;
    return tmp;
}

// 函数没有调用其他函数
int func_no_call(int init)
{
    // int num = init;
    // int sum = num + 888;

    // int less = sum - 777;
    int less = init - 111;
    return less;
}

// 函数有调用其他函数
int func_with_call(int init)
{
    // int num = init;
    // int sum = num + 888;
    // 调用其他函数
    func_hello(555);
    // int less = sum - 777;
    int less = init - 111;
    return less;
}