clc;
clear;

% no of samples
n = 1000;
% mean of random samples 
mu1 = [0,0];
mu2 = [0,0,0];
% sigma values of random samples that we need to create
sigma1 = [0.025,0.0075;0.0075,0.007];
sigma2 = [0.025,0.0075,0.00175;0.0075,0.007,0.00135;0.00175,0.00135,0.00043];

%applying cloleksy decomportion to sigma matrice inorder use them in
%process of converting ramdom smaples to correlated samples of covariance
%given with sigma

%clokesky matrice obtained from covariance matrice
l1 = chol_fun(sigma1);
l2 = chol_fun(sigma2);

temp = ones(n,1);

%uncorrelated random samples genaration
x1 = randn(n,2);
x2 = randn(n,3);

% converting that uncorrelated samples into coreelationof sigma given
y1 = temp * mu1 + x1 * l1;
y2 = temp * mu2 + x2 * l2;

%plotting results
figure(1)
subplot(1,2,1);
scatter(x1(:,1),x1(:,2));
title('2d Uncorrelated samples')
subplot(1,2,2);
scatter(y1(:,1),y1(:,2));
title('2d Correlated samples');

figure(2)
subplot(1,2,1);
scatter3(x2(:,1),x2(:,2),x2(:,3));
title('3d Uncorrelated samples')
subplot(1,2,2);
scatter3(y2(:,1),y2(:,2),y2(:,3));
title('3d Correlated samples');