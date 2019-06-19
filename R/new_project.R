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
  dir.create("package")
}
