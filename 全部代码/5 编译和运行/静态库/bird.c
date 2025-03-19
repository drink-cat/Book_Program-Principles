#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int bird_height = 0xB1B2B3B4;

void bird_fly()
{
    printf("Bird is flying at height %#X \n", bird_height);
}
