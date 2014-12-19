# This function creates a "matrix" and a list containing functions to set the value of the inverse of the matrix and get the value of the inverse matrix 


 makeCacheMatrix <- function(x = matrix()) {    # creates a matrix function

        m <- NULL                               # creates a NULL object in the parent environment

            set <- function(y) {                # function to setup the value of the matrix

                x <<- y                         # Assigns NULLed empty objects in the get function environment
                m <<- NULL
        }

      get <- function() x			      # sets the value of the matrix	

            setmatrix <- function(solve) m <<- solve   # function to set the inverse matrix using the solve()

               getmatrix <- function() m               # function to retrieve the inverse matrix

        list(set = set, get = get,                     # List of functions

             setmatrix = setmatrix,

                getmatrix = getmatrix)
}


	cacheSolve <- function(x = matrix(), ...) {    #Function to check if the matrix is in the cache and set it if not present

                m <- x$getmatrix()

        if(!is.null(m)) {                           # check if matrix is present in cache and retrieve

                  message("getting cached data")
                return(m)
        }
             cachedata <- x$get()                       # retrieves the cache data

                 m <- solve(cachedata, ...)             

        x$setmatrix(m)						# Writes the inverse matrix into cache

        m

}