# Subgradient_LP

A simple infeasible LP solver with subgradient method

Before you start
---------------------------------------------------------------------------

This is a demo version of the implementation
of subgradient method for Linear Programming.
The main solver linear.m only accepts LP problems 
in the standard form, namely

```
        min c'*x 
        s.t. Ax = b, 
             x>=0.        
```

How to use
---------------------------------------------------------------------------

If you just want to test whether it works, you just need run run.m in MATLab.

#### Input format

A is a m-n matrix

T is the kind of step-size:

​	T = 1: step-size = $\frac{2}{k+2}$

​	T = 2: step-size = $\frac{2}{1+\sqrt{1+\frac{4}{t^2}}}$

​	T = 3: step-size = $\frac{1}{k+1}$

And if you want to add some other step-size, you could just turn in linear.m and look for the swith T line.

slater is the slater point input

z is the parameter of affine set

kmax is the maximum iteration number

Reference
---------------------------------------------------------------------------

Fundamentals of Nonlinear Optimization: a Constructive Approach, Freund-Vera 

J. Renegar. ”efficient” subgradient methods for general convex optimization. SIAM Journal on Optimization, 26(4):2649–2676, 2016.