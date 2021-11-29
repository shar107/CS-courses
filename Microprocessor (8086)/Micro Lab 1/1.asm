1.	12H + CAH (using CL, DL registers)

Code:

MOV CL,12h
MOV DL,0CAh
ADD CL,DL; 12H + CAH = (18+202) in decimal = 220 = DCh (in hexadecimal)
ret
