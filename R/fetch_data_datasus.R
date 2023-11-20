# coding: UTF-8
#' Baixar e Processar Dados do Datasus
#'
#' Esta função é responsável por fazer uma requisição POST ao Datasus,
#' baixar um arquivo CSV e processá-lo. Ela tenta a requisição várias vezes
#' em caso de timeout e processa o CSV baixado para retornar os dados em um formato
#' utilizável.
#'
#' @param form_data Dados de formulário pré-formatados para a requisição POST.
#' @param base Lista contendo informações da URL base e do formulário.
#' @param linha_argumento Especifica a linha de início para processamento dos dados no CSV.
#'
#' @return Um dataframe contendo os dados processados do CSV.
#'
#' @examples
#' \dontrun{
#' # Exemplo em construção...
#' # form_data <- "seus_dados_de_formulario"
#' # base_exemplo <- list(url_tbcgi = "http://exemplo.com", url_form = "http://exemplo.com/form")
#' # linha_argumento <- "linha_inicial"
#' # fetch_data_datasus(form_data, base_exemplo, linha_argumento)
#'
#' }
#' @export
#' @importFrom httr POST add_headers content config
#' @importFrom rvest html_element
#' @importFrom xml2 xml_attr
#' @importFrom readr read_csv2
#' @importFrom janitor clean_names
#' @importFrom usethis ui_stop ui_info
#' @importFrom utils URLdecode URLencode
fetch_data_datasus <- function(form_data, base, linha_argumento) {

  show_progress("4. Conectando com Datasus", 2)

  max_tentativas <- 3
  tentativa <- 1
  while (tentativa <= max_tentativas) {
    tryCatch({
      # Enviar requisição POST
      response <- httr::POST(
        url = base$url_tbcgi,
        body = form_data,
        httr::add_headers(
          "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
          "Accept-Encoding" = "gzip, deflate",
          "Accept-Language" = "pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7",
          "Cache-Control" = "max-age=0",
          "Connection" = "keep-alive",
          "Content-Type" = "application/x-www-form-urlencoded",
          "Host" = "tabnet2.datasus.gov.br",
          "Origin" = "http://tabnet.datasus.gov.br",
          "Referer" = base$url_form,
          "Upgrade-Insecure-Requests" = "1",
          "User-Agent" = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
        ),
        httr::config(connecttimeout = 10000)
      )

      # Verificar se a requisição foi bem-sucedida
      if (httr::status_code(response) != 200) {
        usethis::ui_stop(paste0("A requisi\\u00e7\\u00e3o POST falhou com o status: ", httr::status_code(response)))
      }

      # Se a requisição for bem-sucedida, sair do loop
      break
    }, error = function(e) {
      if (grepl("Timeout", e$message)) {
        usethis::ui_info("Reconectando...")
        tentativa <- tentativa + 1
        if (tentativa > max_tentativas) {
          usethis::ui_stop(paste0("M\\u00e1ximo de tentativas de requisi\\u00e7\\u00e3o atingido. Erro: ", e$message))
        }
        # Esperar um pouco antes de tentar novamente
        Sys.sleep(5)
      } else {
        # Se o erro não for de timeout, retransmiti-lo
        usethis::ui_stop(paste0(e))
      }
    })
  }

  show_progress("5. Baixando CSV", 2)
  # Extrair o link para o arquivo CSV da resposta
  csv_link <- response |>
    httr::content(encoding = "Latin1") |>
    rvest::html_element(xpath = '//*[contains(@href, ".csv" )]') |>
    xml2::xml_attr("href") |>
    URLdecode()

  # Verificar se a requisição foi bem-sucedida
  if (is.na(csv_link)|| is.null(csv_link)) {
    usethis::ui_stop(paste0("Erro baixando o CSV. Pode estar em branco: "))
  }

  # Construir URL completa para o CSV
  csv_url <- URLencode(paste0("http://tabnet.datasus.gov.br/cgi/", csv_link))



  # Ler dados do CSV
  tabela <- tryCatch({
    readr::read_csv2(csv_url,
                     locale = readr::locale(encoding = "latin1",
                                            decimal_mark = ",",
                                            grouping_mark = "."),
                     col_names = FALSE,
                     skip_empty_rows = TRUE,show_col_types = F)},
    error = function(e) {
      usethis::ui_stop(paste0("Erro ao ler o arquivo CSV: ", e$message))
    })

  # Processar a tabela
  if (!is.null(linha_argumento) && linha_argumento %in% tabela[[1]]) {
    indice_inicio <- which(tabela[[1]] == linha_argumento)
    indice_fim <- which(tabela[[1]] == "Total")
    tabela <- tabela[indice_inicio:indice_fim, ]
  }
  show_progress("6. Processando tabela", 2)

  # Limpar e formatar a tabela

  colnames(tabela) <- tabela[1, ]
  tabela <- janitor::clean_names(tabela)
  tabela <- tabela[-1, ]
  tabela <- tabela[tabela[,1] != "Total",]

  cli::cli_alert_success("Processo finalizado!")
  return(tabela)

}
