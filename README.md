
<!-- README.md is generated from README.Rmd. Please edit that file -->

# catoper

<!-- badges: start -->
<!-- badges: end -->

The `catoper` is a miscellany of functions to facilitate the
acquisition, processing, and analysis of public health data, with a
special focus on Datasus data.

## Installation

You can install the development version of catoper from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("denis-or/catoper")
```

## Main Functions

- `get_event()`: This function is used to read the Tabnet specific
  health event input form in Datasus. It performs several steps,
  including input validation, reading metadata, filtering data based on
  the chosen event. The list of events is standardized and can be found
  at .

- `pega_dados()`: This function coordinates several steps to obtain
  data. It recreates the Tabnet data form, processes arguments and makes
  a request to obtain the desired data, returning a semi-structured
  `dataframe`.

## Usage

Main

``` r
library(catoper)

# Example of data retrieval
pagina <- get_event("Imunização Doses Aplicadas")

# Data processing
tabela_D1 <- pega_dados(
 ob = pagina,
 Linha = "Município",
 Coluna = "Dose",
 Medidas = "Doses_aplicadas",
 "Períodos Disponíveis" = 2022,
 "Dose" = "1ª dose",
 "Imunobiológicos" = "Poliomielite inativada (VIP)",
 "Unidade da Federação" = "Rio de Janeiro"
)
```

Other use

``` r
# Normality plots

see_normality(rnorm(100, mean = 0, sd = 1), "Example")
```

![](man/figures/figure_1.png)

## Package reach

| event_to_check                                          | url_form                                                                                          | url_tbcgi                                                                                             | host                     | origin                             | pasta_csv                                    |
|:--------------------------------------------------------|:--------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------|:-------------------------|:-----------------------------------|:---------------------------------------------|
| Acidente de Trabalho                                    | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/acgrbr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/acgrbr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Acidente por Animais Peçonhentos                        | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/animaisbr.def>                        | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/animaisbr.def>                              | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Acidente de trabalho com exposição a material biológico | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/acbibr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/acbibr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Botulismo                                               | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/botubr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/botubr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Câncer Relacionado ao Trabalho                          | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/cancbr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/cancbr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Cólera                                                  | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/colerabr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/colerabr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Coqueluche                                              | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/coquebr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/coquebr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Dermatose Relacionada ao Trabalho                       | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/dermbr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/dermbr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Dengue até 2013                                         | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/denguebr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/denguebr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Dengue de 2014 em diante                                | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/denguebbr.def>                        | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/denguebbr.def>                              | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Difteria                                                | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/difteribr.def>                        | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/difteribr.def>                              | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Doença de Chagas Aguda                                  | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/chagasbr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/chagasbr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Doenças Exantemáticas                                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/exantbr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/exantbr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Esquistossomose                                         | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/esquistobr.def>                       | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/esquistobr.def>                             | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Febre de Chikungunya                                    | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/chikunbr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/chikunbr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Febre Maculosa                                          | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/febremaculosabr.def>                  | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/febremaculosabr.def>                        | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Febre Tifóide                                           | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/febretifoidebr.def>                   | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/febretifoidebr.def>                         | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Hanseníase                                              | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/hanswbr.def>                            | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/hanswbr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Hantavirose                                             | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/hantabr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/hantabr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Hepatite                                                | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/hepabr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/hepabr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| AIDS                                                    | <http://www2.aids.gov.br/cgi/deftohtm.exe?tabnet/br.def>                                          | <http://www2.aids.gov.br/cgi/tabcgi.exe?tabnet/br.def>                                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Influenza Pandêmica                                     | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/influbr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/influbr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Intoxicação Exógena                                     | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/Intoxbr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/Intoxbr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Leishmaniose Visceral                                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/leishvbr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/leishvbr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Leishmaniose Tegumentar Americana                       | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/ltabr.def>                            | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/ltabr.def>                                  | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Leptospirose                                            | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/leptobr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/leptobr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Ler/Dort                                                | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/lerdorbr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/lerdorbr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Malária                                                 | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/malabr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/malabr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Meningite                                               | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/meninbr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/meninbr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Paralisia Flácida Aguda                                 | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/pfabr.def>                            | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/pfabr.def>                                  | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| PAIR Relacionado ao Trabalho                            | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/pairbr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/pairbr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Peste                                                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/pestebr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/pestebr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Pneumoconiose Relacionada ao Trabalho                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/pneubr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/pneubr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Raiva Humana                                            | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/raivabr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/raivabr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Sífilis Adquirida                                       | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/sifilisadquiridabr.def>               | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/sifilisadquiridabr.def>                     | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Sífilis Congênita                                       | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/sifilisbr.def>                        | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/sifilisbr.def>                              | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Sífilis em Gestante                                     | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/sifilisgestantebr.def>                | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/sifilisgestantebr.def>                      | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Síndrome da Rubéola Congênita                           | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/srubeolacbr.def>                      | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/srubeolacbr.def>                            | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Tétano Acidental                                        | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/tetacidbr.def>                        | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/tetacidbr.def>                              | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Tétano Neonatal                                         | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/tetneobr.def>                         | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/tetneobr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Transtorno Mental Relacionado ao Trabalho               | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/transmentalbr.def>                    | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/transmentalbr.def>                          | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Violência interpessoal / autoprovocada                  | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/violebr.def>                          | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/violebr.def>                                | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Zika Vírus                                              | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/cnv/zikabr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/zikabr.def>                                 | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Nascimento                                              | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinasc/cnv/nvbr.def>                               | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinasc/cnv/nvbr.def>                                     | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Óbito                                                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sim/cnv/obt10br.def>                               | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sim/cnv/obt10br.def>                                     | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Nascimento (dados preliminares)                         | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinasc/cnv/pnvbr.def>                              | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinasc/cnv/pnvbr.def>                                    | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Óbito (dados preliminares)                              | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sim/cnv/pobt10br.def>                              | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sim/cnv/pobt10br.def>                                    | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| População (estudo de estimativas)                       | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?ibge/cnv/popsvsbr.def>                             | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?ibge/cnv/popsvsbr.def>                                   | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| População (TCU)                                         | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?ibge/cnv/poptbr.def>                               | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?ibge/cnv/poptbr.def>                                     | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Imunização Doses Aplicadas                              | <http://tabnet.datasus.gov.br/cgi/dhdat.exe?bd_pni/dpnibr.def>                                    | <http://tabnet.datasus.gov.br/cgi/webtabx.exe?bd_pni/dpnibr.def>                                      | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Imunização Cobertura                                    | <http://tabnet.datasus.gov.br/cgi/dhdat.exe?bd_pni/cpnibr.def>                                    | <http://tabnet.datasus.gov.br/cgi/webtabx.exe?bd_pni/cpnibr.def>                                      | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Produção ambulatorial                                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sia/cnv/qbbr.def>                                  | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sia/cnv/qbbr.def>                                        | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Produção hospitalar                                     | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sih/cnv/qrbr.def>                                  | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sih/cnv/qrbr.def>                                        | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Morbidade hospitalar a partir de 2008                   | <http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sih/cnv/nruf.def>                                  | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sih/cnv/nruf.def>                                        | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Tuberculose                                             | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/tubercbr.def>                           | <http://tabnet.datasus.gov.br/cgi/tabcgi.exe?sinannet/cnv/tubercbr.def>                               | tabnet2.datasus.gov.br   | <http://tabnet.datasus.gov.br>     | <http://tabnet.datasus.gov.br/cgi/>          |
| Dengue RJ                                               | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_dengue.def>                            | <http://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_dengue.def>                            | sistemas.saude.rj.gov.br | <http://sistemas.saude.rj.gov.br>  | <http://sistemas.saude.rj.gov.br/tabnetbd/>  |
| População Pactuada RJ                                   | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?populacao/pop_populacao_pactuada.def>          | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?populacao/pop_populacao_pactuada.def>          | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| População Censo RJ                                      | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?populacao/pop_populacao_censos.def>            | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?populacao/pop_populacao_censos.def>            | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| População TCU RJ                                        | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?populacao/pop_populacao_TCU.def>               | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?populacao/pop_populacao_TCU.def>               | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM RJ                                                  | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/tf_sim_do_geral.def>                        | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim/tf_sim_do_geral.def>                       | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM Taxas RJ                                            | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/sim_taxas_mortalidade.def>                 | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim_taxas_mortalidade.def>                     | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM Taxas DCNT RJ                                       | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/sim_taxas_mortalidade_dcnt.def>            | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim_taxas_mortalidade_dcnt.def>                | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM MIF RJ                                              | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/tf_sim_do_maternas_mif.def>                 | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?tf_sim_do_maternas_mif.def>                    | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM RM RJ                                               | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/sim_sinasc_razao_mortalidade_materna.def>  | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim/sim_sinasc_razao_mortalidade_materna.def>  | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM OI RJ                                               | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/tf_sim_do_infantil.def>                     | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?tf_sim_do_infantil.def>                        | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM OF RJ                                               | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/tf_sim_do_fetal.def>                        | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?tf_sim_do_fetal.def>                           | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM Taxas OI RJ                                         | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/sim_sinasc_taxas_mortalidade_infantil.def> | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim/sim_sinasc_taxas_mortalidade_infantil.def> | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM Causas Externas RJ                                  | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/tf_sim_do_externas.def>                     | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim/tf_sim_do_externas.def>                    | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIM Taxas Causas Externas RJ                            | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sim/sim_taxas_mortalidade_externas.def>        | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sim/sim_taxas_mortalidade_externas.def>        | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SINASC RJ                                               | <https://sistemas.saude.rj.gov.br/tabnet/deftohtm.exe?sinasc/nascido.def>                         | <https://sistemas.saude.rj.gov.br/scripts/tabcgi.exe?sinasc/nascido.def>                              | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SINASC RJ                                               | <https://sistemas.saude.rj.gov.br/tabnet/deftohtm.exe?sinasc/nascido.def>                         | <https://sistemas.saude.rj.gov.br/scripts/tabcgi.exe?sinasc/nascido.def>                              | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/>          |
| SINASC Taxas RJ                                         | <https://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?taxas/sinasc_taxa_natalidade.def>              | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?taxas/sinasc_taxa_natalidade.def>              | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Covid RJ                                                | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?covid19/esus_sivep.def>                         | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?covid19/esus_sivep.def>                        | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Tuberculose RJ                                          | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_tuberculose.def>                       | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_tuberculose.def>                      | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Violências RJ                                           | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_violencia.def>                         | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_violencia.def>                        | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Sífilis Congênita RJ                                    | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_sifilis.def>                           | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_sifilis.def>                          | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Sífilis Gestante RJ                                     | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_sifilisgestante.def>                   | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_sifilisgestante.def>                  | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Chik RJ                                                 | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_chikungunya.def>                       | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_chikungunya.def>                      | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Zika RJ                                                 | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_zika.def>                              | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_zika.def>                             | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| AIDS/HIV criança RJ                                     | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_aids_crianca.def>                      | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_aids_crianca.def>                     | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| AIDS/HIV adulto RJ                                      | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_aids_adulto.def>                       | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_aids_adulto.def>                      | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| AIDS/HIV gestante RJ                                    | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_hiv_gestante.def>                      | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_hiv_gestante.def>                     | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| AIDS/HIV banco relacionado RJ                           | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_Aids_relacionado.def>                  | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_Aids_relacionado.def>                 | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| DART acidente de trabalho RJ                            | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_acidente_trabalho.def>                 | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_acidente_trabalho.def>                | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| DART acidente com material biológico RJ                 | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_acidtrab_biologico.def>                | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_acidtrab_biologico.def>               | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| DART intoxicação exógena RJ                             | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?Sinan/tf_intoxicacao_exogena.def>               | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?Sinan/tf_intoxicacao_exogena.def>              | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Hanseníase RJ                                           | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_hanseniase.def>                        | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_hanseniase.def>                       | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| Hepatites Virais RJ                                     | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sinan/tf_hepatites.def>                         | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sinan/tf_hepatites.def>                        | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIVEP dados básicos RJ                                  | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sivep_gripe/sivep_gripe_bas.def>                | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sivep_gripe/sivep_gripe_bas.def>               | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| SIVEP dados completos RJ                                | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?sivep_gripe/sivep_gripe.def>                    | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?sivep_gripe/sivep_gripe.def>                   | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |
| CNES dados básicos RJ                                   | <http://sistemas.saude.rj.gov.br/tabnetbd/dhx.exe?cnes/tf_cnes_basico.def>                        | <https://sistemas.saude.rj.gov.br/tabnetbd/webtabx.exe?cnes/tf_cnes_basico.def>                       | sistemas.saude.rj.gov.br | <https://sistemas.saude.rj.gov.br> | <https://sistemas.saude.rj.gov.br/tabnetbd/> |

## License

This package is available under the MIT License. See the LICENSE file
for more details.
