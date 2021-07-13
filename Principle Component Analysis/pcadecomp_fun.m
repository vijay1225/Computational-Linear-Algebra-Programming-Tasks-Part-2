function [r1_new] = pcadecomp_fun(r1,k)

    % this fuction do the pca decompostion of given 2d matrice(image) and
    % return the image of reduced image wich specified k value.

    [l1,m1] = size(r1);
    n = l1*m1/64;
    
    % making block 8x8 into 61x1 vector adding into r,b,g channels

    r = zeros(64,n);
    count = 1;
    for l=1:8:l1
        for m=1:8:m1
            r(:,count) = reshape(r1(l:l+7,m:m+7), [64,1]);
            count = count + 1;
        end
    end
    
    % taking mean of those channel vectors
    dummy = ones([n,1])./n;
    ur = r*dummy;
    
    % taking mean vector and copying into 64x12288 matrice so that i can
    % subtract to get covariance
    ur1 = ur * ones([n,1])';
    % taking covariance matrix
    vr = ((r - ur1) * (r - ur1)')./n;
    % finding eigen values and eigen vectors to covarience matrix
    % making orthgonal eigenvector in decending order based on eigen values

    [vvr,lambda_r] = eig(vr);
    lambda_r = diag(lambda_r);
    [~,indices_r] = sort(lambda_r, 'descend' );
    vvr = vvr(:,indices_r);
    
    % making vectors by selecting first k principle components
    r_new = (vvr(:,1:k) * vvr(:,1:k)' * (r - ur1)) + ur1;
    % converting back to image with k = 5
    r1_new = zeros(l1,m1);
    count = 1;
    for l=1:8:l1
        for m=1:8:m1
            r1_new(l:l+7,m:m+7) = reshape(r_new(:,count),[8,8]);
            count = count + 1;
        end
    end
end