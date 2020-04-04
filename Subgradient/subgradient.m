function x = subgradient(A,x,t,P)
    [~,n] = size(A);
    e = zeros(n,1);
    ind = x==max(x(:));
    e(ind) = 1;
    x = x - t*P*e;
end