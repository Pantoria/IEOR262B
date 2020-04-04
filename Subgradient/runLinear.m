A = [1,1,1,0;1,-1,0,1];
b = [100;50];
c = [-9;-10;0;0];
kmax = 10000;
slater = [2,2,96,50];
x0 = [48,50,2,52]';
z = -932;

%this is the parameter for different kinds of step size
T = 1;

x = linear(A,b,c,T,slater,x0,z,kmax);

disp("The optimal solution x is ")
disp(x)
%test for feasibility
disp("Test for feasibility")
disp("norm(A*x-b)=")
disp(norm(A*x-b))