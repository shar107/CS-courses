Aim: To write an assembly language program to display numbers in LED display




Code:


; To write an assembly language program to display numbers in LED display
; by Sharadindu Adhikari, 19BCE2105



#start=led_display.exe#


#make_bin#

name "led"

mov ax, 2056
out 199, ax

mov ax, -5678
out 199, ax

; Eternal loop to write
; values to port:
mov ax, 0
x1:
  out 199, ax  
  inc ax
jmp x1

hlt




