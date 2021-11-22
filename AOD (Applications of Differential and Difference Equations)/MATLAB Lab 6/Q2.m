Problem:

Write a general MATLAB code to solve a nonhomogeneous difference equation using Z transform method and hence take the differential d equation y_n+2 + 4y_n+1 + 3y_n = 3^n with y(0) = 0, y(1) = 1 as input and show the output.



Solutions:


Procedure:
1.	Input the difference equation coefficients and the right hand side function of (1).
2.	Input the initial conditions (2).
3.	Apply Z–Transform and find Y (z) .
4.	Apply inverse Z – Transform and find yn .



Code in MATLAB Editor:

clc
syms n z y(n) Y
yn=y(n);
yn1=y(n+1);
yn2=y(n+2);
F = input('Input the coefficients [a,b,c]: ');
a=F(1);b=F(2);c=F(3);
nh = input('Enter the non-homogenous part f(n): ');
eqn=a*yn2+b*yn1+c*yn-nh;
ZTY=ztrans(eqn);
IC=input('Enter the initial conditions in the form [y0,y1]:');
y0=IC(1);y1=IC(2);
ZTY=subs(ZTY,{ztrans(y(n),n,z),y(0),y(1)},{Y,y0,y1});
eq=collect(ZTY,Y);
Y=simplify(solve(eq,Y));
yn=simplify(iztrans(Y));
disp('The solution of the difference equation yn=')
disp(yn);
m=0:20;
y=subs(yn,n,m);
stem(y)
title('Difference equation');
xlabel('n'); ylabel('y(n)');




Input in Command Window:

Input the coefficients [a,b,c]: [1, 4, 3]
Enter the non-homogenous part f(n): 3^n
Enter the initial conditions in the form [y0,y1]:[0 1]




Output in Command Window:

The solution of the difference equation yn=
(3*(-1)^n)/8 - (5*(-3)^n)/12 + 3^n/24

