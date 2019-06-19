#' Nouveau script R
#'
#' @param nom nom du script
#'
#' @return NA
#' @export
#'
#' @examples
new_script <- function(nom){
  rty <- file(paste0("./R/",nom,".R") ,encoding="UTF-8")
  write("", file=rty)
  close(rty)
  file.edit(paste0("./R/",nom,".R"))
}
