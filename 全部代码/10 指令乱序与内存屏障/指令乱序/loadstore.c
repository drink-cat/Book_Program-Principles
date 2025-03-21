int ee = 100;
int ff = 200;

// loadload
int func_load_load()
{
    int tmp1 = ee;
    int tmp2 = ff;
    return tmp1 + tmp2;
}

// loadstore
int func_load_store()
{
    int tmp1 = ee;
    ff = 600;
    return tmp1;
}

// storestore
void func_store_store()
{
    ee = 500;
    ff = 600;
}

// storeload
int func_store_load()
{
    ee = 500;
    int tmp2 = ff;
    return ee + tmp2;
}
