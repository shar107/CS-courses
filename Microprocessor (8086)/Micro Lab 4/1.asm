Aim: To write a program which reverses a given string and store it at the same location.

Algorithm: 

1.	Define the string to be reversed
2.	Move the address of first element in SI
3.	Move the addess of last element in DI
4.	Loop:
1.	Move the element in SI to AL
2.	Move the element in DI to BL
3.	Exchange the two elements
4.	Move the element in BL, to the address in SI
5.	Move the element in AL, to the address in DI
6.	Increase SI to take the next element in the array
7.	Decrease DI to take the next element in the array



Codes and screenshots:

P1 Code1:     

org 100h
MOV SI,4000H 
MOV CL,07H 
MOV CH,00H
MOV DI,07H
L1: MOV AL,[SI] 
    MOV BL,[DI] 
    XCHG [DI],BL 
    XCHG [SI],AL 
    INC SI
    DEC DI
    INC CH
    DEC CL
    CMP CL,CH
    JGE L1
HLT
ret          



P1 code2:


org 100h
.DATA
; The string to be printed
STRING DB 'MICROPROCESSOR', '$'
.CODE
MAIN PROC FAR 
MOV AX,@DATA 
MOV DS,AX
; call reverse function 
CALL REVERSE
; load address of the string 
LEA DX,STRING

MOV AH,09H
INT 21H
MOV AH,4CH
INT 21H


MAIN ENDP
REVERSE PROC
; load the offset of
; the string
    MOV SI, OFFSET STRING
    ; count of characters of the;
    ;string 
    MOV CX, 0H 

    LOOP1:
    ; compare if this is;
    ;the last character 
    MOV AX, [SI]
    CMP AL, '$' 
    JE LABEL1
    ; else push it in the;
    ;stack 
    PUSH [SI]
    ; increment the pointer;
    ;and count 
    INC SI
    INC CX
    JMP LOOP1

        LABEL1:
        ; again load the starting;
        ;address of the string 
        MOV SI, OFFSET STRING
        LOOP2:
        ;if count not equal to zero 
        CMP CX,0
        JE EXIT
        ; pop the top of stack 
        POP DX
        ; make dh, 0 
        XOR DH, DH
        ; put the character of the;
        ;reversed string

        MOV [SI], DX
        ; increment si and;
        ;decrement count 
        INC SI
        DEC CX 
        JMP LOOP2
        EXIT:
        ; add $ to the end of string 
        MOV [SI],'$ '
        RET
        REVERSE ENDP 
        END MAIN
ret




Review Questions: 



1.	Repeat the problem with data ranging from 00h to 0Fh.


org 100h
MOV SI,4000H 
MOV CL,0FH 
MOV CH,00H
MOV DI,0FH
L1: MOV AL,[SI] 
    MOV BL,[DI] 
    XCHG [DI],BL 
    XCHG [SI],AL 
    INC SI
    DEC DI
    INC CH
    DEC CL
    CMP CL,CH
    JGE L1
HLT
ret




2.	What is the role of JGE instruction?

It is Used to jump if greater than/equal/not less than instruction satisfies.

  


3.	Which addressing mode is used here?

Immediate Addressing Mode is used in this ALP.    

   

