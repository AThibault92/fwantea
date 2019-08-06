#' Initialisation d'un metaprojet
#'
#' @return NA
#' @export
#'
#' @examples
new_metaproject <- function(){
  script <- "# Pour ouvrir les script d'un sub-project
  library(fwantea)
  view_project(nom)
  new_subproject(nom)
  "
  rty <- file("0_main.R" ,encoding="UTF-8")
  write(script, file=rty)
  close(rty)
}
