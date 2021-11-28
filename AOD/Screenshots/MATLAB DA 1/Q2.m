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
