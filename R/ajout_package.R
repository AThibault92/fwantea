#' Ajout d'un package a la liste
#'
#' @param nom nom de l'appli
#' @param package nom du package
#'
#' @return
#' @export
#'
#' @examples
ajout_package <- function(nom, package){
  txt <- paste0("library(", package,")")
  nom_fichier <- paste0(nom, "_package.R")
  write(txt,file=nom_fichier,append=TRUE)
  print("Ajout de package terminé")
}
