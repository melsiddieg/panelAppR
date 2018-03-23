get_qparams <- function(params){
  params <- params %>% compact %>% keep(~nchar(.x)>1)
  paramsVec <- c()
  for(p in seq_along(params)){
    paramsVec <- append(paramsVec, paste0(names(params)[p], "=", params[p]))
  }
  paramsStr <- paste(paramsVec, collapse = "&")
  return(paramsStr)
}
result_handler_gene <-function(furl){
  safecall <- safely(fromJSON)
  res <- safecall(furl)
  if(is.null(res$error)){
    if(!grepl("Error",res$result)){
      print("Query Successful")
      fres <- res$result$result$Genes
      fres
    }else{
      print("Query error: Please Check your query for mistakes")
    }

  }else{
        print(paste("query unsucessful",res$result$error$message))
  }

}

result_handler<-function(furl){
  safecall <- safely(fromJSON)
  res <- safecall(furl)
  if(is.null(res$result$error)){
    if(!grepl("Error",res$result$result$results)){
      print("Query Successful")
      fres <- res$result$result$result
      fres
    }else{
      print("Query error: Please Check your query for mistakes")
    }

  }else{
    print(paste("query unsucessful",res$result$error$message))
  }

}
