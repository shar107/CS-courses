Problems:

(i) Write a general MATLAB code to show eigenvectors of a given matrix of order 3*3, use these vectors to construct modal matrix P and using this convert the matrix into diagonal matrix. Also cover the case when matrix is not diagonalisable. (ii) Choose two matrices (one diagonalisable and one non-diagonalisable) as inputs and show the output for above mentioned things.



Solutions:

Procedure:
•	Input the matrix A
•	Calculate the eigenvalues and eigenvectors
•	Using the matlab command eig(A) calculate the modal matrix P
•	If eigenvalues are all different then diagonalizable else if for same eigen-value we don’t get different eigen-vectors then not diagonalizable
•	Display the diagonal matrix D



Code in MATLAB:

clc
clear 
close all
 
% Taking the matrix to diagonalise from user
input_matrix = input("Enter the 3x3 matrix : "); 
% Calculate the eigen values of the matrix
eigen_values = eig(input_matrix); 
% Displaying the engen values of the matrix
disp("Eigenvalues of the given matrix are: ");
disp(eigen_values);
% Extracting indiviual eigenvalues into a, b, c 
a = eigen_values(1); b = eigen_values(2) ; c = eigen_values(3); 
% Finding the modal matrix and diagonal matrix
[modal_matrix D] = eig(input_matrix);
% Outputting the eigen vectors
disp("The eigen-vectors of the matrix are : ");
disp(modal_matrix);
% Check if matrix is diagonalisable or not
if(isequal(modal_matrix(:, 1), modal_matrix(:, 2)) && isequal(modal_matrix(:, 2), modal_matrix(:, 3)) && isequal(modal_matrix(:, 3), modal_matrix(:, 1))) % If diagonalisable case
    disp("The given matrix is not diagonalisable.");
else % If not diagonalisable case
    PI = inv(modal_matrix); % Calculating the inverse matrix of P
    disp("The diaognal matrix is : ");
    Da = PI * input_matrix * modal_matrix;
    disp(Da);
end



NON DIAGNOLISABLE:



Input in Command Window:

Enter the 3x3 matrix : [2 1 2;0 2 -1;0 0 2]



Output in Command Window:

Eigenvalues of the given matrix are: 
     2
     2
     2

The eigen-vectors of the matrix are : 
    1.0000   -1.0000   -1.0000
         0    0.0000    0.0000
         0         0    0.0000

The given matrix is not diagonalisable.



DIAGNOLISABLE:


Input in Command Window:

Enter the 3x3 matrix : [1 2 3;4 5 6;7 8 9]


Output in Command Window:

Eigenvalues of the given matrix are: 
   16.1168
   -1.1168
   -0.0000

The eigen-vectors of the matrix are : 
   -0.2320   -0.7858    0.4082
   -0.5253   -0.0868   -0.8165
   -0.8187    0.6123    0.4082

The diaognal matrix is : 
   16.1168    0.0000    0.0000
   -0.0000   -1.1168   -0.0000
    0.0000    0.0000    0.0000

