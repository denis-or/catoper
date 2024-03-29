% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_args.R
\name{process_args}
\alias{process_args}
\title{Processar e Validar Argumentos}
\usage{
process_args(args, base_toda_m)
}
\arguments{
\item{args}{Lista de argumentos a serem processados e validados.}

\item{base_toda_m}{Dataframe que contém os metadados contra os quais os argumentos são validados.}
}
\value{
Um dataframe contendo os argumentos processados e validados.
}
\description{
Esta função transforma uma lista de argumentos em um dataframe e os valida
contra um dataframe de metadados \code{base_toda}. Cada argumento é verificado para
garantir que esteja presente em \code{base_toda} e, se válido, é retornado em um
dataframe formatado.
}
\examples{
\dontrun{
# Exemplo em construção...
# args <- list(argument1 = "valor1", argument2 = "valor2")
# base_toda <- data.frame(label = c("argument1", "argument2"), ...)
# process_args(args, base_toda)

}
}
