function P = projection(A)
    [~,n] = size(A);
    I = eye(n);
    P = I - A'*inv(A*A')*A;
end