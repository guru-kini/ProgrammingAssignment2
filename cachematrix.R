## Put comments here that give an overall description of what your
## functions do

## This function creates an object that is a wrapper around the given Matrix. 
## It stores the matrix and the inverse of the matrix in a cache. 
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setInverse <- function(inverse) {
        inv <<- inverse
    }
    
    getInverse <- function() {
        inv
    }
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## This function takes in an object of the Matrix wrapper from makeCacheMatrix function
## and gets the Inverse of the Matrix. If there is nothing in the cache, then this 
## function will calculate the inverse, assign it to the Matrix wrapper object and 
## then try to get the inverse again from the cache. 
cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    if(!is.null(i)) {
        # We are getting the cached value
        print("Getting cached value of the Inverse")
        return (i)
    }

    i <- solve(x$get())
    x$setInverse(i)
    # Return the inverse from the cache
    x$getInverse()
}
