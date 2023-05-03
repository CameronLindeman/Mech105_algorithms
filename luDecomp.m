function [L, U, P] = luFactor(A)
% luDecomp is a function that takes the coeffiecents of a n x n matrix and
% gives the user a lower and upper triangular matrix along with the
% permutation matrix. This code is created by Cameron Lindeman for
% Mechanical engineering 105 with Dr. Bechara.
%  Inputs:
%   A- A is an n x n matrix that holds the coeffiecients of the systems of
%   equations
%  Outputs:
%   L-  is the lower triangular matrix
%   U-  is the upper triangular matrix
%   P-  is the permutation of the systems of equations done by the
%   code
U = (A);
n = size(A,1);
P = eye(n);
L = zeros(n);
% figure out the pivoting of the matrix and putting it into the permutation
% matrix
if size(A,1)~=size(A,2)
    error('matrix must be square with size(A) being equal')
end
for i = 1:n-1
[~, smallest_number] = max(abs(U(i:n,i)));
row_number = i+smallest_number-1;
if row_number ~=1
    U([i,row_number],:) = U([row_number,i],:);
    P([i,row_number],:) = P([row_number,i],:);
    L([i,row_number],:) = L([row_number,i],:);
     
end

for j = i+1:n
    L(j,i) = U(j,i)/U(i,i);
  
    U(j,i:n) = U(j,i:n) - L(j,i)*U(i,i:n);            
end

end
L = L+eye(n);
