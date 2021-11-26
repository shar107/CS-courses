Problem:

Write a code to obtain a fourier series for given set of n data points. Run the code for the following data (for 4 harmonics):

(i)
x		0	1	2	3	4	5	6
f(x)	6	15	18	22	17	12	6

(ii)
x		0	30		60		90		120		150		180
f(x)	0	5224	8097	7850	5499	2626	0




Code in MATLAB Editor:

clc
clear all
syms x
X= input ( ' Enter X = ' ) ;
Y= input ( ' Enter Y = ' ) ;
n= length (X) ;
c=(X(n)-X (1))/2 ;
a0 =2 *sum(Y ( 1 : n-1 ))/ (n-1)
a1 =2 *sum(Y ( 1 : n-1 ).*cos (1*pi *X ( 1 : n-1)/c ) ) / ( n-1)
b1 =2 *sum(Y ( 1 : n-1 ).* sin(1 *pi*X ( 1 : n-1)/c ) ) / ( n-1)
a2 =2 *sum(Y ( 1 : n-1 ).*cos (2 *pi*X ( 1 : n-1)/c ) ) / ( n-1)
b2 =2 *sum(Y ( 1 : n-1 ).* sin(2 *pi*X ( 1 : n-1)/c ) ) / ( n-1)
a3 =2 *sum(Y ( 1 : n-1 ).*cos (3*pi *X ( 1 : n-1)/c ) ) / ( n-1)
b3 =2 *sum(Y ( 1 : n-1 ).* sin(3 *pi*X ( 1 : n-1)/c ) ) / ( n-1)
a4 =2 *sum(Y ( 1 : n-1 ).*cos (4 *pi*X ( 1 : n-1)/c ) ) / ( n-1)
b4 =2 *sum(Y ( 1 : n-1 ).* sin(4 *pi*X ( 1 : n-1)/c ) ) / ( n-1)
fs ( x ) = a0 /2+ a1 *cos(1 *pi *x/c ) + b1 * sin (1 *pi *x/c ) 
+ a2 *cos (2 *pi *x/c ) + b2 * sin (2 *pi *x/c )+a3 *cos(3 *pi *x/c ) + b3* sin(3 *pi *x/c) 
+ a4 *cos (4 *pi *x/c ) + b4 * sin (4 *pi *x/c );
stem (X , Y )
hold on
grid on
ezplot(fs , [ X ( 1 ) X ( n ) ] )
title (' for example, Fourier Series fs ( x ) upto 2nd harmonic is: ' )
legend (' Data ' , ' fs ( x ) ' )





Input & Output in Command Window (along with screenshots of graph as example):


(i)
Enter X = [0 pi/3 2*pi/3 pi 4*pi/3 5*pi/3]
Enter Y = [6 15 18 22 17 12]

a0 =
   31.2000
a1 =
   -6.5889
b1 =
   -1.7013
a2 =
   -3.0111
b2 =
    1.0515
a3 =
   -3.0111
b3 =
   -1.0515
a4 =
   -6.5889
b4 =
    1.7013

fs(x) =
78/5 - (239436916469791*sin((6*x)/5))/140737488355328 - (3709195267446615*cos((6*x)/5))/562949953421312
  
ans =
 
(4735364881273667*sin((12*x)/5))/4503599627370496 - (6780497141591929*cos((18*x)/5))/2251799813685248 - (6780497141591955*cos((12*x)/5))/2251799813685248 - (2367682440636805*sin((18*x)/5))/2251799813685248



(ii)
Enter X = [0 pi/6 2*pi/6 3*pi/6 4*pi/6 5*pi/6 pi]
Enter Y = [0 5224 8097 7850 5499 2626 0]

a0 =
   9.7653e+03
a1 =
  -3.5743e+03
b1 =
   1.5000e+03
a2 =
 -957.6667
b2 =
   1.0611e-12
a3 =
 -701.3333
b3 =
  -1.4033e-12
a4 =
 -957.6667
b4 =
   1.8190e-12

fs(x) =
(6596876249771225*sin(2*x))/4398046511104 - (10723*cos(2*x))/3 + 14648/3
 
ans =

(5254199565265579*sin(4*x))/4951760157141521099596496896 - (2104*cos(6*x))/3 - (2873*cos(4*x))/3 - (6948770760787715*sin(6*x))/4951760157141521099596496896
 
