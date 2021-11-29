6.	EF1AH × CD50H (using AX, BX registers)  //product stored partly in DX and in AX


Code:

MOV AX,0EF1Ah
MOV BX,0CD50h
MUL BX; EF1Ah x CD50h = (61210 x 52560) in decimal = 3217197600 = BFC28A20h (in hexadecimal)
ret
