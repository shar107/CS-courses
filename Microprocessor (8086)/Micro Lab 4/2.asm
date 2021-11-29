
Aim: To write a program using the LOOP instruction with indirect addressing that copies a string from source to target, reversing the character order in the process.

Algorithm: 
1.	Get a string and remove the characters of the string.
2.	Push the characters in a stack and maintain the count of the characters.
3.	Load the starting address of the string.
4.	POP the top character of the stack until count is not equal to zero.
5.	Put the character and reduce the count and increase the address.
6.	Continue until the count is greater than zero.
7.	Load the effective address of the string in dx using LEA command.
8.	Print the string by calling the interrupt with 9H in AH.
9.	The string must be terminated by ‘$’ sign.



Code and input:


.MODEL SMALL
.STACK 100H
.DATA

STRING DB 'Microprocessor Digital Assignment', '$'

.CODE
MAIN PROC FAR
MOV AX,@DATA
MOV DS,AX
CALL REVERSE
LEA DX,STRING 
MOV AH, 09H
INT 21H
MOV AH, 4CH
INT 21H
MAIN ENDP
REVERSE PROC
 MOV SI, OFFSET STRING
 MOV CX, 0H
 LOOP1:
 MOV AX, [SI]
 CMP AL, '$'
 JE LABEL1
 PUSH [SI]
 INC SI
 INC CX
 JMP LOOP1

 LABEL1:
 MOV SI, OFFSET STRING
 LOOP2:
 CMP CX,0
 JE EXIT
 POP DX
 XOR DH, DH
 MOV [SI], DX
 INC SI
 DEC CX
 
 JMP LOOP2
 EXIT:
 MOV [SI],'$ '
 RET
REVERSE ENDP
END MAIN




Output:
 
tnemngissA latigiD rossecorporciM



Result: The input string has been reversed.



Review questions:


1.	Repeat the problem with data ranging from 00h to 0Fh.

org 100h
MOV SI,3000h
MOV DI,2000h
MOV CX,0Fh
L1: cld
    lodsb 
    std 
    stosb 
    loop L1
HLT
Ret




2.	What are the roles of CLD and STD instructions?

CLD clears the direction flag. No other flags or registers are affected. After CLD is executed, string operations will increment the index registers (SI and/or DI) that they use. 
 
STD is used to set the direction flag to a 1 so that SI and/or DI will automatically be decremented to point to the next string element when one of the string instructions executes.

If the direction flag is set SI/DI will be decremented by 1 for byte strings and 2 for word strings.
