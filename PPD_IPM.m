function [x,p,s,k,beta] = PPD_IPM(A,b,c,x0,p0,s0,r,eps,alpha_kind)

%Initial
if isempty(find(x0<=0,1)) && isempty(find(s0<=0,1)) && 0 < r && r < 1 && eps > 0
    x = x0;
    p = p0;
    s = s0;
    k = 0;
    beta = [1,2];
    [~,n] = size(A);
    switch alpha_kind
        case 1
            alpha = 1 - 1/(10*sqrt(n));
        case 2
            alpha = 1/10;
    end
else
    ME = MException('Error! Wrong input.',str);
    throw(ME)
end

while true
    if max([norm(A*x-b),norm(A'*p+s-c),norm(s'*x)]) < eps
        break
    else
        %Shrinkage
        theta = alpha * (x'*s/n);
        
        %Solve the Newton system
        [dx,dp,ds] = Newton(A,b,c,x,p,s,theta);
        
        %Determine the Step-size
        alpha_P = 1;
        alpha_D = 1;
        for i = 1:n
            if dx(i)<0
                if -r*x(i)/dx(i) < alpha_P
                    alpha_P = -r*x(i)/dx(i);
                end
            end
            if ds(i)<0
                if -r*s(i)/ds(i) < alpha_D
                    alpha_D = -r*s(i)/ds(i);
                end
            end
        end
        
        %Update
        x = x + alpha_P*dx;
        p = p + alpha_D*dp;
        s = s + alpha_D*ds;
        k = k + 1;
        
        X = diag(x);
        S = diag(s);
        en = ones(n,1);
        beta(k) = norm(1/theta*X*S*en-en);
    end
end