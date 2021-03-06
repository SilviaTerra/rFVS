#' @title Get Stand IDs
#'
#' @return A named vector of three strings with names `standid`, `standcn`, and 
#'   `mgmtid.`
#' @export

fvsGetStandIDs <- function() {
  ids <- .Fortran(
    "fvsStandID", strrep(" ", 50), strrep(" ", 50), strrep(" ", 50),
    as.integer(0), as.integer(0), as.integer(0)
  )
  stdid <- if (ids[[4]] == 0) {
    " "
  } else {
    substr(ids[[1]], 1, ids[[4]])
  }
  stdcn <- if (ids[[5]] == 0) {
    " "
  } else {
    substr(ids[[2]], 1, ids[[5]])
  }
  mgmid <- if (ids[[6]] == 0) {
    " "
  } else {
    substr(ids[[3]], 1, ids[[6]])
  }
  c(standid = stdid, standcn = stdcn, mgmtid = mgmid)
}
