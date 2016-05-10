##' dailyOMP generates an OMP object giving the daily outcrossed mating potential of individuals based on k nearest neighbors
##'
##' @title Calculate daily outcrossed mating potential
##' @param scene a matingScene object
##' @param k integer, number of nearest neighbors to use in calculating OMP
##' @param days the day or range of days to calculate OMP for, default is all days in a scene (see Details)
##' @param alpha parameter of exponential decay to be used in calculating OMP (defaults to 1/13)
##' @param nn.constant logical; indicates whether the nearest neighbors used in calculations should be the nearest on a given day (\code{nn.constant = FALSE}) or the nearest neighbors over an entire season (\code{nn.constant = TRUE})
##' @return a named matrix with a row for each id and a column for each day, and entries corresponding to ids' OMP each day
##' @details The days to calculate OMP for should be input as integers as they are in the start and end columns of a matingScene object. If the number of ids receptive on a day is less than k, OMP will be calculated for the maximum number of neighbors.
##' @seealso \code{\link{makeScene}}
##' @author Stuart Wagenius
##' @examples
##' pop <- simulateScene()
##' omp <- dailyOMP(pop)
##' omp.1 <- dailyOMP(pop, nn.constant = T) # calculates OMP for individuals based on the same nearest neighbors throughout the season



dailyOMP <- function(scene, k = 4, days = min(scene$start):max(scene$end), alpha = 1/13, nn.constant = FALSE){
  out <- matrix(nrow  = nrow(scene), ncol = length(days), dimnames = list(scene$id, as.character(days + attr(scene, 'origin'))))
  rbd <- receptivityByDay(scene)
  if(!nn.constant){
    for (i in 1:length(days)){
      day <- days[i]
      idsDi <- which(rbd[,day])
      nbrs <- k
      if(length(idsDi) <= k) nbrs <- length(idsDi)-1
      if(nbrs > 1){
        knn <- unlist(get.knn(scene[idsDi,c('x','y')], k = nbrs))
        dim(knn) <- c(length(idsDi), nbrs, 2)
        out[idsDi,i] <- rowSums(exp(knn[,,2, drop = FALSE]*-1*alpha))
      }
    }
    out[is.na(out)]<- 0
  } else {
    knn <- unlist(get.knn(scene[,c('x','y')], k = k))
    dim(knn) <- c(nrow(scene), k, 2)
    mat <- matrix(nrow = nrow(scene),ncol = nrow(scene))
    for (y in 1:nrow(scene)){
      mat[y,knn[y,,1]]<-exp(knn[y,,2, drop = FALSE]*-1*alpha)
    }
    mat[is.na(mat)]<- 0
    out <- (mat %*% rbd)*rbd
  }
  out
}