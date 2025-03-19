#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

char cat_name[16] = {'T', 'o', 'm', '\0'};

int cat_speed = 0x71727374;

void cat_run(int plus)
{
    printf(" Cat %s is running at speed %#X \n", cat_name, cat_speed);
}
