# coding: UTF-8
# Funções de utilidade para uso do pacote


# -------------------------------------------------------------------------

#' Substituir Caracteres Especiais em uma String
#'
#' Esta função substitui caracteres especiais em uma string pelos seus
#' respectivos códigos percentuais. É útil para preparar strings para
#' serem usadas em URLs ou outros contextos que exigem codificação de caracteres.
#'
#' @param string Uma string que pode conter caracteres especiais.
#'
#' @return Uma string com os caracteres especiais substituídos por
#'         seus códigos percentuais.
#'
#' @examples
#' \dontrun{
#' replace_char("Olá, Mundo!")
#' replace_char("Exemplo com # e @.")
#' }
#' @export
replace_char <- function(string) {
  # Mapeamento de caracteres especiais para seus códigos percentuais
  caracteres_especiais <-
    c(
      " ",
      "!",
      "#",
      "$",
      "ª", # "&",
      "º",
      "'",
      "(",
      ")",
      "*",
      "|", # "+",
      ",",
      "/",
      ":",
      ";",
      "=",
      "?",
      "@",
      "[",
      "]"
    )
  codigos_percentuais <-
    c(
      "+",
      "%21",
      "%23",
      "%24",
      "%AA", # "%26",
      "%BA",
      "%27",
      "%28",
      "%29",
      "%2A",
      "%7C", # "%2B",
      "%2C",
      "%2F",
      "%3A",
      "%3B",
      "%3D",
      "%3F",
      "%40",
      "%5B",
      "%5D"
    )

  # Iterar sobre os caracteres especiais e substituí-los
  for (i in seq_along(caracteres_especiais)) {
    string <- gsub(caracteres_especiais[i], codigos_percentuais[i], string, fixed = TRUE)
  }

  return(string)
}



# -------------------------------------------------------------------------

#' Exibir uma Barra de Progresso
#'
#' Esta função exibe uma barra de progresso no console. É útil para indicar o progresso
#' de uma tarefa que leva um certo tempo para ser concluída.
#'
#' @param msg Uma mensagem para exibir junto com a barra de progresso.
#' @param time_div A duração total durante a qual a barra de progresso será exibida.
#'                 Este valor é dividido igualmente entre os 100 passos da barra.
#'
#' @examples
#' \dontrun{
#' # Exibe uma barra de progresso por 5 segundos
#' show_progress("Processando", 5)
#' }
#' @importFrom cli cli_progress_bar cli_progress_update
#' @importFrom stringi stri_unescape_unicode
#' @export
#'
show_progress <- function(msg, time_div) {
  cli::cli_progress_bar(stringi::stri_unescape_unicode(msg), total = 100, clear = FALSE)
  for (i in 1:100) {
    Sys.sleep(time_div/100)
    cli::cli_progress_update()
  }
}

