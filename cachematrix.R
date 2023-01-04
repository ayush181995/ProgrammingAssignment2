makeCacheMatrix <- function(x = matrix()) 
{
  m <- NULL
  set <- function(y) 
  {
    x <<- y                #lexican scooping 
    m <<- NULL
  }
  get <- function() 
  {
    x
  }
  
  setinverse <- function(inversm)
  { 
    m <<- inversm
  }
  getinverse <- function()
  {
    m
  } 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function(x, ...) 
{
  m <- x$getinverse() # Get the value from cached data. 
  
  if(!is.null(m)) 
  {
    message("getting cached data")
    return(m) # return cached inverse if already solved 
  }
  else
  {
  m <- solve(data, ...)
  x$setinverse(m) # if the inverse is not found in the cached data then it will solve the for the matrix 
  m 
  }
}

