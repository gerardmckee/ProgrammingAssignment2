# Copyright 2014 Gerard Mckee. All rights reserved.
# Author; Gerard McKee
# Description: Test cachematrix.R
# https://class.coursera.org/rprog-007/human_grading/view/courses/972580/assessments/3/submissions
# Date: 9/17/2014

## Start of Code
getwd()
setwd("~/Documents/AAASchool/Coursera/2014/R-Programming/Week3")
getwd()
set.seed(1000)  # to make tests repeatable
dp <- 6  # decimal places to round result

# Inverse of matirx
#A.m <- matrix(rnorm(9), nrow=3, ncol=3)
#A.m
#A.m.inv <- solve(A.m)
#round(A.m %*% A.m.inv, 3)

## Test: Cashing the inverse of a matrix
source("cachematrix.R")
debug <- FALSE

# test 2x2 matrix
A <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2), verbose=debug)
# matrix multiple should return identity matrix I=diag()
if (!identical(A$get() %*% cacheSolve(A, verbose=debug), diag(2))) print("FAIL")
if (!identical(A$get() %*% A$getinv(), diag(2))) print("FAIL")
if (!identical(A$get() %*% cacheSolve(A, verbose=debug), diag(2))) print("FAIL")
# new value for A
A$set(matrix(c(2, 4, 6, 8), nrow=2, ncol=2))
if (!identical(A$get() %*% cacheSolve(A, verbose=debug), diag(2))) print("FAIL")
if (!identical(A$get() %*% A$getinv(), diag(2))) print("FAIL")
if (!identical(A$get() %*% cacheSolve(A, verbose=debug), diag(2))) print("FAIL")

# test 3x3 matrix
A <- makeCacheMatrix(matrix(rnorm(9), nrow=3, ncol=3))
#A$get()
#cacheSolve(A)
#round(A$get() %*% cacheSolve(A), 3)
#A$getinv()
# matrix multiple should return identity matrix I=diag()
res <- round(A$get() %*% cacheSolve(A, verbose=debug), dp)
if ( !identical(res, diag(3)) ) print("FAIL")
res <- round(A$get() %*% A$getinv(), dp)    
if ( !identical(res, diag(3)) ) print("FAIL")
res <- round(A$get() %*% cacheSolve(A, verbose=debug), dp)
if ( !identical(res, diag(3)) ) print("FAIL")

# test 10x10 matrix
A <- makeCacheMatrix(matrix(rnorm(100), nrow=10, ncol=10), verbose=debug)
# matrix multiple should return identity matrix I=diag()
res <- round(A$get() %*% cacheSolve(A, verbose=debug), dp)
if ( !identical(res, diag(10)) ) print("FAIL")
res <- round(A$get() %*% A$getinv(), dp)    
if ( !identical(res, diag(10)) ) print("FAIL")
res <- round(A$get() %*% cacheSolve(A, verbose=debug), dp)
if ( !identical(res, diag(10)) ) print("FAIL")

# look at environment of A
#env.A <- environment(A$get)
#class(env.A)
#ls(envir = env.A)
    
 


