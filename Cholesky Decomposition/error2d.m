function [ e ] = error2d( a,b )

    %this function finds the error between 2d matrices accroding to
    %definition.
    c = a-b;
    d = c.^2;
    e = sqrt(sum(sum(d,2)));
end
