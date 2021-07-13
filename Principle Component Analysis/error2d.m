function [ e ] = error2d( a,b )
    c = a-b;
    d = c.^2;
    e = sqrt(sum(sum(d,2)));
end
