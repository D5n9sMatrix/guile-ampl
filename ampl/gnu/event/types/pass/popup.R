#!/usr/bin/r

# Plot Step Functions
# Description
# Method of the generic plot for stepfun objects and utility for plotting piecewise constant functions.

# Usage
# ## S3 method for class 'stepfun'
# plot(x, xval, xlim, ylim = range(c(y, Fn.kn)),
#      xlab = "x", ylab = "f(x)", main = NULL,
#      add = FALSE, verticals = TRUE, do.points = (n < 1000),
#      pch = par("pch"), col = par("col"),
#      col.points = col, cex.points = par("cex"),
#      col.hor = col, col.vert = col,
#      lty = par("lty"), lwd = par("lwd"), ...)

# ## S3 method for class 'stepfun'
# lines(x, ...)
# Arguments
# x	
# an R object inheriting from "stepfun".

# xval	
# numeric vector of abscissa values at which to evaluate x. Defaults to knots(x) restricted to xlim.

# xlim, ylim	
# limits for the plot region: see plot.window. Both have sensible defaults if omitted.

# xlab, ylab	
# labels for x and y axis.

# main	
# main title.

# add	
# logical; if TRUE only add to an existing plot.

# verticals	
# logical; if TRUE, draw vertical lines at steps.

# do.points	
# logical; if TRUE, also draw points at the (xlim restricted) knot locations. Default is true, for sample size < 1000.

# pch	
# character; point character if do.points.

# col	
# default color of all points and lines.

# col.points	
# character or integer code; color of points if do.points.

# cex.points	
# numeric; character expansion factor if do.points.

# col.hor	
# color of horizontal lines.

# col.vert	
# color of vertical lines.

# lty, lwd	
# line type and thickness for all lines.

# ...	
# further arguments of plot(.), or if(add) segments(.).

# Value
# A list with two components

# t	
# abscissa (x) values, including the two outermost ones.

# y	
# y values ‘in between’ the t[].

# Author(s)
# Martin Maechler maechler@stat.math.ethz.ch, 1990, 1993; ported to R, 1997.

# See Also
# ecdf for empirical distribution functions as special step functions, approxfun and splinefun.

# Examples

require(graphics)

y0 <- c(1,2,4,3)
sfun0  <- stepfun(1:3, y0, f = 0)
sfun.2 <- stepfun(1:3, y0, f = .2)
sfun1  <- stepfun(1:3, y0, right = TRUE)

tt <- seq(0, 3, by = 0.1)
op <- par(mfrow = c(2,2))
plot(sfun0); plot(sfun0, xval = tt, add = TRUE, col.hor = "bisque")
plot(sfun.2);plot(sfun.2, xval = tt, add = TRUE, col = "orange") # all colors
plot(sfun1);lines(sfun1, xval = tt, col.hor = "coral")
##-- This is  revealing :
plot(sfun0, verticals = FALSE,
     main = "stepfun(x, y0, f=f)  for f = 0, .2, 1")
for(i in 1:3)
  lines(list(sfun0, sfun.2, stepfun(1:3, y0, f = 1))[[i]], col = i)
legend(2.5, 1.9, paste("f =", c(0, 0.2, 1)), col = 1:3, lty = 1, y.intersp = 1)
par(op)

# Extend and/or restrict 'viewport':
plot(sfun0, xlim = c(0,5), ylim = c(0, 3.5),
     main = "plot(stepfun(*), xlim= . , ylim = .)")

##-- this works too (automatic call to  ecdf(.)):
plot.stepfun(rt(50, df = 3), col.vert = "gray20")