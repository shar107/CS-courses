A=input('Enter matrix A: ');
cf=poly(A);
n=length(cf);
CH=cf(1)*A^(n-1);
if det(A)==0
	disp('Inverse does not exist')
else
	disp('Inverse exists')
end
for i=2:n
	CH=CH+cf(i)*A^(n-i);
end
disp('R.H.S. of C-H Theorem: ')
disp(round(CH))

INV=cf(1)*A^(n-2);
for i=2:n-1
	INV=INV+cf(i)*A^(n-i-1);
end
INV=INV/(-cf(n));
disp('Inverse of matrix A: ')
disp(INV)
