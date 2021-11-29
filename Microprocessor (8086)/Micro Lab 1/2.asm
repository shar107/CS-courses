
2.	1A4CH + B1DEH (using AX, BX registers)


Code:

MOV AX,1A4Ch 
MOV BX,0B1DEh
ADD AX,BX; 1A4Ch + B1DEh = (6732 + 45534) in decimal = 52266 = CC2Ah (in hexadecimal)
ret
