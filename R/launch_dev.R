#' Lancement de l'appli en dev
#'
#' @return NA
#' @export
#'
#' @examples
launch_dev <- function(){
  source("app.R")
  shinyApp(ui, server)
}
