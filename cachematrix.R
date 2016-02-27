## Caching the Inverse of a Matrix:
## Matrix inversion is a time-consuming computation and caching the inverse of a matrix is more benificial than computing
## it repeatedly. These two functions create an object to do the job of storing a matrix and caching its inverse.

## The function below creates object “matrix” that will cache its inverse.

makeCacheMatrix<-function(x = matrix()){
        inv<-NULL
        set<-function(y){
                x<<-y
                inv<<-NULL
        }
        get<-function()x
        setInverse<-function(inverse)inv <<-inverse
        getInverse<-function()inv
        list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}


## The function below will compute the inverse of "matrix" (created above). If we have already 
## calculated the inverse, then the function below will retrieve the inverse from the cache.

cacheSolve<-function(x,...){
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getInverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        mat<-x$get()
        inv<-solve(mat,...)
        x$setInverse(inv)
        inv
}
