 
MAT 1011 
MATLAB
L31+L32
FALL SEMESTER 2019-20
SHARADINDU ADHIKARI
19BCE2105
Question 1
Verify Rolle’s Theorem for the function (𝑥 + 2)
3
(𝑥 − 3)
4
in the interval [−2,3]. Plot the 
curve along with the secant joining the end points and the tangents at points which satisfy 
Rolle’s Theorem.
clear all;
clc;
syms x c;
f=input('Enter the function: ');
I=input('Enter the interval [a,b]: ');
a=I(1); b=I(2);
fa=subs(f,x,a);fb=subs(f,x,b);
df=diff(f,x); dfc=subs(df,x,c);
if fa==fb
c=solve(dfc);
count=0;
for i=1:length(c)
if c(i)>a && c(i)<b
count=count+1;
r(count)=c(i);
end
end
values=sprintf('The values of c between %d and %d which satisfy Rolles 
theorem are x=',a,b);
disp(values)
disp(r)
else
disp('f(a) and f(b) are not equal, function does not satisfy conditions for 
Rolles theorem');
end
tval=subs(f,x,r);
xval=linspace(a,b,100);
yval=subs(f,x,xval);
plot(xval,yval);
[p,q]=size(xval);
for i=1:length(tval)
hold on;
plot(xval,tval(i)*ones(p,q),'r');
hold on;
plot(r(i),tval(i),'ok');
end
hold off;
legend('Function','Tangent');
title('Demonstration of Rolles theorem');
Enter the function: ((x+2)^3)*((x-3)^4)
Enter the interval [a,b]: [-2,3]
The values of c between -2 and 3 which satisfy Rolles theorem are x =
1/7

Question 2
Verify Lagrange’s Mean Value Theorem for the function 𝑓(𝑥) = 𝑥
2 + 𝑒
3𝑥
in the interval 
[0,1]. Plot the curve along with the secant joining the end points and the tangents at points 
which satisfy Lagrange’s Mean Value Theorem.
clear all;
clc;
syms x c;
f=input('Enter the function: ');
I=input('Enter the interval [a,b]: ');
a=I(1); b=I(2);
fa=subs(f,x,a);fb=subs(f,x,b);
df=diff(f,x);
dfc=subs(df,x,c);
LM=dfc-(fb-fa)/(b-a);
c=solve(LM);
count=0;
for i=1:length(c)
if c(i)>a && c(i)<b
count=count+1;
tx(count)=c(i);
end
end
fprintf('The values of c between %d and %d which satisfy LMVT are x=',a,b);
disp(double(tx)) 
xval=linspace(a,b,100);
yval=subs(f,x,xval);
m=subs(df,tx) ; % Slopes of tangents at the points between a and b.
ty=subs(f,x,tx) ;
plot(xval,yval);
hold on;
secant_slope=(fb-fa)/(b-a);
secant_line=fa+secant_slope*(x-a);
sx_val=xval;
sy_val=subs(secant_line,x,sx_val);
plot(sx_val,sy_val);
hold on;
for i=1:length(tx)
txval=linspace(tx(i)-1,tx(i)+1,20);
t_line=ty(i)+m(i)*(x-tx(i));
tyval=subs(t_line,x,txval);
plot(txval,tyval,'k');
hold on
plot(tx(i),ty(i),'ok');
end
hold off;
grid on
legend('Function','Secant','Tangents');
title('Demonstration of LMVT');
Enter the function: x+exp(3*x)
Enter the interval [a,b]: [0,1]
The values of c between 0 and 1 which satisfy LMVT are x = 0.6168

Question 3
Find the local and global maxima and minima for the function 𝑥
3 − 12𝑥 − 5, 𝑥 ∈ (−4,4).
clear all;
clc;
syms x c;
f=input('Enter the function: ');
I=input('Enter the interval [a,b]: ');
a=I(1); b=I(2);
fa=subs(f,x,a);fb=subs(f,x,b);
df=diff(f,x);
dfc=subs(df,x,c);
ddf=diff(df,x);
c=solve(df,x);
for i=1:length(c)
loc(i)=subs(ddf,x,c(i));
glo(i)=subs(f,x,c(i));
if c(i)>a && c(i)<b
end
if loc(i)<0
fprintf('\nThe local maxima of f(x) is %d ',c(i));
end
if loc(i)>0
fprintf('\nThe local minima of f(x) is %d ',c(i));
end
end
glomax=min(c);
glomin=max(c);
for i=1:length(c)
 if c(i)==glomax
 maxi=glo(i);
 end
 if c(i)==glomin
 mini=glo(i);
 end
end
fprintf('\nThe global maxima of f(x) is %d ',maxi);
fprintf('\nThe global minima of f(x) is %d ',mini);
xval=linspace(a,b,100);
yval=subs(f,x,xval);
plot(xval,yval);
title('x^3 - 12*x - 5') ;
Enter the function: x^3 - 12*x - 5
Enter the interval [a,b]: [-4,4]
The local maxima of f(x) is -2 
The local minima of f(x) is 2 
The global maxima of f(x) is 11 
The global minima of f(x) is -21

Question 4
Find the global extrema of the function 𝑓(𝑥) = 𝑥
2𝑒
𝑠𝑖𝑛𝑥 −
𝑥
𝑥
3+1
 on the interval [0,5].
clear all;
clc;
syms x c;
f=input('Enter the function: ');
I=input('Enter the interval [a,b]: ');
a=I(1); b=I(2);
df=diff(f,x);
c=solve(df==0,x);
for i=1:length(c)
if c(i)>=a && c(i)<=b
 glo(i)=subs(f,x,c(i));
end
end
arr=cat(2,glo,I)
maxi=max(arr)
mini=min(arr)
fprintf('\nThe global maxima of f(x) is %d ',maxi);
fprintf('\nThe global minima of f(x) is ');
mini
xval=linspace(a,b,100);
yval=subs(f,x,xval);
plot(xval,yval);
title('((x^2) * (exp(sin(x)))) – (x/((x^3)+1))');
Enter the function: (x^2)*exp(sin(x)) - (x/(x^3 + 1))
Enter the interval [a,b]: [0,5]
arr = [-0.17122769633059279113146995518666, 0, 5]
maxi = 5
mini = -0.17122769633059279113146995518666
The global maxima of f(x) is 5 
The global minima of f(x) is -0.17122769633059279113146995518666
End