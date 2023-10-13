#!/usr/bin/r

# Compute Orthogonal Polynomials
# Description
# Returns or evaluates orthogonal polynomials of degree 1 to degree over the specified set of points x: these are all orthogonal to the constant polynomial of degree 0. Alternatively, evaluate raw polynomials.

# Usage
# poly(x, ..., degree = 1, coefs = NULL, raw = FALSE, simple = FALSE)
# polym  (..., degree = 1, coefs = NULL, raw = FALSE)

# ## S3 method for class 'poly'
# predict(object, newdata, ...)
# Arguments
# x, newdata	
# a numeric vector at which to evaluate the polynomial. x can also be a matrix. Missing values are not allowed in x.

# degree	
# the degree of the polynomial. Must be less than the number of unique points when raw is false, as by default.

# coefs	
# for prediction, coefficients from a previous fit.

# raw	
# if true, use raw and not orthogonal polynomials.

# simple	
# logical indicating if a simple matrix (with no further attributes but dimnames) should be returned. For speedup only.

# object	
# an object inheriting from class "poly", normally the result of a call to poly with a single vector argument.

# ...	
# poly, polym: further vectors.
# predict.poly: arguments to be passed to or from other methods.

# Details
# Although formally degree should be named (as it follows ...), an unnamed second argument of length 1 will be interpreted as the degree, such that poly(x, 3) can be used in formulas.

# The orthogonal polynomial is summarized by the coefficients, which can be used to evaluate it via the three-term recursion given in Kennedy & Gentle (1980, pp. 343–4), and used in the predict part of the code.

# poly using ... is just a convenience wrapper for polym: coef is ignored. Conversely, if polym is called with a single argument in ... it is a wrapper for poly.

# Value
# For poly and polym() (when simple=FALSE and coefs=NULL as per default):
# A matrix with rows corresponding to points in x and columns corresponding to the degree, with attributes "degree" specifying the degrees of the columns and (unless raw = TRUE) "coefs" which contains the centering and normalization constants used in constructing the orthogonal polynomials and class c("poly", "matrix").

# For poly(*, simple=TRUE), polym(*, coefs=<non-NULL>), and predict.poly(): a matrix.

# Note
# This routine is intended for statistical purposes such as contr.poly: it does not attempt to orthogonalize to machine accuracy.

# Author(s)
# R Core Team. Keith Jewell (Campden BRI Group, UK) contributed improvements for correct prediction on subsets.

# References
# Chambers, J. M. and Hastie, T. J. (1992) Statistical Models in S. Wadsworth & Brooks/Cole.

# Kennedy, W. J. Jr and Gentle, J. E. (1980) Statistical Computing Marcel Dekker.

# See Also
# contr.poly.

# cars for an example of polynomial regression.

# Examples

od <- options(digits = 3) # avoid too much visual clutter
(z <- poly(1:10, 3))
predict(z, seq(2, 4, 0.5))
zapsmall(poly(seq(4, 6, 0.5), 3, coefs = attr(z, "coefs")))

 zm <- zapsmall(polym (    1:4, c(1, 4:6),  degree = 3)) # or just poly():
(z1 <- zapsmall(poly(cbind(1:4, c(1, 4:6)), degree = 3)))
## they are the same :
stopifnot(all.equal(zm, z1, tolerance = 1e-15))

## poly(<matrix>, df) --- used to fail till July 14 (vive la France!), 2017:
m2 <- cbind(1:4, c(1, 4:6))
pm2 <- zapsmall(poly(m2, 3)) # "unnamed degree = 3"
stopifnot(all.equal(pm2, zm, tolerance = 1e-15))

options(od)