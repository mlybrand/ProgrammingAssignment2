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

}


## cacheSolve takes a cached matrix object and any additional
## arguments that need to be passed to the inversion function
## it checks first to see if an inversion has already taken place
## and returns the cache. otherwise it calculates the inversion
## caches it and returns it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
