Problem:

Diagonalize a symmetric matrix A by finding an orthogonal matrix P and hence find An (n=8).



Code in MATLAB Editor:


A=input('Enter a matrix for diagonalization: ')
[P D]=eig(A);
if A'==A
 disp('Orthogonal transformation is possible.')
else
 disp('Orthogonal transformation is not possible.')
end
disp('Modal matrix P: ')
disp(P)
NormP=normc(P);
D=NormP'*A*NormP;
disp('Diagonalized matrix: ')
disp(round(D))
disp('A^8 = ')
disp(round(NormP*D^8*NormP'))




Input & Output in Command Window:


>> Q3
Enter a matrix for diagonalization: [1 2 3; 2 4 6; 3 6 9]

A =

     1     2     3
     2     4     6
     3     6     9

Orthogonal transformation is possible.
Modal matrix P: 
    0.8944    0.3586    0.2673
   -0.4472    0.7171    0.5345
         0   -0.5976    0.8018

Diagonalized matrix: 
     0     0     0
     0     0     0
     0     0    14


A^8 = 
   105413504   210827008   316240512
   210827008   421654016   632481024
   316240512   632481024   948721536
