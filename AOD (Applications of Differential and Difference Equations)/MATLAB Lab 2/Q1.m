Problem:

Input a function f(x) which is periodic in the interval (a, b). Find fourier series for f(x) up to  n harmonics and hence plot f(x) for its fourier series.

Run code for the following:

	f(x) = x2,  a = − π,  b = π		(up to 3 harmonics)


1 + 2x/π,  − π ≤ x ≤ 0
	f(x) = 				(up to 3 harmonics)
1 −  2x/π,     0 ≤ x ≤ π




Code in MATLAB Editor:

clear all
close all
clc
syms x
f =input('Enter the function of x: ');
I=input('Enter the interval of [a,b]: ');
m=input('Enter the number of Harmonics required: ');
a=I(1);b=I(2);
L=(b-a)/2;
a0=(1/L)*int(f,a,b);
Fx=a0/2;
for n=1:m
figure;
an(n)=(1/L)*int(f*cos(n*pi*x/L),a,b);
bn(n)=(1/L)*int(f*sin(n*pi*x/L),a,b);
Fx=Fx+an(n)*cos(n*pi*x/L)+bn(n)*sin(n*pi*x/L);
Fx=vpa(Fx,4);
ezplot(Fx,[a,b]);
hold on
ezplot(f,[a,b]);
title(['Fourier Series with ',num2str( n ),'harmonics']);
legend('Fourier Series', 'Function Plot');
hold off
end
disp(strcat('Fourier series with', num2str(n),'harmonicsi is:',char(Fx)))






Input & Output in Command Window along with screenshots of Graphs:


(i)
Enter the function of x: x^2
Enter the interval of [a,b]: [-pi,pi]
Enter the number of Harmonics required: 3
Fourier series with3harmonicsi is:1.0*cos(2.0*x) - 0.4444*cos(3.0*x) - 4.0*cos(x) + 3.29

(ii)
Enter the function of x: (1+2*x/pi)*(heaviside(x+pi)-heaviside(x))+(1-2*x/pi)*(heaviside(x)-heaviside(x-pi))
Enter the interval of [a,b]: [-pi,pi]
Enter the number of Harmonics required: 3
