
void printf(char* str)
{
    unsigned short* VidMem = (unsigned short*)0xb8000;

    for(int i=0; str[i] != '\0'; ++i)
    {
        VidMem[i] = (VidMem[i] & 0xFF00) | str[i];
    }
}

extern "C" void kernelMain(void* multiboot_structure, unsigned int magicnumber)
{
    printf("hello Dumbass ");
    while(1) {
        asm volatile("hlt");
    }
}