3.	7AH – 4CH (using CL, DL registers)


Code:

MOV CL,7Ah
MOV DL,4Ch
SUB CL,DL; 7Ah - 4Ch = (122 - 76) in decimal = 46 = 2Eh (in hexadecimal)
ret
