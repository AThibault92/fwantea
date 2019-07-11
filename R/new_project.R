#' Nouveau projet R
#' Création d'une arborescence pour structure les projets
#'
#' @return NA
#' @export
#'
#' @examples
new_project <- function(){
  dir.create("data")
  dir.create("./data/raw")
  dir.create("./data/processed")
  dir.create("output")
  dir.create("./output/tables")
  dir.create("./output/figures")
  dir.create("rapport")
  dir.create("R")
  dir.create("./R/fct")
  dir.create("package")

  script_main <- "# Liste des fonctionnalité du package fwantea
  library(fwantea)

  # Création d'une fonction
  new_fct(\"nom de la fonction\")
  "
}
