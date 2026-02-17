.set IRQ_BASE, 0x20

.section .text

.extern _ZN16InterruptManager16handleInterruptEhj

.global _ZN16InterruptManager22IgnoreInterruptRequestEv

.macro HandleException num
.global _ZN16InterruptManager16HandleException\num\()Ev
_ZN16InterruptManager16HandleException\num\()Ev:
    pusha
    pushl %ds
    pushl %es
    pushl %fs
    pushl %gs

    movl %esp, %eax
    pushl %eax
    pushl $\num
    call _ZN16InterruptManager15handleInterruptEhj
    addl $8, %esp

    popl %gs
    popl %fs
    popl %es
    popl %ds
    popa
    iret
.endm

.macro HandleInterruptRequest num
.global _ZN16InterruptManager26HandleInterruptRequest\num\()Ev
_ZN16InterruptManager26HandleInterruptRequest\num\()Ev:
     pusha
    movb $0x20, %al
    outb %al, $0x20
    popa
    iret
.endm

HandleInterruptRequest 0x00
HandleInterruptRequest 0x01

_ZN16InterruptManager22IgnoreInterruptRequestEv:
    iret

# .data
#    interruptnumber: .byte 0