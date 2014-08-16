## This pair of functions are used to create a special
## cached matrix that caches the inverse that was computed
## so that the calculation need to be conducted again on the 
## object unless there is significant change

## makeCacheMatrix takes a matrix as input and returns
## a list that is used as object that can set and get the
## matrix and can set and get the inversion of the matrix
## this object uses closure to provide a cached inversion
## so the computation need not be done again

makeCacheMatrix <- function(x = matrix()) {
    # private var to be maintained via closure
    inv <- NULL
    # setter assigns incoming matrix to enclosed
    # and sets inversion back to null
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    # returns enclosed matrix
    get <- function() x
    #assigns inversion to enclosed inversion
    setinversion <- function(inversion) inv <<- inversion
    #returns enclosed inversion
    getinversion <- function() inv
    # returns list to be used as cached matrix object
    list(set = set, get = get,
         setinversion = setinversion, getinversion = getinversion)
}


## cacheSolve takes a cached matrix object and any additional
## arguments that need to be passed to the inversion function
## it checks first to see if an inversion has already taken place
## and returns the cache. otherwise it calculates the inversion
## caches it and returns it.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    # get the current value of enclosed inversion
    inv <- x$getinversion()
    # if it is not null, 
    # then calc has been done previously
    # return cached inversion
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    # if inversion was null, then we make it to this
    # portion of code
    # and need to calculate and cache the inversion
    # get the matrix
    data <- x$get()
    # calculate the inversion
    inv <- solve(data, ...)
    # cache the inversion
    x$setinversion(inv)
    # return the inversion
    inv
}
