#' Creation d'une todolist
#'
#' @param nom nom de l'appli
#'
#' @return NA
#' @importFrom glue glue
#' @importFrom dplyr mutate filter
#' @importFrom stringr str_detect
#' @export
#'
#' @examples
todo_list <- function(nom){
  nom_fonction <- paste0(nom, "_fonctions.R")
  nom_ui <- paste0(nom, "_ui.R")
  nom_server <- paste0(nom, "_server.R")

  file_fonction <- as.data.frame(readLines(nom_fonction, encoding = "UTF-8"))
  colnames(file_fonction) <- "cmd"
  file_fonction <- file_fonction %>% mutate(todo = str_detect(cmd, "# TODO"), ligne = rownames(.), fichier = nom_fonction) %>% filter(todo == TRUE) %>%
    mutate(txt = glue("Ligne {ligne} : {cmd}"))

  file_ui <- as.data.frame(readLines(nom_ui, encoding = "UTF-8"))
  colnames(file_ui) <- "cmd"
  file_ui <- file_ui %>% mutate(todo = str_detect(cmd, "# TODO"), ligne = rownames(.), fichier = nom_ui) %>% filter(todo == TRUE) %>%
    mutate(txt = glue("Ligne {ligne} : {cmd}"))

  file_server <- as.data.frame(readLines(nom_server, encoding = "UTF-8"))
  colnames(file_server) <- "cmd"
  file_server <- file_server %>% mutate(todo = str_detect(cmd, "# TODO"), ligne = rownames(.), fichier = nom_server) %>% filter(todo == TRUE) %>%
    mutate(txt = glue("Ligne {ligne} : {cmd}"))

  files <- rbind(file_fonction, file_ui, file_server)
  df <- data.frame(txt = c(nom_fonction, subset(files, fichier == nom_fonction)$txt, "",
                           nom_ui, subset(files, fichier == nom_ui)$txt, "",
                           nom_server, subset(files, fichier == nom_server)$txt))
  script <- paste0(df[,1], collapse = "\n")
  rty <- file("todo.txt" ,encoding="UTF-8")
  write(script, file=rty)
  close(rty)
  file.edit("todo.txt")
}
