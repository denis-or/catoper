# select_metadata <- function(disease){
#
#   # download metadata
#   # metadata <- download_metadata()
#   metadata <- utils::read.csv2("/docs/R/catoper/man/metadata_datasus.csv")
#   # Select the disease
#   temp_meta <- dplyr::filter(metadata, disease == {{disease}})
#
#   return(temp_meta)
# }

get_disease <- function(disease) {
  metadata <- utils::read.csv2("/docs/R/catoper/man/metadata_datasus.csv")
  base_meta <- dplyr::filter(metadata, disease == {{ disease }})

  if (nrow(base_meta) == 0) {
    usethis::ui_stop(paste0("Não tem esta doença ainda"))
  }

  page <- xml2::read_html(base_meta$url_form)
  list_ob <- list(page, base_meta)

  list_ob
}

get_input <- function(page) {
  pattern <- c("Ordenar pelos valores da coluna|Exibir linhas zeradas|Formato|Linhas|Colunas|Barras|Setores|Nenhum|Área|Diário|Dispersão")

  inputs <- page |>
    rvest::html_elements("div label") |>
    rvest::html_text() |>
    stringr::str_trim() |>
    stringr::str_squish() |>
    stringr::str_replace_all(pattern = pattern, replacement = "") |>
    stringr::str_subset(pattern = "\\S")
  #
  # garbage <- c("Exibir linhas zeradas",
  #              "Ordenar pelos valores da coluna",
  #              "Formato", "", " ", "   ")

  # inputs <- inputs[!(inputs %in% garbage)]
  return(inputs)
}

get_names <- function(page) {
  nomes <- page |>
    rvest::html_elements("div select") |>
    rvest::html_attr("name") |>
    stringr::str_subset("^listahidden", negate = T)
  return(nomes)
}

get_values <- function(page) {
  # page = page1

  base.values <- tibble::tibble(
    indice = page |>
      rvest::html_elements("option") |>
      rvest::html_attr("value"),
    valor = page |>
      rvest::html_elements("option") |>
      rvest::html_text() |>
      stringr::str_trim() |>
      stringr::str_squish()
  )

  return(base.values)
}

get_tudo <- function(numero) {
  tibble::tibble(
    campo = rep(
      page |>
        purrr::pluck(1) |>
        rvest::html_elements("div select") |> purrr::pluck(numero) |> rvest::html_attr("name"),
      page |>
        purrr::pluck(1) |>
        rvest::html_elements("div select") |> purrr::pluck(numero) |> rvest::html_elements("option") |>
        rvest::html_attr("value") |> length()
    ),
    valor = page |>
      purrr::pluck(1) |>
      rvest::html_elements("div select") |> purrr::pluck(numero) |> rvest::html_elements("option") |>
      rvest::html_attr("value"),
    valor2 = page |>
      purrr::pluck(1) |>
      rvest::html_elements("div select") |> purrr::pluck(numero) |> rvest::html_elements("option") |>
      rvest::html_text() |>
      stringr::str_trim() |>
      stringr::str_squish()
  )
}

get_names(page[[1]])
get_input(page[[1]])
get_values(page[[1]])

corrige_formato <- function(x) {
  x <- gsub("\\.", "", x)
  x <- as.numeric(as.character(x))
}

# formata_tabela
format_table <- function(site) {
  tabdados <- httr::content(site, encoding = "Latin1") |>
    rvest::html_nodes(".tabdados tbody td") |>
    rvest::html_text() |>
    trimws()

  cab_tabdados <- httr::content(site, encoding = "Latin1") |>
    rvest::html_nodes("th") |>
    rvest::html_text() |>
    trimws()

  final_table <- data.frame(matrix(
    data = tabdados,
    nrow = length(tabdados) / length(cab_tabdados),
    ncol = length(cab_tabdados),
    byrow = TRUE
  ))

  colnames(final_table) <- cab_tabdados

  final_table[-1] <- purrr::map(final_table[-1], corrige_formato)
  final_table <- janitor::clean_names(tibble::as_tibble(final_table))
  final_table <- dplyr::mutate(final_table, dplyr::across(.cols = tidyselect::everything(), .fns = ~ tidyr::replace_na(.x, 0)))

  final_table
}



pega_dados <- function(...) {
  args <- list(...)
  # args <- list(
  #   ob = page,
  #   disease = "Tuberculose",
  #   Linha = "Município de notificação",
  #   Coluna = "Mês Notificação",
  #   Conteúdo="Casos confirmados",
  #   "Períodos Disponíveis" = 2022,
  #   "Sexo"="Masculino"
  #   )
  # args <- list(
  #   ob = page_imun,
  #   Linha = "Região de notificação",
  #   Coluna = "Não ativa",
  #   Conteúdo = "Casos confirmados",
  #   "Períodos Disponíveis" = 2018)
  # args <- list(
  #   ob = page,
  #   Linha = "Unidade da Federação",
  #   Coluna = "Não ativa",
  #   Medidas = "Doses_aplicadas",
  #   "Períodos Disponíveis" = 2023
  # )
  # args <- list(
  #   ob = page_imun,
  #   Linha = "Região",
  #   Coluna = "Não ativa",
  #   Medidas = "Coberturas Vacinais",
  #   # Medidas = "Doses_aplicadas",
  #   "Períodos Disponíveis" = 2023
  # )

  # args
  args.df <- tibble::tibble(
    argument = rep(names(args), purrr::map(args, \(x) length(x)) |> purrr::list_c()),
    purrr::map(args, \(x) tibble::tibble(value = as.character(x))) |> purrr::list_c()
  ) |>
    dplyr::filter(argument != "ob")
  # args.df
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

  # base <- select_metadata(dplyr::pull(args.df[1,2]))
  # base
  #
  # page <- xml2::read_html(base$url_form)
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

  # base_toda

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
  #
  # base_toda
  #
  # #ttt
  # args.cod <- purrr::pmap(args.df[-1,], check_) |> purrr::list_rbind()
  #
  args.cod <- purrr::pmap(args.df, check_) |> purrr::list_rbind()

  # r_tabela

  # if (grepl(pattern = "Imunização", x = base$disease)) {
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
  # tabela <- readr::read_csv2(paste0('http://tabnet.datasus.gov.br/cgi/',
  #                                  response |>
  #                                    httr::content(encoding = "Latin1") |>
  #                                    rvest::html_element(xpath = '//*[contains(@href, ".csv" )]') |>
  #                                    xml2::xml_attr("href")), col_names = F)

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
    # col.names = F,
    header = F
  )

  #
  tabela <- tabela[row.names(tabela[which(tabela[1] == args$Linha), ]):row.names(tabela[which(tabela[1] == "Total"), ]), ]

  tabela <- janitor::clean_names(tabela)

  colnames(tabela) <- tabela[1, ]
  tabela <- tabela[-1, ]

  tabela

  # } else{
  #
  #   form_data <- gsub("\\\\u00",
  #                     "%",
  #                     stringi::stri_escape_unicode(
  #                       stringr::str_c(
  #                         stringr::str_flatten(paste0(args.cod$argument, "=", args.cod$value, "&")),
  #                         "formato=table&mostre=Mostra"
  #                       )
  #                     ))
  #   response <- httr::POST(url = base$url_tbcgi, body = form_data, httr::config(connecttimeout = 600))
  #   table <- format_table(site = response)
  #
  #
  # }
}

page <- get_disease("Imunização")

tabela <- pega_dados(
  ob = page,
  Linha = "Município de notificação",
  Coluna = "Mês Notificação",
  Conteúdo = "Casos confirmados",
  "Períodos Disponíveis" = 2022,
  "Sexo" = "Masculino"
)

tabela_dengue <- pega_dados(
  disease = "Dengue de 2014 em diante",
  Linha = "Ano 1º Sintoma(s)",
  Coluna = "Raça",
  Conteúdo = "Casos Prováveis",
  "Períodos Disponíveis" = 2021
)


tabela_sinasc <- pega_dados(
  disease = "Nascimento",
  Linha = "Sexo",
  Coluna = "Não ativa",
  Conteúdo = "Nascim p/resid.mãe",
  "Períodos Disponíveis" = c(2019, 2020)
)

page_imun <- get_disease("Produção ambulatorial")

tabela_imun <- pega_dados(
  ob = page_imun,
  Linha = "Município",
  Coluna = "Não ativa",
  Conteúdo = "Valor aprovado",
  # Medidas = "Doses_aplicadas",
  "Períodos Disponíveis" = c("Abr/2023", "Mar/2023")
)
