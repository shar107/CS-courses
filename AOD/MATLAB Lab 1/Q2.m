Problem:

Diagonalize a matrix A by similarity transformation and hence find An (n=9).
                                     


Code in MATLAB Editor:


A=input('Enter the matrix for diagonalization: ');
[P D]=eig(A);
disp('Given Matrix A: ')
disp(A)
disp('Modal Matrix P: ')
disp(P)
disp('Inverse of Matrix P: ')
PI=inv(P);
disp(PI)
D=det(P);
Drt=round(P,0);
if (Drt==0)
disp('Non Digonalizable');
end
disp('Diagonal Matrix (D=Pˆ(-1)*A*P): ')
DM=round(inv(P)*A*P, 2);
disp(DM)
B= A^(9);
disp('Matrix A^9:');
disp(B)




Input & Output in Command Window:


>> Q2
Enter the matrix for diagonalization: [2 0 1; -2 3 4; -5 5 6]
Given Matrix A: 
     2     0     1
    -2     3     4
    -5     5     6

Modal Matrix P: 
   -0.1259   -0.7743   -0.2512
   -0.5491   -0.5559   -0.8346
   -0.8262   -0.3024    0.4902

Inverse of Matrix P: 
    0.8712   -0.7560   -0.8407
   -1.5912    0.4470   -0.0545
    0.4868   -0.9985    0.5894

Diagonal Matrix (D=Pˆ(-1)*A*P): 
    8.5600         0         0
         0    2.3900         0
         0         0    0.0500
Matrix A^9:
   -27085898    23505200    26141341
  -118097242   102478323   113967444
  -177717105   154211905   171500266
