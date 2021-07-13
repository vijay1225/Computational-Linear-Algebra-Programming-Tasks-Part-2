clear;
clc;
close all;

%% reading image
i = im2double(imread('watch.bmp'));
[l1,m1,n1] = size(i);
n = l1*m1/64;
r1 = i(:,:,1);
g1= i(:,:,2);
b1 = i(:,:,3);

%% coverting image with specified k value 

% pcadecomp_fun returns the whole decomposed image

k = 5;

i_new1 = zeros([l1,m1,n1]);
i_new1(:,:,1) = pcadecomp_fun(r1,k); % pcadecomp_fun returns the whole decomposed image
i_new1(:,:,2) = pcadecomp_fun(g1,k);
i_new1(:,:,3) = pcadecomp_fun(b1,k);

k = 10;

i_new2 = zeros([l1,m1,n1]);
i_new2(:,:,1) = pcadecomp_fun(r1,k);
i_new2(:,:,2) = pcadecomp_fun(g1,k);
i_new2(:,:,3) = pcadecomp_fun(b1,k);

k = 20;

i_new3 = zeros([l1,m1,n1]);
i_new3(:,:,1) = pcadecomp_fun(r1,k);
i_new3(:,:,2) = pcadecomp_fun(g1,k);
i_new3(:,:,3) = pcadecomp_fun(b1,k);

%% showing image
figure(1);
subplot(2,2,1);
imshow(i);
title(' Original image' );
subplot(2,2,2);
imshow(i_new1);
title(' Compressed image, K=5' );
subplot(2,2,3);
imshow(i_new2);
title(' Compressed image, K=10' );
subplot(2,2,4);
imshow(i_new3);
title(' Compressed image, K=20' );


% finding error list with all k = 1,2,3,4,.....64
% error3d function returns the error between two 3d images(matrices)
error_list = zeros(1,64);
for k=1:64
    i_new = zeros([l1,m1,n1]);
    i_new(:,:,1) = pcadecomp_fun(r1,k);
    i_new(:,:,2) = pcadecomp_fun(g1,k);
    i_new(:,:,3) = pcadecomp_fun(b1,k);
    error_list(k) = error3d(i, i_new);
end

figure;
plot(1:64,error_list);
xlabel('K');
ylabel('Error');
title('K vs Error');