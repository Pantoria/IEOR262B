function x = linear(A,c,T,x,z,kmax)
    %Transform into model program
    %i.e., x->e=ones(n,1) transform the slater point into ones
    A = A*diag(x);
    c = diag(x)*c;
    
    %shape the objective function into max e_i^Tx
    A = [A;c'];
    
    %calculate the projection matrix
    P = projection(A);
    
    %Container for all potential values
    values = zeros(kmax,1);
    
    for k = 1:kmax
        switch T
            case 1
                t = 2/(k+2);
        end
        x = subgradient(A,x,t,P);
        values(k) = max(x(:));
    end
    
end

