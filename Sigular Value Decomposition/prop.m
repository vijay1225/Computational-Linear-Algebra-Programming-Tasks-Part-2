function [q,r] = prop(input_mat)

    % In this fuction a am returning QR decomposition obtained by GIVENS
    % ROTATION concept that process incluedes we create a mattice that
    % only do the element elimimation to first column 
    
    % only usefull this modified code to hessenberg form of matrice only
    % for the eigen values finding

    mat_dim = size(input_mat);
    n = mat_dim(2);
    r = input_mat;
    q = eye(mat_dim);
    for i=1:n-1
        theta = atan(r(i+1,i)/r(i,i));
        g = eye(mat_dim);
        g(i,i) = cos(theta);
        g(i,i+1) = sin(theta);
        g(i+1,i) = -sin(theta);
        g(i+1,i+1) = cos(theta);
        q = q * g';
        r = g * r;
    end
end