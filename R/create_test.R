#' Creer un script pour tester le code
#'
#' @param nom_script nom du scrip a creer
#'
#' @return NA
#' @export
#'
#' @examples
create_test <- function(nom_script){
  nom_file <- paste0("./scripts_test/", nom_script, ".R")
  rty <- file(nom_file ,encoding="UTF-8")
  write("", file=rty)
  close(rty)
  file.edit(nom_file, fileEncoding = "UTF-8")
}
