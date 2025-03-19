#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int dog_speed = 0xD1D2D3D4;

void dog_run()
{
    printf("Dog is running at speed %#X \n", dog_speed);
}
