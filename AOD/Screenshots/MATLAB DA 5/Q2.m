%Declarations:

syms p(n) z
assume(n>=0 & in(n,'integer'))
f = p(n+2) - p(n+1) - p(n)

f = p(n + 2) - p(n+1) - p(n)


%Solving:

fZT = ztrans(f,n,z)

fZT = z*ztrans(p(n),n,z) - z*p(1) + z^2*ztrans(p(n),n,z) - z^2*p(0) - ztrans(p(n),n,z)

syms pZT
fZT = subs(fZT,ztrans(p(n),n,z),pZT)

fZT = z*p(0) - pZT - z*p(1) - pZT*z - z^2*p(0) + pZT*z^2
pZT = solve(fZT,pZT)

pZT = - (z*p(1) - z*p(0) + z^2*p(0)) / (- z^2 + z + 1)

pSol = iztrans(pZT,z,n);
pSol = simplify(pSol)

pSol = 2*(-1)^(n/2)*cos(n*(pi/2 + asinh(1/2)*1i))*p(1) + (2^(2 - n)*5^(1/2)*(5^(1/2) + 1)^(n - 1)*(p(0)/2 - p(1)))/5 - (2*2^(1 - n)*5^(1/2)*(1 - 5^(1/2))^(n - 1)*(p(0)/2 - p(1)))/5


%Substitution:

pSol = subs(pSol,[p(0) p(1)],[0 1])

pSol = 2*(-1)^(n/2)*cos(n*(pi/2 + asinh(1/2)*1i)) - (2^(2 - n)*5^(1/2)*(5^(1/2) + 1)^(n - 1))/5 + (2*2^(1 - n)*5^(1/2)*(1 - 5^(1/2))^(n - 1))/5


%Plot:

nValues = 1:10;
pSolValues = subs(pSol,n,nValues);
pSolValues = double(pSolValues);
pSolValues = real(pSolValues);
stem(nValues,pSolValues)
title('Q.2 difference eq. for Fibonacci nos. using Z-transform')
xlabel('x-axis')
ylabel('y-axis')
grid off
