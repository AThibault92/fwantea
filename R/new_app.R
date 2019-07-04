#' Creation d'une appli shiny
#'
#' @param nom nom de l'application shiny
#' @param trad booleen, si TRUE permet la création d'un fichier trad
#'
#' @return creer l'ensemble des fichiers et dossiers necessaires aux appli shiny
#' @export
#'
#' @examples
new_app <- function(nom, trad = TRUE){
  # nom des fichiers
  nom_package <- paste0(nom, "_package.R")
  nom_fonction <- paste0(nom, "_fonctions.R")
  nom_ui <- paste0(nom, "_ui.R")
  nom_server <- paste0(nom, "_server.R")
  nom_trad <- paste0(nom, "_trad.json")
  nom_main <- paste0("0_", nom, "_main.R")
  # script du fichier app
  s_app <- paste0("# Script pour lancer l'application
  source(\"",nom_package,"\", encoding = \"UTF-8\")
  source(\"",nom_fonction,"\", encoding = \"UTF-8\")
  source(\"",nom_ui,"\", encoding = \"UTF-8\")
  source(\"",nom_server,"\", encoding = \"UTF-8\")
  shinyApp(ui, server)")
  rty <- file("app.R",encoding="UTF-8")
  write(s_app, file=rty)
  close(rty)
  # script du fichier ui
  s_ui <- paste0("# Script pour la création de l'ui -- décommenter la ligne 4 pour activer le changement de langue
ui <- dashboardPage(
  dashboardHeader(title = \"",nom,"\",
                  # tags$li(class = \"dropdown\", radioButtons(\"lang\", NULL, choices = c(\"fr\", \"en\"), inline = TRUE)),
                  tags$li(a(href = 'https://www.anteagroup.fr/fr',
                            img(src = \"logo.jpg\",
                                title = \"Company Home\", height = \"30px\"),
                            style = \"padding-top:10px; padding-bottom:10px;\"),
                          class = \"dropdown\")
  ),
  dashboardSidebar(
    sidebarMenu(
      useShinyalert()
    )
  ),
  dashboardBody(

  )
)")
  rty <- file(nom_ui ,encoding="UTF-8")
  write(s_ui, file=rty)
  close(rty)
  # Script du fichier server
  s_server <- paste0("# Script pour la création du server
server <- function(input, output, session){
  # Décommenter les lignes suivantes pour activer la traduction
  # i18n <- Translator$new(translation_json_path = \"",nom_trad,"\")
  # observeEvent(input$lang,{
    # i18n$set_translation_language(input$lang)
    # output$info_calc1 <- renderText(i18n$t(\"Calcul du débit pompé provenant effectivement de la rivière en régime permanent (temps de pompage long)\"))
  # })
}")
  rty <- file(nom_server ,encoding="UTF-8")
  write(s_server, file=rty)
  close(rty)

  #  Script du fichier fonctions
  s_fonctions <- "# Script pour la création des fonctions à appeller dans server"
  rty <- file(nom_fonction ,encoding="UTF-8")
  write(s_fonctions, file=rty)
  close(rty)

  # Json traduction
  s_trad <- "{
\"languages\": [\"fr\",\"en\"],
\"translation\": [
  {
    \"fr\": \"texte fr\",
    \"en\": \"texte en\"
  }
]
}"
rty <- file(nom_trad ,encoding="UTF-8")
write(s_trad, file=rty)
close(rty)

# script packages
s_pack <- "library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(shinyalert)
library(shiny.i18n)
library(shinyWidgets)"
rty <- file(nom_package ,encoding="UTF-8")
write(s_pack, file=rty)
close(rty)

dir.create("www")
file.copy("P:/STATEA/98_modele_app/www/logo.jpg", "./www/logo.jpg")
dir.create("scripts_test")
dir.create("prod")

s_main <- paste0("library(fwantea)
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
rty <- file(nom_main ,encoding="UTF-8")
write(s_main, file=rty)
close(rty)

dir.create("fct")

file.edit(nom_main, fileEncoding = "UTF-8")
# file.edit(nom_package, fileEncoding = "UTF-8")
file.edit(nom_ui, fileEncoding = "UTF-8")
file.edit(nom_server, fileEncoding = "UTF-8")
# file.edit(nom_fonction, fileEncoding = "UTF-8")
file.edit(nom_trad, fileEncoding = "UTF-8")
}
