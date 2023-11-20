#' Análise Visual de Normalidade de uma Variável
#'
#' Esta função gera três gráficos para a análise de normalidade de uma variável:
#' um histograma com sobreposição da curva de densidade, um boxplot, e um gráfico QQ.
#' Utiliza o teste de `Shapiro-Wilk` para avaliar a normalidade.
#'
#' @param variable Um vetor numérico contendo os dados da variável a ser analisada.
#' @param label Uma string que será usada como rótulo nos eixos dos gráficos.
#'
#' @return Uma combinação de três gráficos (histograma com densidade, boxplot e QQ plot).
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso
#' dados <- rnorm(100, mean = 0, sd = 1) # Gerar dados aleatórios
#' see_normality(dados, "Exemplo de Variável")
#' }
#'
#'
#' @export
#' @importFrom tibble tibble
#' @importFrom stats shapiro.test
#' @importFrom stats density
#' @importFrom graphics hist
#' @importFrom ggplot2 ggplot geom_histogram geom_line scale_y_continuous sec_axis
#' @importFrom ggplot2 labs geom_boxplot geom_qq stat_qq stat_qq_line
#' @importFrom patchwork wrap_plots
see_normality <- function(variable, label) {

  value <- variable
  banco <- tibble::tibble(value)

  resultado <- stats::shapiro.test(variable)

  y_density <- stats::density(variable)

  x = y_density$x
  y = y_density$y
  banco_density <- data.frame(x = x, y = y)

  my_binwidth = 0.2
  my_seq <- seq(floor(min(variable)),
                ceiling(max(variable)),
                by = my_binwidth)

  max_hist <- max(graphics::hist(variable,
                                 breaks = my_seq,
                                 plot = F)$counts)

  max_dens <- max(y_density$y)

  ratio <- max_hist / max_dens

  textlab <- paste0(
    "\n",
    "Shapiro-wilk  W=",
    round(resultado$statistic[[1]], 2),
    " p=",
    format.pval(resultado$p.value, digits = 5)
  )


  g1 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = banco, ggplot2::aes(value),
                            binwidth = my_binwidth) +
    ggplot2::geom_line(data = banco_density,
                       ggplot2::aes(x = x, y = y * ratio),
                       color = "red") +
    ggplot2::scale_y_continuous(sec.axis =
                                  ggplot2::sec_axis(~ . / ratio,
                                                    name = "Densidade")) +
    ggplot2::labs(
      tag = "A",
      x = label,
      y = "Contagem",
      caption = textlab
    )

  g2 <- ggplot2::ggplot(banco, ggplot2::aes(y = value)) +
    ggplot2::geom_boxplot(position = "dodge2", outlier.colour = "red") +
    ggplot2::labs(tag = "B",
                  y = label)

  g3 <- ggplot2::ggplot(banco, ggplot2::aes(sample = value)) +
    ggplot2::stat_qq(
      size = 2,
      fill = 'steelblue',
      col = 'dodgerblue4',
      alpha = .6
    ) +
    ggplot2::stat_qq_line(col = "red" , lwd = 1) +
    ggplot2::labs(x = "Quantis teoricos",
                  y = "Quantis da amostra",
                  tag = "C")


  # g1 + g2 + g3

  patchwork::wrap_plots(list(g1, g2, g3))

}
