
4.	3B7AH + C142H (using BX, CX registers)


Code:

MOV BX,3B7Ah 
MOV CX,0C142h
SUB BX,CX; 3B7Ah - C142h = (15226 - 49474) in decimal = 34248 = 31288 (signed 2's complement of -34248) = 7A38h (in hexadecimal) 
ret
