# coding: UTF-8
#' @export
#'
#' @title
#' Baixar e processar dados do Tabnet do Datasus E SES-RJ
#'
#' @description
#' Esta função coordena várias etapas para obter dados. Ela recria o
#' formulário de dados do Tabnet, processa argumentos e faz uma requisição
#' para obter os dados desejados, retornando um `dataframe` semi-estruturado.
#'
#' @details
#' IMPORTANT:
#' Essa função possui apenas um argumento obrigatório que é o `ob`, que recebe
#' o objeto criado pela função `get_event()`.
#'
#' @author
#' Denis Rodrigues \email{catoper@@gmail.com}
#'
#' @param ... Argumentos variados que incluem tanto parâmetros para a construção do
#'            formulário quanto para a filtragem dos dados a serem obtidos.
#'            O argumento `ob` é obrigatório. Considere utilizar, minimamente
#'            os seguintes argumentos:
#'             - Linha;
#'             - Coluna;
#'             - Incremento;
#'             - Períodos disponíveis.
#'            A depender de cada evento, esses nomes podem ser alterados e até
#'            ampliados. Veja o exemplo abaixo.
#'
#' @return
#' Retorna um `tibble` contendo os dados obtidos após processar todas as etapas.
#'
#'
#'
#' @examples
#' \dontrun{
#' # Obter dados para um evento específico
#' # Primeiro, obter a página para o evento desejado
#' pagina <- get_event("Imunização Doses Aplicadas")
#'
#' # Em seguida, usar pega_dados para obter a tabela com os parâmetros específicos
#' # Observação: os argumentos devem ser idênticos àqueles que estão disponíveis
#' # no Tabnet do Datasus. Apenas o argumento `ob` é obrigatório e constante.

#' tabela_D1 <- pega_dados(
#'   ob = pagina,
#'   Linha = "Município",
#'   Coluna = "Dose",
#'   Medidas = "Doses_aplicadas",
#'   "Períodos Disponíveis" = 2022,
#'   "Dose" = "1ª dose",
#'   "Imunobiológicos" = "Poliomielite inativada (VIP)",
#'   "Unidade da Federação" = "Rio de Janeiro"
#' )
#' }
#'
#' # A tabela_D1 agora contém os dados processados de doses aplicadas de
#' # 1ª dose de polio (VIP) em 2022 nos municípios do Rio de Janeiro
#'

pega_dados <- function(...) {

  args <- list(...)

  if (missing(args$ob) || is.null(args$ob)) {
    usethis::ui_stop("O argumento ob \\\\u00e9 obrigat\\u00f3rio e n\\u00e3o pode ser NULL.")
  }

  if (!xor(is.null(args[['Medidas']]), is.null(args[['Conteúdo']]))) {
    usethis::ui_stop("Apenas um dos argumentos Medidas ou Conte\\u00fado deve ser fornecido.")
  }

  argumentos_obrigatorios <- c("Linha", "Coluna", "Per\\u00edodos dispon\\u00edveis")

  purrr::walk(argumentos_obrigatorios, ~{
    if (is.null(args[[.x]])) {
      stop(paste("O argumento", .x, "\\\\u00e9 obrigat\\u00f3rio."))
    }
  })

  page_ob <- args$ob
  pagina_x <- page_ob[[1]]
  base_x <- page_ob[[2]]

  base_toda_x <- create_base_toda(page_x = pagina_x)

  args_processados <- process_args(args = args, base_toda_m = base_toda_x)

  form_data <- build_form_data(args_processados, base_x)

  tabela <- fetch_data_datasus(form_data, base_x, args$Linha)

  return(tabela)

}
