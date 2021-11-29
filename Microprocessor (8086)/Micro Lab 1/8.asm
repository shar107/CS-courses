8.	1927H ÷ 1201H (using AX, BX registers) //here quotient is stored in AX; remainder in DX

MOV AX,1927h
MOV BX,1201h
DIV BX; 1927h %(modulus) 1201h = (6439%4609) in decimal = 1830 = 726h (in hexadecimal), quotient=1
ret
