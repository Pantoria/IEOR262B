kmax = 1000;
A = [1,1,10,0;1,-1,0,1];
b = [100,50]';
x = A\b;

% Projection matrix
P = projection(A);
%Container for all potential values
values = zeros(kmax,1);

for k = 1:kmax
    t = 2/(k+2);
    x = subgradient(A,x,t,P);
    values(k) = max(x(:));
end

%feasiblity test
disp("Test for feasiblity")
disp(A*x-b);

%result
disp("Min of lambda(x) is:")
disp(min(values(:)));