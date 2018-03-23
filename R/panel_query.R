#' @include helpers.R
#'
#' getPanelList
#' @title getPanelList
#' @description A function to list available gene panels
#' @examples
#' res <- getPanelList()
#' @export
getPanelList <- function(){
  url <- "https://panelapp.genomicsengland.co.uk/WebServices/list_panels/"
  res <- fromJSON(url)
  res$result
}
#' @title getPanel
#'
#' @description A function to query gene panels by name or id according to a
#' specified filter
#'
#' @param panel a character vector of panel names or panel ids
#' A function to get gene panels
#' @return A dataframe of gene panel/s and their genes
#' @examples
#' res <- getPanel(panel = '553f9595bb5a1616e5ed45a8')
#' res <- getPanel(panel = '553f9595bb5a1616e5ed45a8',
#' filter = list(ModeOfInheritance="monoallelic,biallelic"))
#' @export
getPanel <- function(panel,filter=NULL){
  url <- "https://panelapp.genomicsengland.co.uk/WebServices/get_panel/"
  panel <- paste(panel, sep = ",")
  if(!is.null(filter)){
    params <- get_qparams(filter)
    furl <- paste0(url,panel,"/?",params)
  }else{
    furl <- paste0(url,panel)
  }
  print(paste("The query url is:", furl))
  res <- result_handler_gene(furl)
  res

}
#'
#' @title getGene
#' @description A function to qurey gene panels by gene#'
#' @param gene a character vector of HGNC gene symbols
#' @return A dataframe of gene panels for the specified gene/s
#' @examples
#' res <- getGene("BRCA1")
#' res <- getGene("BRCA1", filter=list(ModeOfPathogenicity="loss_of_function"))
#'
#'@export
getGene <- function(gene,filter=NULL){
  url <- "https://panelapp.genomicsengland.co.uk/WebServices/search_genes/"
  gene <- paste(gene, sep = ",")
  if(!is.null(filter)){
    params <- get_qparams(filter)
    furl <- paste0(url,gene,"/?",params)
  }else{
    furl <- paste0(url,gene)
  }
  print(paste("The query url is:", furl))
  res <- result_handler(furl)
  res
}
