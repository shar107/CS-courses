 
MAT 1011 
MATLAB
L31+L32
FALL SEMESTER 2019-20
SHARADINDU ADHIKARI
19BCE2105
Question 1
Using ‘surf’ plot the surface 𝑓(𝑥, 𝑦) = 𝑥(𝑥
2 + 𝑦
2
).
syms x y
f = x*(x^2+y^2) 
ezsurf(f) 
colormap spring
f =
x*(x^2 + y^2)

Question 2
Expand 𝑓(𝑥, 𝑦) = 𝑒
𝑥
ln(1 + 𝑦) in terms of x and y up to the terms of 3rd degree using 
Taylor series.
syms x y 
f = input('Enter the function f(x,y): '); 
I = input('Enter the point [a,b] at which Taylor series is sought: '); 
a = I(1);b=I(2); 
n=input('enter the order of series:'); 
tayser=taylor(f,[x,y],[a,b],'order',n); 
subplot(1,2,1); 
ezsurf(f); 
subplot(1,2,2); 
ezsurf(tayser);
Enter the function f(x,y): exp(x)*(log(1+y))
Enter the point [a,b] at which Taylor series is sought: [0,0]
enter the order of series:3

Question 3
Find the maxima and minima for the function 𝑓(𝑥, 𝑦) = 𝑥
4 + 𝑦
4 − 𝑥
2 − 𝑦
2 + 1
syms x y
f= input('Enter the function f(x,y):'); 
p= diff(f,x); q=diff(f,y); 
[ax,ay]=solve(p,q); 
ax=double(ax);ay=double(ay); 
r= diff(p,x); s=diff(p,y); t =diff(q,y);D=r*t-s^2; 
figure 
ezsurf(f); 
legstr={'Function Plot'};% for Legend
for i=1:size(ax) 
T1=subs(D,{x,y},{ax(i),ay(i)}); 
T2=subs(r,{x,y},{ax(i),ay(i)}); 
T3=subs(f,{x,y},{ax(i),ay(i)}); 
if (double(T1) == 0) 
sprintf('At (%f,%f) further investigation is required', ax(i),ay(i)) 
legstr=[legstr,{'Case of Further investigation'}]; 
mkr='ko'; 
elseif (double(T1) < 0) 
sprintf('The point (%f,%f) is a saddle point', ax(i),ay(i)) 
legstr=[legstr,{'Saddle Point'}]; % updating Legend 
mkr='bv'; % marker 
else 
if (double(T2) < 0) 
sprintf('The maximum value of the function is 
f(%f,%f)=%f',ax(i),ay(i),double(T3)) 
legstr=[legstr,{'Maximum value of the function'}];% updating Legend
mkr='g+';% marker 
else 
sprintf('The minimum value of the function is 
f(%f,%f)=%f',ax(i),ay(i),double(T3)) 
legstr=[legstr,{'Minimum value of the function'}];% updating Legend 
mkr='r*'; % marker
end 
end 
hold on
plot3(ax(i),ay(i),T3,mkr,'Linewidth',4); 
end
legend(legstr,'Location','Best'); 
Enter the function f(x,y):(x^4)+(y^4)-(x^2)-(y^2)+1
ans =
 'The point (-0.707107,0.000000) is a saddle point'
ans =
 'The point (0.707107,0.000000) is a saddle point'
ans =
 'The point (0.000000,-0.707107) is a saddle point'
ans =
 'The point (0.000000,0.707107) is a saddle point'
ans =
 'The maximum value of the function is f(0.000000,0.000000)=1.000000'
ans =
 'The minimum value of the function is f(-0.707107,-0.707107)=0.500000'
ans =
 'The minimum value of the function is f(0.707107,-0.707107)=0.500000'
ans =
 'The minimum value of the function is f(-0.707107,0.707107)=0.500000'
ans =
 'The minimum value of the function is f(0.707107,0.707107)=0.500000'

Question 4
Find the maxima and minima for the function 𝑓(𝑥, 𝑦) = 𝑥
3 + 3𝑥𝑦2 − 15𝑥
2 − 15𝑦
2 + 72𝑥
syms x y
f= input('Enter the function f(x,y):'); 
p= diff(f,x); q=diff(f,y); 
[ax,ay]=solve(p,q); 
ax=double(ax);ay=double(ay); 
r= diff(p,x); s=diff(p,y); t =diff(q,y);D=r*t-s^2; 
figure 
ezsurf(f); 
legstr={'Function Plot'};% for Legend 
for i=1:size(ax) 
T1=subs(D,{x,y},{ax(i),ay(i)}); 
T2=subs(r,{x,y},{ax(i),ay(i)}); 
T3=subs(f,{x,y},{ax(i),ay(i)}); 
if (double(T1) == 0) 
sprintf('At (%f,%f) further investigation is required', ax(i),ay(i)) 
legstr=[legstr,{'Case of Further investigation'}]; 
mkr='ko'; 
elseif (double(T1) < 0) 
sprintf('The point (%f,%f) is a saddle point', ax(i),ay(i)) 
legstr=[legstr,{'Saddle Point'}]; % updating Legend 
mkr='bv'; % marker 
else 
if (double(T2) < 0) 
sprintf('The maximum value of the function is 
f(%f,%f)=%f',ax(i),ay(i),double(T3)) 
legstr=[legstr,{'Maximum value of the function'}];% updating Legend 
mkr='g+';% marker 
else 
sprintf('The minimum value of the function is 
f(%f,%f)=%f',ax(i),ay(i),double(T3)) 
legstr=[legstr,{'Minimum value of the function'}];% updating Legend 
mkr='r*'; % marker 
end 
end 
hold on
plot3(ax(i),ay(i),T3,mkr,'Linewidth',4); 
end 
legend(legstr,'Location','Best');
Enter the function f(x,y): (x^3)+(3*x*(y^2))-(15*x^2)-(15*y^2)+(72*x)

ans =
 'The maximum value of the function is f(4.000000,0.000000)=112.000000'
ans =
 'The minimum value of the function is f(6.000000,0.000000)=108.000000'
ans =
 'The point (5.000000,-1.000000) is a saddle point'
ans =
 'The point (5.000000,1.000000) is a saddle point'
End 