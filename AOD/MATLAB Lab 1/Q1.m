Problem:

Input a matrix A, verify Cayley Hamilton Theorem and hence find the inverse of A. (Check whether inverse exists or not.)


Code in MATLAB Editor:


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




Input & Output in Command Window:


>> Q1
Enter matrix A: [1 2 1; 3 1 3; 4 2 3]
Inverse exists
R.H.S. of C-H Theorem: 
     0     0     0
     0     0     0
     0     0     0

Inverse of matrix A: 
   -0.6000   -0.8000    1.0000
    0.6000   -0.2000   -0.0000
    0.4000    1.2000   -1.0000

>> Q1
Enter matrix A: [6 1 1; 0 0 3; 0 0 4]
Inverse does not exist


R.H.S. of C-H Theorem: 
     0     0     0
     0     0     0
     0     0     0

Inverse of matrix A: 
   NaN   Inf  -Inf
   NaN  -Inf   Inf
   NaN   NaN   NaN
