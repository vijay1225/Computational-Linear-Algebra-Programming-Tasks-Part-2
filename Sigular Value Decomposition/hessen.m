function h = hessen(a)

    % this function returns the hessenberg form of given matrice

    dim = size(a);
    m = dim(1);
    for k=1:m-2
        x = a(k+1:m,k);
        e = zeros(size(x));
        e(1,1) = 1;
        vk = sign(x(1,1))*norm(x)*e + x;
        vk = vk/norm(vk);
        a(k+1:m,k:m) = a(k+1:dim(1),k:m) - 2 * vk * ( vk' * a(k+1:dim(1),k:m));
        a(1:m,k+1:m) = a(1:m,k+1:m) - 2 *(a(1:m,k+1:m) * vk) * vk' ;
    end
    h = a;
end

