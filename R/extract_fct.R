#' Extrait les fonctions du script fonction.R en fichiers individuels
#'
#' @param nom nom de l'appli
#' @param version nom de la version
#'
#' @return NA
#' @importFrom utils lsf.str
#' @importFrom stringr str_detect
#' @importFrom dplyr mutate
#' @export
#'
#' @examples
extract_fct <- function(nom, version = NA){
  if (!dir.exists("fct")){
    dir.create("fct")
  }
  X <- lsf.str()
  print(X)
  if (is.na(version)){
    nom_f <- paste0(nom, "_fonctions.R")
    source(nom_f)
  } else {
    nom_f <- paste0("./prod/",version, "/",nom, "_fonctions.R")
    source(nom_f)
  }
  file <- as.data.frame(paste(readLines(nom_f)))
  file$keep <- !str_detect(file[,1], "#'")
  file <- subset(file, keep == TRUE)
  print(file)
  X <- lsf.str()
  print(X)
  nb_fct <- length(X)
  print(nb_fct)
  for (i in 1:nb_fct){
    if (i < nb_fct){
      det <- str_detect(file[,1], c(X[i], X[i+1]))
    } else {
      det <- str_detect(file[,1], c(X[i]))
      det[length(det)] <- TRUE
    }
    file <- file %>% mutate(!!X[i] := det)
  }
  for (i in 1:nb_fct){
    nom_fonction <- paste0("./fct/",X[i], ".R")
    if (i < nb_fct){
      nb <- which(file[[X[i]]], TRUE)
      nb[2] <- nb[2] - 1
      df <- file[nb[1]:nb[2],]
    } else {
      nb <- which(file[[X[i]]], TRUE)
      df <- file[nb[1]:nb[2],]
    }
    script <- paste0(df[,1], collapse = "\n")
    rty <- file(nom_fonction ,encoding="UTF-8")
    write(script, file=rty)
    close(rty)
    print(paste0("Creation de la fonction ", X[i], " terminee "))
  }
}
