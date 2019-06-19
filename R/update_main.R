#' Mise à jour du fichier main
#'
#' @param nom nom de l'appli
#'
#' @return NA
#' @export
#'
#' @examples
update_main <- function(nom){
  nom_main <- paste0("0_", nom, "_main.R")
  s_main <- paste0("library(aideshiny)
# Ouvrir les scripts de l'appli dev
open_script(\"",nom,"\")

# Ouvrir les scripts de l'appli en prod
open_prod(\"",nom,"\",\"version\")

# Lancement de l'appli en dev
launch_dev()

# Lancement de l'appli en prod
launch_prod(\"version\")

# Récupérer les textOutput pour la traduction
shiny_trad_txt_output(\"",nom,"\", extract = \"all\", type_sortie = \"script\")

# Passer l'appli en prod
to_prod(\"",nom,"\",\"version\")

# Ajout de packages
ajout_package(\"",nom,"\",\"package\")

# Création d'une nouvelle fonction
new_fct(\"",nom,"\",\"nom fonction\")
")
  write(s_main, file=nom_main, append = FALSE)
  file.edit(nom_main, fileEncoding = "UTF-8")
}
