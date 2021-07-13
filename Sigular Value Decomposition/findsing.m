clc;
clear;

% matrice size
n = 10;
% creating psd matrice
a1 = rand(n);
% given matrice A singular values = eigen values of (A^t * A)
% a1 = [1,2,3,4,7;4,5,6,2,3;7,18,9,8,9;8,2,5,2,5;7,2,4,8,2];	
a = a1*a1';
% hessen function is created to convert given matrice into hessenberg form
% go that function hessen for procedure of how it done
h = hessen(a);

% used qr alorightm to find eigen values 
iter = 100;
for i=1:iter
    [q,r] = prop(h); % prop function returns the modified Givens QR decompostion for the hessenberg
    h = r * q;
end
disp('singular values of given matrice');
disp(diag(h));