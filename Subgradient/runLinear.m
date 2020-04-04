A = [1,1,10,0;1,-1,0,1];
b = [100;50];
c = [-9;-10;0;0];
kmax = 1000;
slater = [0.5;0.5;99;50];
z = 10;

%this is the parameter for different kinds of step size
T = 1;

x = linear(A,b,c,T,slater,z,kmax);

disp("The optimal solution x is ")
disp(x)
%test for feasibility
disp("Test for feasibility")
disp("norm(A*x-b)=")
disp(norm(A*x-b))