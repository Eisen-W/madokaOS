#include<types.h>

void printf(const char* str)
{
    static uint16_t* VidMem = (uint16_t*)0xb8000;

    for(int i=0; str[i] != '\0'; ++i)
    {
        VidMem[i] = (VidMem[i] & 0xFF00) | str[i];
    }
}

typedef void (*constructor)();
extern "C" constructor* start_ctors;
extern "C" constructor* end_ctors;
extern "C" void callConstructors()
{
    for(constructor* i = start_ctors; i != end_ctors; i++)
        (*i)();
}

extern "C" void clear()
{
    unsigned short* v = (unsigned short*)0xB8000;
    for(int i = 0; i < 80*25; i++)
    {
        v[i] = 0x0720;
    }
}

extern "C" void kernelMain(void* multiboot_structure, uint32_t magicnumber)
{
    clear();
    printf(" hello Dumbass ");
    while(1) {
        asm volatile("hlt");
    }
}