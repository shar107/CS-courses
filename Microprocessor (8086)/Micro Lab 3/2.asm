

Aim: To generate Fibonacci series using an 8086 program.


Algorithm: i. To generate Fibonacci sequence, I’m putting the 00H and 01H into memory at first.
		ii. Then we are taking the limit from location offset 500.
		iii. The limit is decreased by 2 at first, because 00H and 01H is already present there.
		iv. Now I’m taking number from previous location, then add it with the value of current location, after that storing the result into next location.



Input:

Address	Data
…	…
500	E
…	…



Code:


org 100h 


MOV [600H],10 ;setting a limit for the loop instruction to run accordingly
    MOV AL,00H
    MOV SI,500H
    MOV [SI],AL
    INC SI
    ADD AL,01H
    MOV [SI],AL
    MOV CX,[600H]
    SUB CX,0002H 


L1: MOV AL,[SI-1] 
    ADD AL,[SI]  
    INC SI
    MOV [SI],AL
    LOOP L1
    HLT

ret



Output:
 
Address	Data
…	…
600	00
601	01
602	01
603	02
604	03
605	05
606	08
607	0D
608	15
609	22
60A	37
60B	59
60C	90
60D	E9
…	…




Review questions:


1.	Why is sub instruction used?

We use the SUB instruction in order to explicitly load the first 2 elements of the sequence (i.e., 0 and 1).



2.	What is the replaced number instead of “pp” and why is it so?

The replaced number instead of "xx" is 00h. This is assigned to the accumulator to use the additive property in order to produce an unaltered continuous sum until the loop exits.



3.	Which addressing mode is used in this programming?

Immediate Addressing Mode is use in this ALP.



4.	What is the role of LOOP instruction in this ALP?

Function of the LOOP is as follows:
L1: This defines the start of the loop (A label is created)
MOV AL, [SI-1]: Moves the element in the (i-1)th position into AL
ADD AL, [SI]: Moves the ith element with the (i-1)th element already present in AL
ADD SI, 1: Increment SI to point to the next position
MOV [SI], AL: Store the sum in the new position
LOOP L1: The instructions between label L1 and this LOOP instruction are executed "CX" times



