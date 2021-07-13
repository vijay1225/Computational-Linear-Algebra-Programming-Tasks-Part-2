clc;
clear;

% iteration number
iter = 10;
% creating psd matrice
% a1 = [1,2,3,4,7;4,5,6,2,3;7,18,9,8,9;8,2,5,2,5;7,2,4,8,2];	
% a = a1*a1';
a = [3,3,4;3,7,6;4,6,10];
% hessen function is created to convert given matrice into hessenberg form
% go that function hessen for procedure of how it done
h = hessen(a);
error_list = zeros(1,iter);
m = max(eig(a));
for i=1:iter
    [q,r] = prop(h); % prop function returns the modified Givens QR decompostion for the hessenberg
    h = r * q;
    error_list(1,i) = norm(max(diag(h))-m);
end
plot(1:iter,error_list);
xlabel('iteration number');
ylabel('error');
title('iterative vs inbuilt function error');