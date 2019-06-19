#' Automatisation des traduction des textOutput
#'
#' @param nom nom de l'appli shiny
#' @param extract new ou global, permet d'extraire les nouveaux textoutput ou l'ensemble
#' @param type_sortie console ou script, sortie dans la console R ou dans le script textoutput.R
#'
#' @return un tableau avec les noms des textOutput et les lignes de commandes à rentrer dans le fichier server
#' @export
#' @import magrittr
#' @import dplyr
#' @import stringr
#' @import stringi
#' @examples
shiny_trad_txt_output <- function(nom, extract = "new", type_sortie = "console"){
  nom_ui <- paste0(nom, "_ui.R")
  nom_server <- paste0(nom, "_server.R")
  source(nom_ui)
  t_server <- gsub("$", '|',paste(readLines(nom_server), collapse = ""), fixed = T)
  nom <- as.data.frame(str_match_all(ui, "<div id=\"(.*?)\" class=\"shiny-text-output\"></div>")[[1]])
  if (extract == "new"){
    nom <- nom %>% mutate(txt_server =  paste0("output$", V2, " <- renderText(i18n$t(\"", V2, "\"))"),
                          out = paste0("output|",V2),
                          exist = stri_detect_fixed(t_server, out)) %>%
      filter(exist == FALSE)
  } else if (extract == "all"){
    nom <- nom %>% mutate(txt_server =  paste0("output$", V2, " <- renderText(i18n$t(\"", V2, "\"))"),
                          out = paste0("output|",V2),
                          exist = stri_detect_fixed(t_server, out))
  }
  if(type_sortie == "console"){
    return(as.data.frame(nom$txt_server))
  } else if (type_sortie == "script"){
    if (file.exists("textoutput.R")){
      file.remove("textoutput.R")
    }
    write(nom$txt_server,file="textoutput.R",append=TRUE)
    file.edit("textoutput.R")
  }
}
