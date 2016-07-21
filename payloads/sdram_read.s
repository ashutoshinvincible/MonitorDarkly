.text
export _main

dst_off EQU 0xadad
dst_seg EQU 0xa1a1
read_off EQU 0xacac
height EQU 0xaeae
width EQU 0xafaf
stride EQU 0xbdbd
reg_hi EQU 0xbcbc
reg_lo EQU 0xbebe

_main:
    push bp
    mov bp, sp
    push si
    push ds

    push #dst_seg ; dst_seg
    push #dst_off ; dst_off
    push #read_off ; dst_off
    push #height ; height
    push #width ; width
    push #stride ; stride
    push #reg_hi ; hi
    push #reg_lo ; lo
    call $f000:$e1
    add sp, #0x10
    mov si, ax
    mov ax, #0
    mov ds, ax
    mov [0x600], si

    pop ds
    pop si
    pop bp
    retf
