function [ e ] = error3d( a,b )
    c = a-b;
    d = c.^2;
    e = sqrt(sum(sum(sum(d,3),2)));
end

