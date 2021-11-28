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
