clc;
clear;

% this is main script to test the cholesky decompostion
% i have created separate function(chol_fun) file which do cholesky decomposition.

%creating input matric to test
a1 = [1,2,3,4,7;4,5,6,2,3;7,18,9,8,9;8,2,5,2,5;7,2,4,8,2];	
a = a1*a1';
disp('created matrice');
disp(a);

%calling cholesky function (chol_fun)
l = chol_fun(a);
disp('lower triangular matrice is');
disp(l);

% testing original and decomposion matrices are same or not
error = error2d(a, l*l');
disp('error is');
disp(error);