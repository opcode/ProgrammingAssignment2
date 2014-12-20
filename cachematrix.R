##
## R Programming, Assignment 2
## Uses lexical scoping to create and cache the inverted matrix of a given matrix.
##

# these lines are just for testing...
#rm(list=ls())
#setwd("~/Personal/Coursera/RProgramming/Labs/ProgrammingAssignment2");
#getwd()


## makeCacheMatrix(x)
## x is a matrix
## returns a list of functions to manipulate x:
## set(), get(), setinverse(), and getinverse()
makeCacheMatrix <- function(x = matrix()) {
    invm <- NULL
    set <- function(y) {
        x <<- y
        invm <<- NULL
    }
    get <- function() x
    setinverse <- function(m) invm <<- m
    getinverse <- function() invm
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Return a matrix that is the inverse of 'x' (created by makeCacheMatrix)
## and caches it in the object x
cacheSolve <- function(x, ...) {
    invm <- x$getinverse()

    if(!is.null(invm)) {
        message("getting cached data")
        return(invm)
    }

    data <- x$get()
    invm <- solve(data, ...)
    x$setinverse(invm)
    invm
}

