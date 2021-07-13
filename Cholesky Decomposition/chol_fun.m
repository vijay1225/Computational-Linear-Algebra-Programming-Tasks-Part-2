function [l] = chol_fun(a)

    % this function is main code which do the cholesky decomposion to given
    % symmetric matrice.
    dim = size(a); 
    l = eye(dim);
    a1 = a;
    m = dim(1);
    for i=1:m-1
        li = eye(dim);
        li(i,i) = sqrt(a1(i,i));
        li(i+1:m,i) = a1(i+1:m,i)/sqrt(a1(i,i));
        l = l * li;
        b = a1(i+1:m,i+1:m) - li(i+1:m,i)*li(i+1:m,i)';
        a1 = eye(dim);
        a1(i+1:m,i+1:m) =  b;
    end
    l(m,m) = sqrt(a1(m,m));


end

