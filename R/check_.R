# coding: UTF-8
#' Verificar Presença de Argumento e Valor em um Dataframe
#'
#' Esta função verifica se um dado argumento e seu valor correspondente estão presentes
#' em um dataframe `base_toda`. Se estiverem presentes, retorna um subset do dataframe.
#' Caso contrário, interrompe a execução com uma mensagem de erro.
#'
#' @param argument O nome do argumento a ser verificado no dataframe.
#' @param value_to_check O valor do argumento a ser verificado.
#' @param base_toda_z Dataframe que contém os dados a serem verificados.
#'
#' @return Um dataframe contendo as linhas onde o argumento e seu valor correspondente
#'         são encontrados em `base_toda_z`.
#'
#' @examples
#' \dontrun{
#' # Exemplo em construção...
#' # check_("argumento_exemplo", "valor_exemplo", base_toda)
#'
#' }
#' @importFrom dplyr filter select rename
#' @importFrom stringi stri_unescape_unicode
#' @importFrom usethis ui_stop
check_ <- function(argument, value_to_check, base_toda_z) {

  if (!(all(argument %in% unique(base_toda_z$label_y)))) {
    usethis::ui_stop(stringi::stri_unescape_unicode(paste0("N\\u00e3o tem o argumento ",
                                                           argument, " na base")))
  }

  if (!(all(value_to_check %in% base_toda_z$valor2))) {
    usethis::ui_stop(stringi::stri_unescape_unicode(paste0("N\\u00e3o tem o valor ",
                                                           value_to_check, " na base")))
  }

  arg.df <- dplyr::filter(
    base_toda_z,
    label_y == argument,
    valor2 == value_to_check
  ) |>
    dplyr::select(argument = campo_y, value = valor)

  return(arg.df)
}
