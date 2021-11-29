
2.	Aim: To find factorial of a given number.


Algorithm: i. Input the Number whose factorial is to be find and Store that Number in CX Register (Condition for LOOP Instruction).
ii. Insert 0001 in AX(Condition for MUL Instruction) and 0000 in DX Multiply CX with AX until CX become Zero(0) using LOOP Instruction.
iii. Copy the content of AX to memory location 0600.
iv. Copy the content of DX to memory location 0601.
v. Stop Execution.


Input: I’m inputting 10!



Code:

.MODEL SMALL
.STACK 1000h

.DATA
decstr DB 16 DUP ('$')                  ; String is $-terminated

.CODE

main PROC
    mov ax, @DATA                       ; Initialize DS
    mov ds, ax

    mov bx, 10                          ; Factorial 10! = 3.628.800
    xor dx, dx                          ; DX:AX=1 (first multiplicand)
    mov ax, 1                           ; Begin with 1

    ; for (dx:ax = 1, cx = 2; cx <= 10; cx++)
    mov cx, 2                           ; Incrementing multiplicator
    L1:
    call mul_dword_word                 ; DX:AX * CX -> DX:AX
    inc cx
    cmp cx, bx
    jbe L1                              ; While cx <= 10

    ; Print result
    mov di, OFFSET decstr
    call dword_to_dec
    mov dx, OFFSET decstr
    mov ah, 9
    int 21h

    ; Exit
    mov ax, 4C00h
    int 21h
main ENDP

mul_dword_word PROC                     ; DX:AX multiplicand, CX multiplier
    push dx

    mul cx                              ; AX * CX -> DX:AX
    mov si, dx                          ; Store high result
    mov di, ax                          ; Low result won't be changed anymore

    pop ax                              ; High word
    mul cx                              ; AX * CX -> DX:AX
    add ax, si                          ; Add high result from last mul to low result here
    adc dx, 0

    mov si, dx                          ; SI:DX:AX return value
    mov dx, ax
    mov ax, di
    ret                                 ; RET: SI:DX:AX result
mul_dword_word ENDP

dword_to_dec PROC                       ; ARG DX:AX DWORD, DI: offset of string

    mov cs:target, di
    mov si, ax
    mov di, dx

    ; First Loop: get digits and push them
    mov cs:counter, 0
    mov bx, 10
    LL1:
    inc cs:counter
    xor dx, dx
    mov ax, di                          ; High WORD
    mov cx, ax
    div bx                              ; DX:AX / BX -> AX Remainder DX
    mov di, ax                          ; Store new high word
    mul bx                              ; AX * BX -> DX:AX
    sub cx, ax                          ; sub highest CX-divisible value

    mov dx, cx
    mov ax, si                          ; Low WORD
    div bx                              ; DX:AX / BX -> AX Remainder DX
    or dl, 30h                          ; Convert remainder to ASCII
    push dx                             ; Store remainder
    mov si, ax                          ; Store new low WORD

    or ax, di                           ; Anything more to process?
    jnz LL1                             ; yes: jump to LL1 above

    ; Second Loop: get back digits in reversed order
    mov di, cs:target
    mov cx, cs:counter
    LL2:
    pop ax
    mov [di], al
    inc di
    loop LL2
    mov BYTE PTR [di], '$'              ; Terminator for INT 21h/09h

    ret
    counter dw 0
    target dw 0
dword_to_dec ENDP




Output: 3628800 (as is the desired output of 10!)
