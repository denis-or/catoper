# coding: latin-1
#' Atualizar base usada no `Readme`
#'
#' Esta função raspa informações das páginas HTML e gera um compilado de dados
#' para acompanhamento do usuário, apresentado em forma de tabela no `Readme`.
#'
#'
#' @return Um dataframe contendo informações dos eventos alcançados pelo pacote
#' e suas atualizações.
#'
#'
update_base_readme <- function(){

  load("R/sysdata.rda")
  metadata_ <- metadata

  tab_base_readme <- purrr::map(
    1:nrow(metadata_), \(base){
      evento <- metadata_$event_to_check[base]
      resposta_n <- httr2::request(metadata_$url_form[base]) |>
        httr2::req_perform() |>
        httr2::resp_body_html()

      titulo <- resposta_n |>
        rvest::html_element(xpath = '//*[contains(@class, "titulo")]') |>
        rvest::html_text2() |>
        stringr::str_trim()

      fonte <- resposta_n |>
        rvest::html_elements(xpath = '//div[contains(text(), "Fonte:")]') |>
        rvest::html_text2() |>
        stringr::str_replace_all(pattern = "\\r\\n\\r \\r\\t\\r\\r Veja a vers\\u00e3o do Tab para Windows \\\\(TABWIN\\\\)", "") |>
        stringr::str_trim()

      tabela_ <- data.frame(
        evento = evento,
        titulo = titulo,
        fonte = fonte
      )

      tabela_
    },
    .progress = T
  ) |>
    purrr::list_rbind()

  tab_base_readme

}

