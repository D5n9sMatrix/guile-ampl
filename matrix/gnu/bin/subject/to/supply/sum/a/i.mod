#!/usr/bin/ampl

set R; # a set of raw materials
set P; # a set of products

param a {R, P} >= 0; # input-output coefficients
param b {R} > 0; # units available
param c {P} > 0; # profit per unit
param u {P} > 0; # production limit

var x {j in P} >= 0, <= u[j]; # units of j produced

maximize total_profit:
    sum {j in P} c[j] * x[j]; # total profit
subject to supply {i in R}:
    sum {j in P} a[i,j] * x[j] <= b[i]; # limited availability of material
    
