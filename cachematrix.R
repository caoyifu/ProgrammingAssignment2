## The two fucntios below are created to calculate the inverse of the matrix or retrieve the inverse cached 

## This funciton, makeCacheMatrix creates a special "vector", which is really a list containing four functions.

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y){
    x<<-y
    s<--NULL
  }
  get<-function() x
  setsolve<-function(solve) s<<-solve
  getsolve<-function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## The follwing function calculates the inverse of the special "vector" created with the above function.
##However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cached and skips the computation.
##Otherwise, it calculates the inverse of the matrix and sets the value of inverse in the cache via the setsolve funciton.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s<-x$getsolve()
  if(!is.null(s)){
    message ("getting cached data")
    return(s)
  }
  data<-x$get()
  s<-solve(data, ...)
  x$setsolve(s)
  s
}
