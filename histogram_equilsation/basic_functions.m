clc
clear all

%below command used to create a matrix with random 0s & 1s
A = round(rand(5));

%to find the sum of the matrix
A_1 = sum(sum(A));

%another variation of round and rand function
B = round(6*rand(1,5));

%cummulative sum of A
C = cumsum(A);

%sort the rows of C
D = sort(C,2);

%get the unique elements in C
E = unique(C);