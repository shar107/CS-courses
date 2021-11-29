Aim: To write a program which displays numbers in LED display.


Theory: 
•	An LED display is available in EMU8086 with port address 199.
•	It consists of 5 LED based display which can be used to show a number (both positive and negative).
•	The display number can be provided using any 8086 ALP or using a simple loop.


Algorithm: 

1.	Initialize the virtual LED display
2.	Load 0 in the display
3.	Store an arbitrary positive number in AX and send it IO
4.	Store an arbitrary negative number in AX and send it IO
5.	Initialize AX by 0
6.	Start from 0. Each step increases one value and load the updated number in the LED display. Continue to increase the value.


 Code: 

#start=led_display.exe# 
#make_bin# 
name "led" 
mov ax, 1234 
out 199, ax 
mov ax, -5678 
out 199, ax
mov ax, 0 
x1: out 199, ax 
inc ax 
jmp x1 
hlt 


