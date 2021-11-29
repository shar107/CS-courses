7.	19H ÷ 03H (using AL, BL registers)   //here quotient is stored in AH and remainder in BL


Code:

MOV AL,19h
MOV BL,03h
DIV BL; 19h %(modulus) 03h = (25%3) in decimal = 01 = 01h (in hexadecimal), quotient=8
ret
