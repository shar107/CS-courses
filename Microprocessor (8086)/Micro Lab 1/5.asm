5.	1DH × 77H (using AL, BL registers)

Code:

MOV AL,1Dh
MOV BL,77h
MUL BL; 1Dh x 77h = (29 x 119) in decimal = 3451 = D7B (in hexadecimal)
ret
