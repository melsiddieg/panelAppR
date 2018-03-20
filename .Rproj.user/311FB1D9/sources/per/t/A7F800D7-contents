get_qparams <- function(params){
  paramsVec <- c()
  for(p in seq_along(params)){
    paramsVec <- append(paramsVec, paste0(names(params)[p], "=", params[p]))
  }
  paramsStr <- paste(paramsVec, collapse = "&")
  return(paramsStr)
}
