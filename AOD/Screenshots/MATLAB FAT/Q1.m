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