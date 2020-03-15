# Infeasible_IPM
A simple infeasible IPM solver

Before you start
---------------------------------------------------------------------------

This is a demo version of the implementation
of infeasible primal-dual path-following ipm for Linear Programming.
The main solver PPD_IPM.m only accepts LP problems 
in the standard form, namely

```
        min c'*x 
        s.t. Ax = b, 
             x>=0.        
```

How to use
---------------------------------------------------------------------------

If you just want to test whether it works, you just need run run.m in MATLab.

# Input format
A is a m-n matrix
x0 is x's initial value, a n vector 
p0 is p's initial vaule, a m verctor
s0 is s's initial vaule, a n vector
alpha_kind = 1 : choose alpha = 1 - 1/(10*n^0.5)
alpha_kind = 2 : choose alpha = 1/10
r shrinkage coefficient, default is 0.99
eps is the minimal acceptable accuracy

Reference
---------------------------------------------------------------------------
Fundamentals of Nonlinear Optimization: a Constructive Approach, Freund-Vera 
