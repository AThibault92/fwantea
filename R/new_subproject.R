#' Initialisation d'un sous projet
#'
#' @param nom nom du sous projet
#'
#' @return NA
#' @export
#'
#' @examples
new_subproject <- function(nom){
  dir.create(paste0("./",nom,"/data"))
  dir.create(paste0("./",nom,"/data/raw"))
  dir.create(paste0("./",nom,"/data/processed"))
  dir.create(paste0("./",nom,"/output"))
  dir.create(paste0("./",nom,"/output/tables"))
  dir.create(paste0("./",nom,"/output/figures"))
  dir.create(paste0("./",nom,"/R"))
  dir.create(paste0("./",nom,"/R/fct"))
  dir.create(paste0("./",nom,"/shiny"))

  script <-paste0("
  # Liste des scripts R a charger
  fichiers <- c(\"env.R\")
  file.edit(fichiers)
  ")

  rty <- file("env.R" ,encoding="UTF-8")
  write(script, file=rty)
  close(rty)
}
