#' Archivage de l'appli en prod
#'
#' @param nom nom de l'appli
#' @param version version de l'appli
#'
#' @return NA
#' @export
#' @examples
to_prod <- function(nom, version){
  nom_dossier <- paste0("./prod/", version)
  if (dir.exists(nom_dossier)){
    stop("Nom de version deja existant")
  } else {
    dir.create(nom_dossier)

    nom_package <- paste0(nom, "_package.R")
    nom_fonction <- paste0(nom, "_fonctions.R")
    nom_ui <- paste0(nom, "_ui.R")
    nom_server <- paste0(nom, "_server.R")
    nom_trad <- paste0(nom, "_trad.json")

    nom_package_bis <- paste0(nom_dossier, "/", nom_package)
    nom_fonction_bis <- paste0(nom_dossier, "/", nom_fonction)
    nom_ui_bis <- paste0(nom_dossier, "/", nom_ui)
    nom_server_bis <- paste0(nom_dossier, "/", nom_server)
    nom_trad_bis <- paste0(nom_dossier, "/", nom_trad)
    nom_app_bis <- paste0(nom_dossier, "/app.R")
    s_app <- paste0("# Script pour lancer l'application
  source(\"",nom_package_bis,"\", encoding = \"UTF-8\")
  source(\"",nom_fonction_bis,"\", encoding = \"UTF-8\")
  source(\"",nom_ui_bis,"\", encoding = \"UTF-8\")
  source(\"",nom_server_bis,"\", encoding = \"UTF-8\")
  shinyApp(ui, server)")
    rty <- file(nom_app_bis,encoding="UTF-8")
    write(s_app, file=rty)
    close(rty)

    file.copy(nom_package, nom_package_bis)
    file.copy(nom_fonction, nom_fonction_bis)
    file.copy(nom_ui, nom_ui_bis)
    file.copy(nom_server, nom_server_bis)
    file.copy(nom_trad, nom_trad_bis)
  }

}
