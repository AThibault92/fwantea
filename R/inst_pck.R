#' Creation d'un script pour installer les packages
#'
#' @param nom nom de l'appli
#'
#' @return NA
#' @export
#' @importFrom utils getParseData
#' @importFrom dplyr filter mutate
#'
#' @examples
inst_pck <- function(nom){
  nom_p <- paste0(nom, "_package.R")
  nom_inst <- paste0(nom, "_inst_package.R")
  liste_pkg <- getParseData(parse(nom_p, keep.source=TRUE)) %>% filter(token=="SYMBOL") %>%
    mutate(cmd = paste0("install.packages(\"", text, "\")"))
  cmd <- paste0(liste_pkg$cmd, collapse = "\n")
  rty <- file(nom_inst ,encoding="UTF-8")
  write(cmd, file=rty)
  close(rty)
  print(paste0("Création du fichier d'installation des terminée "))
}
