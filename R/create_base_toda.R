# coding: latin-1
#' Recriar Formulário a partir de Página HTML
#'
#' Esta função raspa informações de uma página HTML e recria um formulário de dados.
#' Extrai informações dos elementos 'select' e 'option', organiza esses dados em um
#' dataframe e adiciona etiquetas correspondentes a cada campo.
#'
#' @param page_x Objeto de página HTML de onde as informações serão extraídas.
#'
#' @return Um dataframe contendo informações dos campos de formulário, incluindo
#'         campos, valores e etiquetas correspondentes.
#'
#' @examples
#' \dontrun{
#' # Exemplo em construção...
#' # page_x <- xml2::read_html("http://exemplo.com/pagina")
#' # base_toda_y <- create_base_toda(page_x)
#'
#' }
#' @importFrom rvest html_elements html_attr html_text
#' @importFrom purrr map_dfr pluck
#' @importFrom tibble tibble
#' @importFrom stringr str_trim str_squish str_replace_all str_subset
#' @importFrom dplyr mutate across where
create_base_toda <- function(page_x) {

  # Extrai informacoes dos elementos select e option da pagina
  base_toda_y <- purrr::map_dfr(
    1:length(rvest::html_elements(page_x, "div select") |> rvest::html_attr("name")),
    \(numero) {
      prefixo <- page_x |>
        rvest::html_elements("div select") |>
        purrr::pluck(numero)

      tibble::tibble(
        campo_y = rep(
          prefixo |> rvest::html_attr("name"),
          prefixo |> rvest::html_elements("option") |> rvest::html_attr("value") |> length()
        ),
        valor = prefixo |> rvest::html_elements("option") |> rvest::html_attr("value"),
        valor2 = prefixo |> rvest::html_elements("option") |>
          rvest::html_text() |>
          stringr::str_trim() |>
          stringr::str_squish()
      )
    }
  )

  # Adiciona as etiquetas (labels) correspondentes
  labels_match <- rvest::html_text(rvest::html_elements(page_x, "div label")) |>
    stringr::str_trim() |>
    stringr::str_squish() |>
    stringr::str_replace_all(pattern = "Ordenar pelos valores da coluna|Exibir linhas zeradas|Formato|Linhas|Colunas|Barras|Setores|Nenhum|\u00c1rea|Di\u00e1rio|Dispers\u00e3o", replacement = "") |>
    stringr::str_subset(pattern = "\\S")

  base_toda_y <- dplyr::mutate(base_toda_y,
                               label_y = labels_match[match(campo_y, unique(campo_y))])

  base_toda_y <- dplyr::mutate(base_toda_y, dplyr::across(dplyr::where(is.character), ~stringr::str_trim(.x)))

  show_progress("1. Recriando formul\\u00e1rio", 2)

  return(base_toda_y)
}


