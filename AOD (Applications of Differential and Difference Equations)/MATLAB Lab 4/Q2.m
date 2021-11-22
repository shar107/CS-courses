Problem:

Solve the following:
(a)  x_1^''= -5x_1+2x_2;  x_2^''= 2x_1-2x_2
(b)  x_1^''+2x_1-x_2=0;  x_2^''-x_1+2x_2=0
                                   


Solutions:

(a) 

Algorithm:
First, we’re reducing the second order ordinary differential equation to first order, and thereafter solve it using the matrix method

Final equation after reduction:
y_1^'=-5y_2+2z_2;  z_1^'=2y_2-2z_2;  where x_1^'=y_1 and x_2^'=z_1



Code in MATLAB Editor:

clear all
close all
clc
syms t C1 C2
A=input('Enter A: ');
[P,D]=eig(A);
L1=D(1);L2=D(4);
y1=C1*exp(L1*t);y2=C2*exp(L2*t);
Y=[y1;y2];
X=P*Y;
disp(X);
integral=int(X,t);
disp(integral)



Input in Command Window:

Enter A: [-5 2; 2 -2]



Output in Command Window:

- (5^(1/2)*C2*exp(-t))/5 - (2*5^(1/2)*C1*exp(-6*t))/5
   (5^(1/2)*C1*exp(-6*t))/5 - (2*5^(1/2)*C2*exp(-t))/5
 
   (5^(1/2)*C2*exp(-t))/5 + (5^(1/2)*C1*exp(-6*t))/15
 (2*5^(1/2)*C2*exp(-t))/5 - (5^(1/2)*C1*exp(-6*t))/30

________________



(b) 

Algorithm:
First, we’re reducing the second order ordinary differential equation to first order, and thereafter solve it using the matrix method

Final equation after reduction:
y_1^'=-2y_2+1z_2;  z_1^'=1y_2-2z_2;  where x_1^'=y_1 and x_2^'=z_1


Code in MATLAB Editor:

clear all
close all
clc
syms t C1 C2
A=input('Enter A: ');
[P,D]=eig(A);
L1=D(1);L2=D(4);
y1=C1*exp(L1*t);y2=C2*exp(L2*t);
Y=[y1;y2];
X=P*Y;
disp(X);
integral=int(X,t);
disp(integral)




Input in Command Window:

Enter A: [-2 1; 1 -2]



Output in Command Window:

(2^(1/2)*C2*exp(-t))/2 + (2^(1/2)*C1*exp(-3*t))/2
 (2^(1/2)*C2*exp(-t))/2 - (2^(1/2)*C1*exp(-3*t))/2
 
 - (2^(1/2)*C2*exp(-t))/2 - (2^(1/2)*C1*exp(-3*t))/6
   (2^(1/2)*C1*exp(-3*t))/6 - (2^(1/2)*C2*exp(-t))/2

