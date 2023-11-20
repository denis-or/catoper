#' Construir Dados de Formulário para Requisição
#'
#' Esta função constrói uma string de consulta para um formulário web a partir de
#' argumentos processados e informações de uma base de dados. Ela ajusta os caracteres
#' especiais para o formato apropriado para URLs e cria o link de requisição final.
#'
#' @param args_processados Dataframe contendo argumentos processados.
#' @param base_form Objeto contendo as informações da URL do formulário.
#'
#' @return Uma string formatada pronta para ser usada em uma requisição web.
#'
#' @examples
#' \dontrun{
#' # Exemplo em construção...
#' # args_processados <- data.frame(argument = c("arg1", "arg2"), value = c("val1", "val2"))
#' # base <- list(url_form = "http://example.com/form")
#' # build_form_data(args_processados, base)
#'
#' }
#' @importFrom stringr str_c
#' @importFrom purrr pmap_chr
#' @importFrom stringi stri_escape_unicode
build_form_data <- function(args_processados, base_form) {

  # Construir a string de consulta a partir dos argumentos processados
  consulta <- stringr::str_c(
    purrr::pmap_chr(args_processados, \(argument, value) {
      (stringr::str_c(replace_char(argument),
                      "=",
                      replace_char(value), "&"))
    }),
    collapse = ""
  )

  url_form <- replace_char(gsub(".*\\?", "", base_form$url_form))

  # Criar o link do Datasus
  form_data <- stringr::str_c(
    consulta,
    "nomedef=", url_form,
    "&grafico="
  )

  # Substituir os códigos Unicode, se necessário
  form_data <- gsub("\\\\u00", "%", stringi::stri_escape_unicode(form_data))

  show_progress("3. Montando o link", 2)

  return(form_data)
}
