##A function that takes a matrix as an input 
##  uses internal variables to set and return inverted matrix


makeCacheMatrix<- function(x = matrix()) {
  inv <- NULL ## stores the inverted matrix result 
  set <- function(y) {
    x <<- y
    inv <<- NULL ## sets inv to null
  }
  get <- function() x  #returns input 
  setInverse <- function(inverse) inv <<- inverse ## sets inverted matrix
  getInverse <- function() inv                    ## returns inverted matrix
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


##  computes inverse of the  matrix created by 
## makeCacheMatrix or if the  inverse exists 
##  retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached matrix")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
