# coding: UTF-8
#' Processar e Validar Argumentos
#'
#' Esta função transforma uma lista de argumentos em um dataframe e os valida
#' contra um dataframe de metadados `base_toda`. Cada argumento é verificado para
#' garantir que esteja presente em `base_toda` e, se válido, é retornado em um
#' dataframe formatado.
#'
#' @param args Lista de argumentos a serem processados e validados.
#' @param base_toda_m Dataframe que contém os metadados contra os quais os argumentos são validados.
#'
#' @return Um dataframe contendo os argumentos processados e validados.
#'
#' @examples
#' \dontrun{
#' # Exemplo em construção...
#' # args <- list(argument1 = "valor1", argument2 = "valor2")
#' # base_toda <- data.frame(label = c("argument1", "argument2"), ...)
#' # process_args(args, base_toda)
#'
#' }
#' @export
#' @importFrom tibble tibble
#' @importFrom purrr map_int list_c pmap_dfr
#' @importFrom dplyr filter
#' @importFrom tidyr crossing
process_args <- function(args, base_toda_m) {

  show_progress("2. Validando os argumentos", 2)

  # Transforma os argumentos em um data frame para facilitar o processamento
  args.df <- tibble::tibble(
    argument= rep(names(args), purrr::map_int(args, length)),
    purrr::map(args, \(x) tibble::tibble(value = as.character(x))) |> purrr::list_c()
  ) |>
    dplyr::filter(argument != "ob")

  args.df <- tidyr::crossing(args.df, base_toda_z = list(base_toda_m))
  args.df <- purrr::pmap_dfr(args.df, check_)

  # Retorna os argumentos processados
  return(args.df)
}
