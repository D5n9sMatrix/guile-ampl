#!/usr/bin/r

# List Objects
# Description
# ls and objects return a vector of character strings giving the names of the objects in the specified environment. When invoked with no argument at the top level prompt, ls shows what data sets and functions a user has defined. When invoked with no argument inside a function, ls returns the names of the function's local variables: this is useful in conjunction with browser.

# Usage
# ls(name, pos = -1L, envir = as.environment(pos),
#    all.names = FALSE, pattern, sorted = TRUE)
# objects(name, pos= -1L, envir = as.environment(pos),
#         all.names = FALSE, pattern, sorted = TRUE)
# Arguments
# name	
# which environment to use in listing the available objects. Defaults to the current environment. Although called name for back compatibility, in fact this argument can specify the environment in any form; see the ‘Details’ section.

# pos	
# an alternative argument to name for specifying the environment as a position in the search list. Mostly there for back compatibility.

# envir	
# an alternative argument to name for specifying the environment. Mostly there for back compatibility.

# all.names	
# a logical value. If TRUE, all object names are returned. If FALSE, names which begin with a . are omitted.

# pattern	
# an optional regular expression. Only names matching pattern are returned. glob2rx can be used to convert wildcard patterns to regular expressions.

# sorted	
# logical indicating if the resulting character should be sorted alphabetically. Note that this is part of ls() may take most of the time.

# Details
# The name argument can specify the environment from which object names are taken in one of several forms: as an integer (the position in the search list); as the character string name of an element in the search list; or as an explicit environment (including using sys.frame to access the currently active function calls). By default, the environment of the call to ls or objects is used. The pos and envir arguments are an alternative way to specify an environment, but are primarily there for back compatibility.

# Note that the order of strings for sorted = TRUE is locale dependent, see Sys.getlocale. If sorted = FALSE the order is arbitrary, depending if the environment is hashed, the order of insertion of objects, ....

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

# See Also
# glob2rx for converting wildcard patterns to regular expressions.

# ls.str for a long listing based on str. apropos (or find) for finding objects in the whole search path; grep for more details on ‘regular expressions’; class, methods, etc., for object-oriented programming.

# Examples

.Ob <- 2
ls(pattern = "O")
ls(pattern= "O", all.names = TRUE)    # also shows ".[foo]"

# shows an empty list because inside myfunc no variables are defined
myfunc <- function() {ls()}
myfunc()

# define a local variable inside myfunc
myfunc <- function() {y <- 1; ls()}
myfunc()                # shows "y"