
3.	Aim: To write a program to read °F from memory [3000] and convert it to °C. Further to compute °K from °C and load computed value of K in memory [3001].

Algorithm: Same formula, as described in the 1st question. Just gotta store the value, in addition.


Code:

MOV [3000],69
MOV AX,[3000]
MOV CX,9
MOV BX,5
SUB AX,32  
MUL BX
DIV CX
MOV DX,AX
ADD DX,273  
MOV [3001],DX      
HLT



Output: DX=[3001]=0125h=293 (in degree F to degree C formula=>C=((F-32)*5)/9, 
;here AX or F=69 , therefore C=20.556~20 (i.e 14h in hexadecimal),
;and K=C+273=293 (i.e 125h in hexadecimal which is stored in [3001])
