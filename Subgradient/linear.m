function x = linear(A,b,c,T,slater,z,kmax)
    [~,n] = size(A);
    %Transform into model program
    %i.e., x->e=ones(n,1) transform the slater point into ones
    A = A*diag(slater);
    c = diag(slater)*c;
    
    %shape the objective function into max e_i^Tx
    A = [A;c'];
    b = [b;z];
    
    x = A\b;
    %calculate the projection matrix
    P = projection(A);
    
    %Container for all potential values
    values = zeros(kmax,1);
    xs = zeros(kmax,n);
    
    for k = 1:kmax
        switch T
            case 1
                t = 2/(k+2);
            case 2
                if k == 1
                    t = 1;
                else
                    t = 2/(1+sqrt(1+4/t^2));
                end
            case 3
                t = 1/sqrt(k+1);
        end
        x = subgradient(A,x,t,P);
        values(k) = max(x(:));
        xs(k,:) = x;
        norm(A*x-b);
    end
    
    ind = values==max(values(:));
    x = xs(ind,:);
    x = diag(slater)*x';
end

