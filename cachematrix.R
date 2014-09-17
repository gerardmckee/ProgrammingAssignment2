# Copyright 2014 Gerard Mckee. All rights reserved.
# Author; Gerard McKee
# Description: Programming Assignment 2
# https://class.coursera.org/rprog-007/human_grading/view/courses/972580/assessments/3/submissions
# Date: 9/17/2014

## Functions

## Assignment: Cashing the inverse of a matrix
# makeCacheMatrix and cacheSolve are used to find the invese of a
# matrix and to cache the result.

## makeCacheMatrix returns a list of four functions
makeCacheMatrix <- function(x = matrix()) {
    #print("makeCacheMatrix: ")
    x.inv <- NULL   
    set <- function(x.new) {
        #print("set: ")
        x <<- x.new
        x.inv <<- NULL
    }
    get <- function() {
        #print("get: ")
        x
    }
    setinv <- function(inv) {
        #print("setinv: ")
        x.inv <<- inv        
    }  
    getinv <- function() {
        #print("getinv: ")
        x.inv
    }
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)    
}

## cacheSolve returns the matrix inverse of x and caches the result
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    #print("cacheSolve: ")
    x.inv <- x$getinv()
    if (!is.null(x.inv)) {
        message("getting cached inverse")
        return(x.inv)
    }
    #message("calculating inverse")
    data <- x$get()
    x.inv <- solve(data, ...)
    x$setinv(x.inv)
    x.inv
}