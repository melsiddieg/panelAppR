get_qparams <- function(params){
  params <- params %>% compact %>% keep(~nchar(.x)>1)
  paramsVec <- c()
  for(p in seq_along(params)){
    paramsVec <- append(paramsVec, paste0(names(params)[p], "=", params[p]))
  }
  paramsStr <- paste(paramsVec, collapse = "&")
  return(paramsStr)
}
