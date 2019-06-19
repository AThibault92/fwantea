#' Lance l'appli en production
#'
#' @param version version de l'appli
#'
#' @return NA
#' @export
#'
#' @examples
launch_prod <- function(version){
  path <- paste0("./prod/", version, "/app.R")
  source(path)
  shinyApp(ui, server)
}
