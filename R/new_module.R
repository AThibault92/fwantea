#' Nouveau module shiny
#'
#' @param nom_mod nom du module
#'
#' @return un script avec le module shiny
#' @export
#'
#' @examples
new_module <- function(nom_mod){
  script <- paste0("# Module UI

#' @title   mod_",nom_mod,"_ui and mod_",nom_mod,"_server
#' @description  Module R Shiny.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_",nom_mod,"
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
mod_",nom_mod,"_ui <- function(id){
  ns <- NS(id)
  tagList(

  )
}

# Module Server

#' @rdname mod_",nom_mod,"
#' @export
#' @keywords internal

mod_",nom_mod,"_server <- function(input, output, session){
  ns <- session$ns
}

## To be copied in the UI
# mod_",nom_mod,"_ui(\"",nom_mod,"_ui_1\")

## To be copied in the server
# callModule(mod_",nom_mod,"_server, \"",nom_mod,"_ui_1\")")

  nom_file <- paste0("./modules/", nom_mod, ".R")
  rty <- file(nom_file ,encoding="UTF-8")
  write(script, file=rty)
  close(rty)
  file.edit(nom_file, fileEncoding = "UTF-8")
  cat("Module crée")
}
