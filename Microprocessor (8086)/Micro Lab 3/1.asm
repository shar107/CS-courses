
Aim: To find the average of N numbers stored in 8086 ALP.

Algorithm: 
 

Input: Values in decimal: 03, 04, 05, 08


Code:

org 100h

MOV [1100H],03
MOV [1101H],04
MOV [1102H],05
MOV [1103H],08  
MOV AX,0000H
MOV SI,1100H
MOV CX,04H  ;count of numbers inserted
MOV DX,00H

loop:ADD AL,[SI]
INC SI
INC DX
CMP CX,DX
JNZ loop
DIV CL
MOV [1200H],AX
HLT

ret           



Review Questions: 


1.	What if the accumulator is not initialized to zero?

If the accumulator was not initialised to zero (i.e. MOV AX,0000H), then the sum of the numbers would be increased beyond their original sum due to the newly inserted number in the accumulator. For example, if MOV AX,0100H, then the output for the above code would have been (3+4+5+8+256(100H in decimal)/4) = 69, which is obviously the wrong output. We add zero for a continuous sum due to its additive property to keep the result unaltered.



2.	Does it have any effect on output result if the accumulator is not initialized to zero?

No, it does have an effect on the output. Otherwise, the output would have been (3+4+5+8+0)/4 = 5, instead of (3+4+5+8+256)/4 = 69 [If we consider MOV AX,0100H].

3.	Repeat the problem with five numbers of 16-bit data of your choice. What are the changes you had to make in your code?


org 100h

MOV [1100H],69
MOV [1101H],96
MOV [1102H],256
MOV [1103H],121
MOV [1104H],482 
MOV AX,0000H
MOV SI,1100H
MOV CX,05H  ;count of numbers inserted
MOV DX,00H

loop:ADD AL,[SI]
INC SI
INC DX
CMP CX,DX
JNZ loop
DIV CL
MOV [1200H],AX
HLT

ret


Changes made: 
i.	Inserted another number (i.e MOV [1104H],482).
ii.	Incremented CX address by 1 as total count of numbers is equal to 5.    



Output: 	Result in decimal: 05
		SI register location: 1100H
		Result location: 1200H
