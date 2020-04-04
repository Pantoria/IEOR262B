function [dx,dp,ds] = Newton(A,b,c,x,p,s,theta)
    [m,n] = size(A);
    X = diag(x);
    S = diag(s);
    en = ones(n,1);
    zeron = zeros(n);
    zerom = zeros(m);
    zeromn = zeros(m,n);
    I = eye(n);
    coeff = [A,zerom,zeromn;zeron,A',I;S,zeromn',X];
    r1 = b - A*x;
    r2 = c - A'*p - s;
    r3 = theta*en - X*S*en;
    result = coeff\[r1;r2;r3];
    dx = result(1:n);
    dp = result(n+1:n+m);
    ds = result(n+m+1:2*n+m);
end