#' Créer une nouvelle fonction dans l'appli
#'
#' @param nom_app nom de l'application shiny
#' @param nom_fct nom de la fonction
#'
#' @return NA
#' @export
#'
#' @examples
new_fct <- function(nom_app, nom_fct){
  if (!dir.exists("./fct")){
    dir.create("fct")
  }
  nom_file_fct <- paste0(nom_app, "_fonctions.R")
  nom_new_fct <- paste0("./fct/", nom_fct, ".R")
  fct_script_1 <- paste0(nom_fct, " <- function(){}")
  fct_script_2 <- paste0("source(\"", nom_new_fct, "\", encoding = \"UTF-8\")")
  rty <- file(nom_new_fct ,encoding="UTF-8")
  write(fct_script_1, file=rty)
  close(rty)
  write(fct_script_2,file=nom_file_fct,append=TRUE)
  file.edit(nom_new_fct)
}
