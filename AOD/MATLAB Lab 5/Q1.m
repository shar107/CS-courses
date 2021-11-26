Problem:

Solve the following difference equations using Z-transform:
(a)  y_(n+2)-5y_(n+1)+6y_n=5^n,n≥0,y_0=1  and  y_1=1
(b)  y(n+2)-y(n)=2^n,n≥0,y_0=0  and  y_1=1



Solutions:

(a)



Code in MATLAB:


%Declarations:
 
syms p(n) z
assume(n>=0 & in(n,'integer'))
f = p(n+2) - p(n+1) - p(n)
 
f = p(n + 2) - p(n + 1) - p(n)
 
 
%Solving:
 
fZT = ztrans(f,n,z)
 
fZT = 5*z*p(0) - 5*z*ztrans(p(n),n,z) - z/(z-5) - z*p(1) + z^2*ztrans(p(n),n,z) - z^2*p(0) + 6*ztrans(p(n),n,z)
 
syms pZT
fZT = subs(fZT,ztrans(p(n),n,z),pZT)
 
fZT = 6*pZT - z/(z-5) + 5*z*p(0) - z*p(1) - 5*pZT*z - z^2*p(0) +pZT*z^2
 
pZT = solve(fZT,pZT)
 
pZT = (z/(z-5) - 5*z*p(0) + z*p(1) + z^2*p(0))/(z^2 - 5*z + 6)
 
pSol = iztrans(pZT,z,n);
pSol = simplify(pSol)
 
pSol = 3*2^n*p(0) - 2^n*p(1) - 2*3^n*p(0) + 3^n*p(1) + 2^n/3 - 3^n/2 + 5^n/6
 
 
%Substitution:
 
pSol = subs(pSol,[p(0) p(1)],[1 1])
 
pSol = (7*2^n)/3 - (3*3^n)/2 + 5^n/6
 
 
%Plot:
 
nValues = 1:10;
pSolValues = subs(pSol,n,nValues);
pSolValues = double(pSolValues);
pSolValues = real(pSolValues);
stem(nValues,pSolValues)
title('Q.1 (a) difference eq. using Z-transform')
xlabel('x-axis')
ylabel('y-axis')
grid off




(b)


Code in MATLAB:


%Declarations:
 
syms p(n) z
assume(n>=0 & in(n,'integer'))
f = p(n+2) - p(n) - 2^(n)
 
f = p(n + 2) - p(n) - 2^(n)
 
 
%Solving:
 
fZT = ztrans(f,n,z)
 
fZT = z^2*ztrans(p(n),n,z) - z*p(1) - z/(z-2) - z^2*p(0) - ztrans(p(n),n,z)
 
syms pZT
fZT = subs(fZT,ztrans(p(n),n,z),pZT)
 
fZT = pZT*z^2 - z/(z-2) - z*p(1) - z^2*p(0) - pZT
pZT = solve(fZT,pZT)
 
pZT = (z/(z-2) + z*p(1) + z^2*p(0))/(z^2 - 1)
 
pSol = iztrans(pZT,z,n);
pSol = simplify(pSol)
 
pSol = p(0)/2 + p(1)/2 + ((-1)^n*p(0))/2 - ((-1)^n*p(1))/2 + (-1)^n/6 + 2^n/3 - 1/2
 
 
%Substitution:
 
pSol = subs(pSol,[p(0) p(1)],[0 1])
 
pSol = 2^n/3 - (-1)^n/3
 
 
%Plot:
 
nValues = 1:10;
pSolValues = subs(pSol,n,nValues);
pSolValues = double(pSolValues);
pSolValues = real(pSolValues);
stem(nValues,pSolValues)
title('Q.1 (b) difference eq. using Z-transform')
xlabel('x-axis')
ylabel('y-axis')
grid off
