Problem:

Find the current I(t) in an RLC circuit with R = 11 Ω, L=0.1 H, C=10-2 F, which is connected to a source of voltage E(t) = 100 sin400t. Assume that the current and the charge are zero when t=0, plot the graph for charge and current for 0 ≤ t ≤ 3.
                                   


Code in MATLAB Editor:

clear all
close all
clc
syms c1 c2 x m
F=input('Enter the coefficients [a,b,c]: ');
f=input('Enter the RHS function f(x): ');
a=F(1);b=F(2);c=F(3);
AE=a*m^2+b*m+c; % Auxilliary Equation
m=solve(AE);
m1=m(1); m2=m(2);
D=b^2-4*a*c;
if(D>0) % Roots are real and different
y1=exp(m1*x);y2=exp(m2*x);
elseif (D==0)% Roots are real and equal
y1=exp(m1*x);y2=x*exp(m1*x);
else % Roots are complex
alfa=real(m1);beta=imag(m1);
y1=exp(alfa*x)*cos(beta*x);
y2=exp(alfa*x)*sin(beta*x);
end
yc=c1*y1+c2*y2; % Complimentary Solution
%%% Particular Integral by Method of variation of parameters.
fx=f/a;
W=y1*diff(y2,x)-y2*diff(y1,x); %%% Wronskian%%%
u=int(-y2*fx/W,x);
v=int(y1*fx/W,x);
yp=y1*u+y2*v; %%%Particular Integral%%%
y_gen=yc+yp; %%%General Solution%%%
check=input('If the problem has initial conditions then enter 1 else enter 2: ');
if(check==1)
cn=input('Enter the initial conditions [x0, y(x0), Dy(x0)]:');
dy_gen=diff(y_gen);
eq1=(subs(y_gen,x,cn(1))-cn(2));
eq2=(subs(dy_gen,x,cn(1))-cn(3));
[c1 c2]=solve(eq1,eq2);
y=simplify(subs(y_gen));
disp('The complete solution is');
disp(y);
ezplot(y, [cn(1),cn(1)+2]);
else
y=simplify(y_gen);
disp('The General Solution is ');
disp(y);
end



Input in Command Window:

Enter the coefficients [a,b,c]: [1 110 1000]
Enter the RHS function f(x): 1000*sin(400*x)
If the problem has initial conditions then enter 1 else enter 2: 1
Enter the initial conditions [x0, y(x0), Dy(x0)]:[0 0 0]



Output in Command Window:

The complete solution is
(400*exp(-10*x))/14409 - (44*cos(400*x))/27217 - (4*exp(-100*x))/153 - (159*sin(400*x))/27217
