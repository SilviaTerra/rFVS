#' @title Get Summary
#'
#' @return A matrix of integer values with one row for each completed FVS cycle. 
#' The columns are named as documented in the FVS Summary Statistics.
#' @export

fvsGetSummary <- function() {
  nc <- fvsGetDims()["ncycles"]
  if (nc == 0) {
    return(NULL)
  }

  asum <- vector("list", nc + 1)
  summary <- vector("integer", 20)
  for (i in 1:(nc + 1)) {
    asum[[i]] <- .Fortran(
      "fvsSummary", as.integer(summary), as.integer(i), as.integer(0),
      as.integer(0), as.integer(0), as.integer(0)
    )[[1]]
  }
  ans <- NULL
  for (r in asum) {
    ans <- if (is.null(r)) {
      r
    } else {
        rbind(ans, r)
    }
  }
  rownames(ans) <- 1:nrow(ans)
  colnames(ans) <- c(
    "Year", "Age", "Tpa", "TCuFt", "MCuFt", "BdFt", "RTpa",
    "RTCuFt", "RMCuFt", "RBdFt", "ATBA", "ATCCF", "ATTopHt", "PrdLen", "Acc",
    "Mort", "SampWt", "ForTyp", "SizeCls", "StkCls"
  )
  ans
}
