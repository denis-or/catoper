#' Get the csv of tabulation on Tabnet
#'
#' @param Linha string
#' @param Coluna string
#' @param Conteúdo string
#' @param `Período Disponíveis` string
#'
#' @return a csv
#'
#' @examples
get_table_csv <- function(...) {
  args <- list(...)

  args.df <- tibble::tibble(
    argument = rep(names(args), purrr::map(args, \(x) length(x)) |> purrr::list_c()),
    purrr::map(args, \(x) tibble::tibble(value = as.character(x))) |> purrr::list_c()
  ) |>
    dplyr::filter(argument != "ob")

  check_ <- function(argument, value, ...) {
    if (!(all(argument %in% unique(base_toda$label)))) {
      usethis::ui_stop(paste0("Não tem o argumento ", argument, " na base"))
    }

    if (!(all(value %in% base_toda$valor2))) {
      usethis::ui_stop(paste0("Não tem o valor ", value, " na base"))
    }

    arg.df <- dplyr::filter(
      base_toda,
      label == argument,
      valor2 == value
    ) |>
      dplyr::select(argument = campo, value = valor)

    arg.df
  }

  page_ob <- args$ob
  page <- purrr::pluck(page_ob, 1)
  base <- purrr::pluck(page_ob, 2)


  #
  base_toda <- purrr::map(
    1:as.numeric(
      page |>
        rvest::html_elements("div select") |>
        rvest::html_attr("name") |>
        length()
    ),
    \(numero) {
      prefixo <- page |>
        rvest::html_elements("div select") |>
        purrr::pluck(numero)

      tibble::tibble(
        campo = rep(
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
  ) |>
    purrr::list_rbind()

  pattern <- c("Ordenar pelos valores da coluna|Exibir linhas zeradas|Formato|Linhas|Colunas|Barras|Setores|Nenhum|Área|Diário|Dispersão")

  base_toda <- base_toda |>
    tibble::add_column(
      label = rep(
        page |>
          rvest::html_elements("div label") |>
          rvest::html_text() |>
          stringr::str_trim() |>
          stringr::str_squish() |>
          stringr::str_replace_all(pattern = pattern, replacement = "") |>
          stringr::str_subset(pattern = "\\S"),
        base_toda |>
          dplyr::mutate(campo = factor(campo, levels = unique(base_toda$campo))) |>
          dplyr::group_by(campo) |>
          dplyr::count() |>
          dplyr::pull(n)
      )
    )


  args.cod <- purrr::pmap(args.df, check_) |> purrr::list_rbind()

  form_data <- gsub(
    "\\\\u00",
    "%",
    stringi::stri_escape_unicode(stringr::str_c(
      stringr::str_flatten(paste0(
        args.cod$argument, "=", args.cod$value, "&"
      )),
      # "formato=table&mostre=Mostra"
      paste0("nomedef=", URLencode(sub(
        ".*\\?", "", base$url_form
      )), "&grafico=")
    ))
  )

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
      "Host" = "tabnet.datasus.gov.br",
      "Origin" = "http://tabnet.datasus.gov.br",
      "Referer" = base$url_form,
      "Upgrade-Insecure-Requests" = "1",
      "User-Agent" = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
    ),
    httr::config(connecttimeout = 600)
  )
  tabela <- utils::read.csv2(
    paste0(
      "http://tabnet.datasus.gov.br/cgi/",
      response |>
        httr::content(encoding = "Latin1") |>
        rvest::html_element(xpath = '//*[contains(@href, ".csv" )]') |>
        xml2::xml_attr("href")
    ),
    check.names = T,
    encoding = "latin1",
    row.names = NULL,
    blank.lines.skip = T,
    header = F
  )

  #
  tabela <- tabela[row.names(tabela[which(tabela[1] == args$Linha), ]):row.names(tabela[which(tabela[1] == "Total"), ]), ]

  tabela <- janitor::clean_names(tabela)

  colnames(tabela) <- tabela[1, ]
  tabela <- tabela[-1, ]

  tabela
}
