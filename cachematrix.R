# Script to create a "matrix" object that can cache it inverse


 makeCacheMatrix <- function(x = matrix()) { # creates a matrix function

        m <- NULL                           # creates a NULL object 

            set <- function(y) {                # Set function to setup the

                x <<- y                     # Assigns 
                m <<- NULL
        }

      get <- function() x

            setmatrix <- function(solve) m <<- solve

               getmatrix <- function() m

        list(set = set, get = get,

             setmatrix = setmatrix,

                getmatrix = getmatrix)
}


	cacheSolve <- function(x = matrix(), ...) {

                m <- x$getmatrix()

        if(!is.null(m)) {

                  message("getting cached data")
                return(m)
        }
             data <- x$get()

                 m <- solve(data, ...)

        x$setmatrix(m)

        m

}