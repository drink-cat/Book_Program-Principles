// 内联函数。使用修饰符前缀
inline __attribute__((always_inline)) int func_with_inline(int num)
{
    // 只有1行代码。用 333 标识
    return num + 333;
}

// 普通函数。不使用内联。
int func_without_inline(int num)
{
    // 只有1行代码。用 555 标识
    return num + 555;
}

int func_test()
{
    // 循环调用函数多次，增加内联的概率
    for (int k = 0; k < 777; ++k)
    {
        // 依次调用2个函数。用2个局部变量承接，防止编译器优化掉函数调用。
        int tmp1 = func_with_inline(k);
        int tmp2 = func_without_inline(k);
    }
    return 0;
}