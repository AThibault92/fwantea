#' Ouvre les scripts de l'appli en prod
#'
#' @param nom nom de l'appli
#' @param version nom de la version
#'
#' @return
#' @export
#'
#' @examples
open_prod <- function(nom, version){
  nom_dossier <- paste0("./prod/", version)
  nom_package <- paste0(nom, "_package.R")
  nom_fonction <- paste0(nom, "_fonctions.R")
  nom_ui <- paste0(nom, "_ui.R")
  nom_server <- paste0(nom, "_server.R")
  nom_trad <- paste0(nom, "_trad.json")
  nom_main <- paste0("0_", nom, "main.R")

  nom_package_bis <- paste0(nom_dossier, "/", nom_package)
  nom_fonction_bis <- paste0(nom_dossier, "/", nom_fonction)
  nom_ui_bis <- paste0(nom_dossier, "/", nom_ui)
  nom_server_bis <- paste0(nom_dossier, "/", nom_server)
  nom_trad_bis <- paste0(nom_dossier, "/", nom_trad)

  file.edit(nom_package_bis, fileEncoding = "UTF-8")
  file.edit(nom_ui_bis, fileEncoding = "UTF-8")
  file.edit(nom_server_bis, fileEncoding = "UTF-8")
  file.edit(nom_fonction_bis, fileEncoding = "UTF-8")
  file.edit(nom_trad_bis, fileEncoding = "UTF-8")
}
