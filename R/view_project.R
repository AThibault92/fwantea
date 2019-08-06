#' Ouvre les scripts d'un sous projet
#'
#' @param nom nom du sous projet
#'
#' @return NA
#' @export
#'
#' @examples
view_project <- function(nom){
  rm(list = ls())
  file <- paste0("./",nom,"/env.R")
  source(file)
}
