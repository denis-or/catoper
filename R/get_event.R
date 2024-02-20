# coding: UTF-8
#' @export
#'
#' @title
#' Gerar formulário necessário para conexão com o Tabnet do Datasus
#'
#' @description
#' Esta função é usada para leitura do formulário para tabulação de dados
#' de evento de saúde do Tabnet, no Datasus. Ela realiza o download do html
#' do formulário do Tabnet para que os argumentos sejam validados.
#' A lista de eventos é padronizada e pode ser encontrada [neste link](event_list.html).
#'
#' @details
#' IMPORTANT:
#' Essa função é essencial para uso da função `pega_dados()`.
#'
#' @author
#' Denis Rodrigues \email{catoper@@gmail.com}
#'
#' @param event Nome do evento para o qual os dados devem ser baixados e processados.
#'              Deve ser uma string não vazia.
#'
#' @return Uma lista contendo a página HTML lida e os metadados filtrados para o evento.
#'
#'
#' @examples
#' \dontrun{
#'
#' # Obter dados para um evento específico
#' # Primeiro, obter a página para o evento desejado
#' pagina <- get_event("Imunização Doses Aplicadas")
#'
#' # Em seguida, usar pega_dados para obter a tabela com os parâmetros específicos
#' # Observação: os argumentos devem ser idênticos àqueles que estão disponíveis
#' # no Tabnet do Datasus. Apenas o argumento `ob` é obrigatório e constante.
#'
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
#'
#'
#'
#' @importFrom usethis ui_stop
#' @importFrom dplyr filter
#' @importFrom xml2 read_html
#' @importFrom cli cli_alert_success
#' @importFrom stringi stri_unescape_unicode
get_event <- function(event) {

  show_progress("1. Baixando e processando dados", 2)

  # Validação do evento
  if (!is.character(event) || nchar(event) == 0 || is.na(event) || is.null(event)) {
    usethis::ui_stop(stringi::stri_unescape_unicode(paste0("O argumento 'event' deve ser uma string n\\u00e3o vazia.")))
  }

  # Carrega metadados

  # metadata_path <- "R/sysdata.rda"
  # if (!file.exists(metadata_path)) {
  #   usethis::ui_stop(stringi::stri_unescape_unicode(paste0("Arquivo de metadados n\\u00e3o encontrado: ", metadata_path)))
  # }

  # load(metadata_path)

  show_progress("2. Carregando metadados", 2)

  # Filtra para a doença especificada
  base_meta <- dplyr::filter(metadata, event_to_check == event)
  if (nrow(base_meta) == 0) {
    usethis::ui_stop(stringi::stri_unescape_unicode(paste0("Evento n\\u00e3o encontrado: ", event)))
  }

  # Lê a página HTML com tryCatch
  page <- tryCatch({
    xml2::read_html(base_meta$url_form)
  }, error = \(e) {
    usethis::ui_stop(stringi::stri_unescape_unicode(paste0("Falha ao ler a p\\u00e1gina HTML: ", e$message)))
  })

  show_progress("3. Finalizando", 4)

  cli::cli_alert_success("Download completo!")

  list_ob <- list(page = page, base_meta = base_meta)

  return(list_ob)
}
