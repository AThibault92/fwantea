#' Ouvre l'ensemble des scripts pour l'appli en cours (dev)
#'
#' @param nom nom de l'appli shiny
#'
#' @return NA
#' @export
#' @examples
open_script <- function(nom){
  nom_package <- paste0(nom, "_package.R")
  nom_fonction <- paste0(nom, "_fonctions.R")
  nom_ui <- paste0(nom, "_ui.R")
  nom_server <- paste0(nom, "_server.R")
  nom_trad <- paste0(nom, "_trad.json")
  nom_main <- paste0("0_", nom, "main.R")

  file.edit(nom_package, fileEncoding = "UTF-8")
  file.edit(nom_ui, fileEncoding = "UTF-8")
  file.edit(nom_server, fileEncoding = "UTF-8")
  file.edit(nom_fonction, fileEncoding = "UTF-8")
  file.edit(nom_trad, fileEncoding = "UTF-8")
}
