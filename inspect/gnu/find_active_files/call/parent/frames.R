#!/usr/bin/r

# Set up World Coordinates for Graphics Window
# Description
# This function sets up the world coordinate system for a graphics window. It is called by higher level functions such as plot.default (after plot.new).

# Usage
# plot.window(xlim, ylim, log = "", asp = NA, ...)
# Arguments
# xlim, ylim	
# numeric vectors of length 2, giving the x and y coordinates ranges.

# log	
# character; indicating which axes should be in log scale.

# asp	
# numeric, giving the aspect ratio y/x, see ‘Details’.

# ...	
# further graphical parameters as in par. The relevant ones are xaxs, yaxs and lab.

# Details
# asp:
# If asp is a finite positive value then the window is set up so that one data unit in the y direction is equal in length to asp * one data unit in the x direction.

# Note that in this case, par("usr") is no longer determined by, e.g., par("xaxs"), but rather by asp and the device's aspect ratio. (See what happens if you interactively resize the plot device after running the example below!)

# The special case asp == 1 produces plots where distances between points are represented accurately on screen. Values with asp > 1 can be used to produce more accurate maps when using latitude and longitude.

# Note that the coordinate ranges will be extended by 4% if the appropriate graphical parameter xaxs or yaxs has value "r" (which is the default).

# To reverse an axis, use xlim or ylim of the form c(hi, lo).

# The function attempts to produce a plausible set of scales if one or both of xlim and ylim is of length one or the two values given are identical, but it is better to avoid that case.

# Usually, one should rather use the higher-level functions such as plot, hist, image, ..., instead and refer to their help pages for explanation of the arguments.

# A side-effect of the call is to set up the usr, xaxp and yaxp graphical parameters. (It is for the latter two that lab is used.)

# See Also
# xy.coords, plot.xy, plot.default.

# par for the graphical parameters mentioned.

# Examples

##--- An example for the use of 'asp' :
require(stats)  # normally loaded
loc <- cmdscale(eurodist)
rx <- range(x <- loc[,1])
ry <- range(y <- -loc[,2])
plot(x, y, type = "n", asp = 1, xlab = "", ylab = "")
abline(h = pretty(rx, 10), v = pretty(ry, 10), col = "lightgray")
text(x, y, labels(eurodist), cex = 0.8)