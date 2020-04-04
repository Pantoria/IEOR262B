function x = affineMap(x)
    n = length(x);
    e = ones(n,1);
    minx = min(x);
    x = e + 1/(1-minx)*(x-e);
end

