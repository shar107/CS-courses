Problem:

Solve  y” + y = f(t),   y(0)= 1,   y^' (0)= 0,   where f(t)= 3  ∀ t ≤4  and  2t-5  ∀  t>4.
Plot the graph of solution  y.
                                   
'


Code in MATLAB Editor:

clear all
clc
syms t s y(t) Y
dy(t)=diff(y(t));
d2y(t)=diff(y(t),2);
F = input('Input the coefficients [a,b,c]: ');
a=F(1);b=F(2);c=F(3);
nh = input('Enter the non-homogenous part f(x): ');
eqn=a*d2y(t)+b*dy(t)+c*y(t)-nh;
LTY=laplace(eqn,t,s);
IC = input('Enter the initial conditions in the form [y0,Dy(0)]: ');
y0=IC(1);dy0=IC(2);
LTY=subs(LTY,{laplace(y(t), t, s),y(0),dy(0)},{Y,y0,dy0});
eq=collect(LTY,Y);
Y=simplify(solve(eq,Y));
yt=simplify(ilaplace(Y,s,t));
disp('The solution of the differential equation y(t)=')
disp(yt);
ezplot(yt,[y0,y0+2]);



Input in Command Window:

Input the coefficients [a,b,c]: [1 0 1]
Enter the non-homogenous part f(x): 3*(heaviside(t)-heaviside(t-4))+2*t-5*heaviside(t-4)
Enter the initial conditions in the form [y0,Dy(0)]: [1, 0]



Output in Command Window:

The solution of the differential equation y(t)=
2*t - 2*cos(t) - 2*sin(t) + 8*heaviside(t - 4)*(cos(t - 4) - 1) + 3


