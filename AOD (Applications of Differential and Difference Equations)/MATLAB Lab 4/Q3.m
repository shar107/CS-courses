Problem:

Reduce the third order equation y^'''+2y^''-y^'-2y=0 to the system of first order linear equations and solve by matrix method.
                                     

Solution:

Reduction of third order ordinary differential equation into first order:
Let  y_1=y;  y_2=y_1^'=y^';  y_3=y_2^'=y^'';  y_3^'=y^'''

'
Formed Matrix:  [(010 001 21-2)]  {[(R1C1.R1C2.R1C3 R2C1.R2C2.R3C3 R3C1.R3C2.R3C3)]}



Code in MATLAB Editor:

clear all
clc
syms t C1 C2 C3
A=input('Enter A: ');
[P,D]=eig(A);
L1=D(1);L2=D(5);L3=D(9)
y1=C1*exp(L1*t);y2=C2*exp(L2*t);y3=C3*exp(L3*t);
Y=[y1;y2;y3];
X=P*Y;
disp(X);



Input in Command Window:

Enter A: [0 1 0; 0 0 1; 2 1 -2]



Output in Command Window:

L3 =

     1

     (3^(1/2)*C2*exp(-t))/3 + (21^(1/2)*C1*exp(-2*t))/21 - (3^(1/2)*C3*exp(t))/3
 - (3^(1/2)*C2*exp(-t))/3 - (2*21^(1/2)*C1*exp(-2*t))/21 - (3^(1/2)*C3*exp(t))/3
   (3^(1/2)*C2*exp(-t))/3 + (4*21^(1/2)*C1*exp(-2*t))/21 - (3^(1/2)*C3*exp(t))/3
