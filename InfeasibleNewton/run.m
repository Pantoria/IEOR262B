A = [1,1,1,0;1,-1,0,1];
b = [100,50]';
c = [-9,-10,0,0]';

x0 = [1,1,1,1]';
p0 = [0,0]';
s0 = [1,1,1,1]';


x0 = x0 *100;
s0 = s0*100;

alpha_kind = 2;
eps = 1e-8;
r = 0.99;

[x,p,s,k,beta] = PPD_IPM(A,b,c,x0,p0,s0,r,eps,alpha_kind);