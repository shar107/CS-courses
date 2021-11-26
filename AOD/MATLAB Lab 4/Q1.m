Problem:

Solve the following:
(a)  x_1^'= 3x_1-2x_2;  x_2^'= 2x_1-2x_2;  x_1 (0)= 1,x_2 (0)= -1
(b)  x_1^'= -x_2+x_3;  x_2^'= 4x_1-x_2-4x_3;  x_3^'= -3x_1-x_2+4x_3

'


Solutions:

(a)



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
Cond=input('Enter the initial conditions [t0, x10,x20]: ');
t0=Cond(1);x10=Cond(2);x20=Cond(3);
eq1=subs(X(1)-x10,t0);eq2=subs(X(2)-x20,t0);
[C1, C2] = solve(eq1,eq2);
X=subs(X);
disp(X);



Input in Command Window:

Enter A: [3 -2; 2 -2]
Enter the initial conditions [t0, x10,x20]: [0 1 -1]



Output in Command Window:

2*exp(2*t) - exp(-t)
exp(2*t) - 2*exp(-t)


__________


(b)


Code in MATLAB Editor:

clear all
close all
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

Enter A: [0 -1 1; 4 -1 -4; -3 -1 4]



Output in Command Window:

L3 =

   -1.0000

                                                 (6^(1/2)*C3*exp(-t))/6 - (6^(1/2)*C1*exp(3*t))/6 + (2^(1/2)*C2*exp(t))/2
 (6^(1/2)*C1*exp(3*t))/6 - (7165183131591449*C2*exp(t))/10141204801825835211973625643008 + (2^(1/2)*3^(1/2)*C3*exp(-t))/3


