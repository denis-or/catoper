
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

| Evento               | Descrição                                                                             | Observações                                                                                  |
|:---------------------|:--------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------|
| Acidente de Trabalho | INVESTIGAÇÃO DE ACIDENTE DE TRABALHO - NOTIFICAÇÕES REGISTRADAS NO SINAN NET - BRASIL | Fonte: Ministério da Saúde/SVS - Sistema de Informação de Agravos de Notificação - Sinan Net |

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho. O
campo “CNAE  Ativ. Econ.” considera os códigos referentes as tabelas
CNAE 1.0. Para tabular dados de Covid-19 relacionada ao trabalho (CID-10
“B34.2”), selecione na linha a variável “Diag. Lesão” e na coluna a
variável de interesse. Dados a partir 2020 do Espírito Santo não estão
disponíveis neste sistema, pois são oriundos do Sistema de Informação
e-SUS VS, em uso pelo estado desde janeiro de 2020. Dados de 2006 a 2017
revisados e atualizados em 15/08/2022. Dados de 2018 revisados e
atualizados em 22/08/2022. Dados de 2019 atualizados em junho de 2023.
Dados de 2020 atualizados em junho de 2023, sujeitos à revisão. Dados de
2021 revisados e atualizados em agosto de 2023, sujeitos à revisão.
Dados de 2022 revisados e atualizados em julho de 2023, sujeitos à
revisão. Dados de 2023 atualizados em janeiro de 2024, sujeitos à
revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Acidente por Animais Peçonhentos
  \|ACIDENTE POR ANIMAIS PEÇONHENTOS - Notificações registradas no
  Sistema de Informação de Agravos de Notificação - Brasil \|Fonte:
  Ministério da Saúde/SVSA - Sistema de Informação de Agravos de
  Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano, selecione na “Linha” a variável de interesse; na
“Coluna” selecione “Ano do Acidente”; em “Períodos Disponíveis” assinale
o ano inicial da série e o ano imediatamente anterior e o posterior ao
primeiro e último ano assinalado, respectivamente (p/ incluir casos
notificados nos primeiros e últimos dias de cada ano). Em “Seleções
Disponíveis” assinale os anos dos acidentes. (ex: nº de casos ocorridos
em cada UF entre 2013 e 2015: selecione na “Linha” “UF de Ocorrência”,
na “Coluna” “Ano do acidente”, em “Períodos disponíveis” assinale 2012,
2013, 2014, 2015 e 2016 e em “Seleções” assinale “Ano do acidente 2013,
2014 e 2015”). Dados de 2007 a 2013 atualizados em 25/01/2018. Dados de
2014 a 2016 atualizados em 28/01/2019. Dados de 2017 atualizados em
18/04/2020. Dados de 2018 atualizados em 20/08/2022. Dados de 2019
atualizados em 28/06/2023. Dados de 2020 atualizados em 17/11/2023,
dados sujeitos à revisão. Dados de 2021 atualizados em 24/10/2023, dados
sujeitos à revisão. Dados de 2022 atualizados em 16/11/2023, dados
sujeitos à revisão. Dados a partir de 2020 Espírito Santo não estão
disponíveis neste sistema pois são oriundos do Sistema de Informação
e-SUS VS, em uso pelo estado desde aquele ano.

\*Dados disponibilizados no TABNET em novembro de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Acidente de trabalho com exposição a
material biológico \|INVESTIGAÇÃO DE ACIDENTE DE TRABALHO COM EXPOSIÇÃO
A MATERIAL BIOLÓGICO - Notificações registradas no Sinan Net - BRASIL
\|Fonte: Ministério da Saúde/SVS - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho O campo
“CNAE  Ativ. Econ.” considera os códigos referentes as tabelas CNAE 1.0.
Dados a partir 2020 do Espírito Santo não estão disponíveis neste
sistema, pois são oriundos do Sistema de Informação e-SUS VS, Dados de
2006 a 2017 revisados e atualizados em 15/08/2022. Dados de 2018
revisados e atualizados em 22/08/2022. Dados de 2019 atualizados em
junho de 2023. Dados de 2020 atualizados em junho de 2023, sujeitos à
revisão. Dados de 2021 revisados e atualizados em agosto de 2023,
sujeitos à revisão. Dados de 2022 revisados e atualizados em julho de
2023, sujeitos à revisão. Dados de 2023 atualizados em janeiro de 2024,
sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Botulismo \|BOTULISMO - Casos
  confirmados notificados no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Excluídos casos não residentes no Brasil. Períodos Disponíveis -
Correspondem aos anos de notificação dos casos. Para tabular dados
epidemiológicos de um determinado ano selecione na linha a variável de
interesse, na Coluna Ano dos 1ºs sintomas; em Períodos Disponíveis
assinale o ano inicial da série e todos os posteriores até o ano atual
(p/ incluir casos notificados com atraso) e em Seleções Disponíveis
assinale os anos dos 1ºs sintomas (ex: nº de casos com início de
sintomas 2007: selecione na linha UF de residência, na Coluna Ano de 1ºs
sintomas, em Períodos disponíveis 2007 até o ano atual e em Seleções
assinale Ano de 1ºs sintomas 2007). Dados de 2020 e 2023 do Espírito
Santo não estão disponíveis neste sistema pois são oriundos do Sistema
de Informação e-SUS VS, em uso pelo estado desde janeiro de 2020. Dados
de 2008 atualizados em 24/02/2015. Dados de 2009 atualizados em
24/02/2015. Dados de 2010 atualizados em 01/11/2013. Dados de 2011
atualizados em 28/08/2014. Dados de 2012 atualizados em 28/05/2015.
Dados de 2013 atualizados em 25/05/2016. Dados de 2014 atualizados em
15/12/2018. Dados de 2015 atualizados em 24/01/2018. Dados de 2016
atualizados em 13/09/2019. Dados de 2017 atualizados em 18/04/2020.
Dados de 2018 atualizados em 21/08/2022. Dados de 2019 atualizados em
13/06/2023. Dados de 2020 atualizados em 07/06/2023, dados sujeitos à
revisão. Dados de 2021 atualizados em 14/09/2023, dados sujeitos à
revisão. Dados de 2022 atualizados em 09/09/2023, dados sujeitos à
revisão. Dados de 2023 atualizados em 05/09/2023, dados sujeitos à
revisão.

\*Dados disponibilizados no TABNET em outubro de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Câncer Relacionado ao Trabalho
\|Investigação De Câncer relacionado ao Trabalho - Notificações
registradas no Sinan Net - Brasil \|Fonte: Ministério da Saúde/SVS -
Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho O campo
“CNAE  Ativ. Econ.” considera os códigos referentes as tabelas CNAE 1.0.
Dados a partir 2020 do Espírito Santo não estão disponíveis neste
sistema, pois são oriundos do Sistema de Informação e-SUS VS, Dados de
2006 a 2017 revisados e atualizados em 15/08/2022. Dados de 2018
revisados e atualizados em 22/08/2022. Dados de 2019 atualizados em
junho de 2023. Dados de 2020 atualizados em junho de 2023, sujeitos à
revisão. Dados de 2021 revisados e atualizados em agosto de 2023,
sujeitos à revisão. Dados de 2022 revisados e atualizados em julho de
2023, sujeitos à revisão. Dados de 2023 atualizados em janeiro de 2024,
sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Cólera \|CÓLERA - Casos confirmados
  notificados no Sistema de Informação de Agravos de Notificação -
  Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de Informação de
  Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para cálculo da incidência, utilize locais de
residência. Dados de 2020 do Espírito Santo não estão disponíveis neste
sistema pois são oriundos do Sistema de Informação e-SUS VS, em uso pelo
estado desde janeiro de 2020. Dados de 2008 atualizados em 26/03/2010.
Dados de 2009 atualizados em 29/07/2011. Dados de 2010 e 2011
atualizados em 09/04/2018. Dados de 2012 e 2013 atualizados em
21/08/2014. Dados de 2014 a 2016 atualizados em 09/04/2018. Dados de
2017 atualizados em 15/01/2019. Dados de 2018 e 2019 atualizados em
10/02/2020. Dados de 2020 atualizados em 11/05/2021, dados sujeitos à
revisão. 2007 a 2010, 2012 a 2015, 2017, 2019 e 2020: Não houve casos
confirmados. 2011, 2016 e 2018: Apenas casos importados.

\*Dados disponibilizados no TABNET em maio/2021. Veja a versão do Tab
para Windows (TABWIN) \| \|Coqueluche \|COQUELUCHE - Casos confirmados
Notificados no Sistema de Informação de Agravos de Notificação - Brasil
\|Fonte: Ministério da Saúde/SVS - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007). Para cálculo da incidência utilize locais de residência.
Dados de 2007 a 2017 atualizados em 01/07/2019. Dados de 2018
atualizados em 08/02/2023, realizada uma validação dos dados. Dados de
2019 atualizados em 08/03/2023, realizada uma validação dos dados. Dados
de 2020 atualizados em 08/02/2023, realizada uma validação dos dados.
Dados de 2021 atualizados em 08/02/2023, dados sujeitos à revisão. Dados
de 2022 atualizados em 08/02/2023, dados sujeitos à revisão. Foram
confirmados casos de Coqueluche no Estado do Espírito Santo (e-SUS VS)
nos anos de 2020 (6) e 2022 (2).

\*Dados disponibilizados no TABNET em fevereiro de 2023. Veja a versão
do Tab para Windows (TABWIN) \| \|Dermatose Relacionada ao Trabalho
\|Investigação de Dermatoses ocupacionais - Notificações registradas no
Sinan Net - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho O campo
“CNAE  Ativ. Econ.” considera os códigos referentes as tabelas CNAE 1.0.
Dados a partir 2020 do Espírito Santo não estão disponíveis neste
sistema, pois são oriundos do Sistema de Informação e-SUS VS, em uso
pelo estado desde janeiro de 2020. Dados de 2006 a 2017 revisados e
atualizados em 15/08/2022. Dados de 2018 revisados e atualizados em
22/08/2022. Dados de 2019 atualizados em junho de 2023. Dados de 2020
atualizados em junho de 2023, sujeitos à revisão. Dados de 2021
revisados e atualizados em agosto de 2023, sujeitos à revisão. Dados de
2022 revisados e atualizados em julho de 2023, sujeitos à revisão. Dados
de 2023 atualizados em janeiro de 2024, sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Dengue até 2013 \|DENGUE -
  Notificações registradas no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Incluídas notificações de indivíduos residentes no Brasil,
independente de sua confirmação, exceto os descartados, pois em
situações de epidemia nem sempre é possível confirmar todos os casos.
Para tabular os óbitos por dengue até 2012, deve-se considerar apenas os
casos graves (DCC, FHD, SCD, DSA, DG) em que a evolução seja “óbito pelo
agravo notificado” com critério de confirmação laboratorial e
clínico-epidemiológico. A partir de 2013, deve-se incluir, além dos
casos graves, aqueles com classificação final dengue. Períodos
Disponíveis ou período - Correspondem aos anos de notificação dos casos.
Para cálculo da incidência utilize locais de residência. Dados de 2007
atualizados em 30/08/2009. Dados de 2008 atualizados em 17/03/2011.
Dados de 2009 atualizados em 23/06/2011. Dados de 2010 atualizados em
18/06/2011. Dados de 2011 atualizados em 11/01/2012. Dados de 2012
atualizados em 25/07/2013. Dados de 2013 atualizados em 10/07/2014. Data
da publicação dos dados 04/02/2019. Veja a versão do Tab para Windows
(TABWIN) \| \|Dengue de 2014 em diante \|DENGUE - Notificações
registradas no Sistema de Informação de Agravos de Notificação - Brasil
\|Fonte: Ministério da Saúde/SVSA - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Para os casos prováveis foram incluídas todas notificações,
exceto casos descartados. As bases de dados de dengue aqui disponíveis
compõem um banco único a partir de 2014, podendo haver pequenas
divergências com os dados disponibilizados pelo CGARB (Coordenação Geral
de Vigilância de Arboviroses - CGARB) em sua série histórica, que para
tal, realiza análise ano a ano, com a base congelada para cada ano
analisado. Para tabular os casos graves (classificação final igual a
dengue com complicações, febre hemorrágica da dengue, síndrome do choque
da dengue, dengue com sinais de alarme e dengue grave) é necessário
considerar também o critério de confirmação (laboratorial e
clínico-epidemiológico). A partir de 2020 o estado do Espírito Santo
passou a utilizar sistema o e-SUS Vigilância em Saúde. Portanto, para os
casos de Arbovirose urbanas do Espírito Santo foram considerados apenas
os dados disponibilizados pelo Sinan online (dengue e chikungunya) e
Sinan Net (zika). Períodos Disponíveis ou período - Correspondem aos
anos de notificação dos casos e semana epidemiológica, em cada período
pode apresentar notificações com data de notificação do ano anterior
(semana epidemiológica 52 ou 53) e posterior (semana epidemiológica 01).
Para cálculo da incidência recomenda-se utilizar locais de residência.
Dados de 2014 atualizados em 13/07/2015. Dados de 2015 atualizados em
27/09/2016. Dados de 2016 atualizados em 06/07/2017. Dados de 2017
atualizados em 18/07/2018. Dados de 2018 atualizados em 01/10/2019.
Dados de 2019 atualizados em 10/07/2020. Dados de 2020 atualizados em
23/07/2021. Dados de 2021 atualizados em 12/07/2022. Dados de 2022
atualizados em 18/07/2023. Dados de 2023 atualizados em 30/01/2024 às 14
horas, sujeitos a revisão. Dados de 2024 atualizados em 14/02/2024 às 12
horas, sujeitos a revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Difteria \|DIFTERIA - Casos
  confirmados Notificados no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007). Para cálculo da incidência utilize locais de residência.
No ano de 2019 foram confirmados 3 casos de difteria, nos seguintes
estados: RO (1), PE (1) e MG (1). No ano de 2020 foram confirmados 2
casos de difteria, nos seguintes estados: CE (1) e RS (1). No ano de
2022 foram confirmados 2 casos de difteria nos seguintes estados: SP (1)
e GO (1). Não foram registrados casos de difteria no Estado do Espírito
Santo no período de 2020 a 2022. Dados de 2007 a 2017 atualizados em
01/07/2019. Dados de 2018 atualizados em 08/02/2023. Dados de 2019
atualizados em 08/03/2023. Dados de 2020 atualizados em 08/02/2023 Dados
de 2021 atualizados em 08/02/2023, dados sujeitos à revisão. Dados de
2022 atualizados em 08/02/2023, dados sujeitos à revisão.

\*Dados disponibilizados no TABNET em fevereiro/2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Doença de Chagas Aguda \|DOENÇA DE CHAGAS
AGUDA - Casos confirmados Notificados no Sistema de Informação de
Agravos de Notificação - Brasil \|Fonte: Ministério da Saúde/SVS -
Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso). Dados a partir de 2020 do Espírito Santo não
estão disponíveis neste sistema pois são oriundos do Sistema de
Informação e-SUS VS, em uso pelo estado desde janeiro de 2020. Dados de
2007 atualizados em 08/01/2013. Dados de 2008 a 2010 atualizados em
13/06/2013. Dados de 2011 e 2012 atualizados em 01/08/2013. Dados de
2013 atualizados em 16/01/2015. Dados de 2014 e 2015 atualizados em
03/04/2018. Dados de 2016 atualizados em 04/09/2019 e correção em 2021
de forma de infecção de casos pertencentes a UF AC. Dados de 2017
atualizados em 01/11/2018. Dados de 2018 atualizados em 04/09/2019 e
correção em 2021 de variável data de início de sintomas de caso
pertencente a UF PA. Dados de 2019 atualizados em 29/09/2020 e correção
em 2023 dos casos pertencentes a UF AC. Dados de 2020 atualizados em
29/06/2021, dados sujeito à revisão. Dados de 2021 atualizados em
01/12/2022, dados sujeito à revisão

\*Dados disponibilizados no TABNET em junho de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Doenças Exantemáticas \|SARAMPO e
RUBÉOLA - Casos confirmados Notificados no Sistema de Informação de
Agravos de Notificação - Brasil \|Fonte: Ministério da Saúde/SVS -
Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos; Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007); Para cálculo da incidência selecione sarampo ou rubéola
em Classificação final e analise por local de residência; Banco de
dados, reportam dados não qualificados, ou seja, não foram retiradas
inconsistências e nem duplicidades; Dados a partir 2020 do Espírito
Santo não estão disponíveis neste sistema, pois são oriundos do Sistema
de Informação e-SUS VS, em uso pelo estado desde janeiro de 2020; O
último de Rubéola confirmado no Brasil, ocorreu no ano de 2008; Do
número de casos confirmados de sarampo no Brasil, segue: - Em 2015 
foram confirmados 214 casos, sendo: CE (211), SP (02) e RR (01); - Nos
anos de 2016 e 2017, o Brasil não confirmou casos de sarampo; - No ano
de 2018  foram confirmados 9.325 casos, sendo: AM (8.791), RR (361), PA
(83), RS (47), RJ (20), PE (4), SE (4), BA (3), SP (9), RO (2) e DF (1);
Os genótipos identificados foram o D8 e 1B3; - Em 2019  foram
confirmados 20.901 casos, sendo: SP (17.816), PR (1.071), RJ (463), PA
(405), PE (344), SC (297), MG (143), RS (100), BA (80), PB (66), AL
(35), CE (19), GO (12), DF (11), RN (9), MA (8), SE (6), AM (4), ES (4),
PI (3), MS (2), AP (2) e RR (1). O genótipo identificado foi o D8. No
ano de 2020  foram confirmados 8.100 casos, sendo: PA (4.906), RJ
(1.358), SP (879), PR (377), AP (296), SC (107), PE (38), RS (37), MG
(22), MA (17), MS (10), DF (8), SE (8), AM (7), BA (7), CE (7), RO (6),
GO (5), AL (3), MT (1), TO (1). O genótipo identificado foi o D8; - Em
2021  foram confirmados 676 casos, sendo: AP (534), PA (116), AL (11),
SP (9), RJ (3) e CE (3); O genótipo identificado foi o D8. - No ano de
2022  foram confirmados 41 casos, sendo: AP (30), SP (8), PA (1), RJ
(2); O genótipo identificado foi o D8; - No ano de2022, o último caso
confirmado de sarampo ocorreu em 05/06/2022, segundo data de início do
exantema. Dados de 2007 a 2022 revisados e atualizados em 10/02/2023,
sujeitos à revisão.

\*Dados disponibilizados no TABNET em 02/2023. Veja a versão do Tab para
Windows (TABWIN) \| \|Esquistossomose \|ESQUISTOSSOMOSE - Casos
confirmados notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007). 3. Dados referentes à vigilância passiva em áreas não
endêmicas. Ver também dados da busca ativa de casos enviados ao Programa
de Controle de Esquistossomose/SVS/MS no site
<http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sinannet/pce/cnv/pce.def>
Dados a partir 2020 do Espírito Santo não estão disponíveis neste
sistema, pois são oriundos do Sistema de Informação e-SUS VS, em uso
pelo estado desde janeiro de 2020. Dados de 2007 e 2008 atualizados em
02/07/2012. Dados de 2009 atualizados em 27/12/2012. Dados de 2010
atualizados em 04/11/2013. Dados de 2011 atualizados em 29/08/2014.
Dados de 2012 atualizados em 01/06/2015. Dados de 2013 atualizados em
18/12/2017. Dados de 2014 atualizados em 17/12/2018. Dados de 2015
atualizados em 26/11/2018. Dados de 2016 atualizados em 16/09/2019.
Dados de 2017 atualizados em 24/04/2020. Dados de 2018 e 2019
atualizados em 22/08/2022. Dados de 2020 a 2023 atualizados em
26/05/2023, dados sujeitos à revisão.

\*Dados disponibilizados no TABNET em Junho 2023. Veja a versão do Tab
para Windows (TABWIN) \| \|Febre de Chikungunya \|Febre de Chikungunya -
Notificações registradas no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVSA - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Para os casos prováveis foram incluídas todas notificações,
exceto casos descartados. As bases de dados de dengue aqui disponíveis
compõem um banco único a partir de 2014, podendo haver pequenas
divergências com os dados disponibilizados pelo CGARB (Coordenação Geral
de Vigilância de Arboviroses - CGARB) em sua série histórica, que para
tal, realiza análise ano a ano, com a base congelada para cada ano
analisado. Para tabular os casos graves (classificação final igual a
dengue com complicações, febre hemorrágica da dengue, síndrome do choque
da dengue, dengue com sinais de alarme e dengue grave) é necessário
considerar também o critério de confirmação (laboratorial e
clínico-epidemiológico). A partir de 2020 o estado do Espírito Santo
passou a utilizar sistema o e-SUS Vigilância em Saúde. Portanto, para os
casos de Arbovirose urbanas do Espírito Santo foram considerados apenas
os dados disponibilizados pelo Sinan online (dengue e chikungunya) e
Sinan Net (zika). Períodos Disponíveis ou período - Correspondem aos
anos de notificação dos casos e semana epidemiológica, em cada período
pode apresentar notificações com data de notificação do ano anterior
(semana epidemiológica 52 ou 53) e posterior (semana epidemiológica 01).
Para cálculo da incidência, recomenda-se utilizar locais de residência.
Dados de 2014 atualizados em 13/07/2015. Dados de 2015 atualizados em
27/09/2016. Dados de 2016 atualizados em 06/07/2017. Dados de 2017
atualizados em 18/07/2018. Dados de 2018 atualizados em 01/10/2019.
Dados de 2019 atualizados em 10/07/2020. Dados de 2020 atualizados em
23/07/2021. Dados de 2021 atualizados em 12/07/2022. Dados de 2022
atualizados em 18/07/2023. Dados de 2023 atualizados em 31/01/2024 às 14
horas, sujeitos a revisão. Dados de 2024 atualizados em 14/02/2024 às 12
horas, sujeitos a revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Febre Maculosa \|FEBRE MACULOSA -
  Casos confirmados notificados no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Excluídos casos não residentes no Brasil. Períodos Disponíveis ou
período - Correspondem aos anos de notificação dos casos. Para tabular
dados epidemiológicos de um determinado ano selecione na linha a
variável de interesse, na Coluna Ano dos 1°s sintomas; em Períodos
Disponíveis assinale o ano inicial da série e todos os posteriores até o
ano atual (p/ incluir casos notificados com atraso) e em Seleções
Disponíveis assinale os anos dos 1ºs sintomas (ex: nº de casos com
início de sintomas 2007: selecione na linha UF de fonte de infecção, na
Coluna Ano de 1ºs sintomas, em Períodos disponíveis 2007 até o ano atual
e em Seleções assinale Ano de 1ºs sintomas 2007). Dados de 2020 do
Espírito Santo não estão disponíveis neste sistema, pois são oriundos do
Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 a 2017 atualizados em 15/01/2019. Dados de 2018 a
2021 atualizados em 29/05/2023. Dados de 2022 atualizados em 29/05/2023,
dados sujeitos à revisão.

\*Dados disponibilizados no TABNET em junho de 2023 Veja a versão do Tab
para Windows (TABWIN) \| \|Febre Tifóide \|FEBRE TIFÓIDE - Casos
confirmados Notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVSA - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Excluídos casos não residentes no Brasil. Períodos Disponíveis ou
período - Correspondem aos anos de notificação dos casos. Para tabular
dados epidemiológicos de um determinado ano selecione na linha a
variável de interesse, na Coluna Ano dos 1ºs sintomas; em Períodos
Disponíveis assinale o ano inicial da série e todos os posteriores até o
ano atual (p/ incluir casos notificados com atraso) e em Seleções
Disponíveis assinale os anos dos 1ºs sintomas (ex: nº de casos com
início de sintomas 2007: selecione na linha UF de residência, na Coluna
Ano de 1ºs sintomas, em Períodos disponíveis 2007 até o ano atual e em
Seleções assinale Ano de 1ºs sintomas 2007). Dados de 2020 a 2023 do
Espírito Santo não estão disponíveis neste sistema pois são oriundos do
Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 atualizados em 26/02/2015. Dados de 2008 atualizados
em 26/03/2010. Dados de 2009 atualizados em 29/07/2011. Dados de 2010
atualizados em 01/11/2013. Dados de 2011 atualizados em 28/08/2014.
Dados de 2012 atualizados em 28/05/2015. Dados de 2013 atualizados em
26/08/2017. Dados de 2014 atualizados em 15/12/2018. Dados de 2015
atualizados em 24/11/2018. Dados de 2016 atualizados em 13/09/2019.
Dados de 2017 atualizados em 18/04/2020. Dados de 2018 atualizados em
21/08/2022. Dados de 2019 atualizados em 13/06/2023. Dados de 2020
atualizados em 07/06/2023, dados sujeitos à revisão. Dados de 2021
atualizados em 14/09/2023, dados sujeitos à revisão. Dados de 2022
atualizados em 10/09/2023, dados sujeitos à revisão. Dados de 2023
atualizados em 05/09/2023, dados sujeitos à revisão.

- Dados disponibilizados no TABNET em janeiro/2024. Veja a versão do Tab
  para Windows (TABWIN) \| \|Hanseníase \|Acompanhamento dos dados de
  Hanseníase - BRASIL \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: O campo “Períodos Disponíveis” corresponde aos anos de
notificação dos casos, sugerimos selecionar pelo menos um ano antes e um
depois do ano de diagnóstico do objeto da tabulação. Para tabular os
dados de hanseníase acessar o Caderno de Análise, pelo link
<https://www.gov.br/saude/pt-br/centrais-de-conteudo/publicacoes/svsa/hanseniase/roteiro-para-uso-do-sinan-net-hanseniase-e-manual-para-tabulacao-dos-indicadores-de-hanseniase/view>
Os bancos de dados disponíveis possuem dados atualizados conforme itens
abaixo, por isso podem apresentar diferenças em relação aos boletins
epidemiológicos e outras publicações de hanseníase, com dados fechados.
Essas diferenças ocorrem porque os municípios digitam e atualizam fichas
de casos de hanseníase após o prazo para “fechamento” das bases de
dados. A partir de 2020, os dados do estado do Espirito Santo são
oriundos do e-SUS Vigilância em Saúde. As bases de dados de 2001 a 2017,
foram atualizadas em 01/2021. As bases de dados de 2018, foram
atualizadas em 01/2023. As bases de dados de 2019, foram atualizadas em
02/2023. As bases de dados de 2020 a 2023, foram atualizadas em 07/2023
e estão sujeitos a revisão.

\*Dados disponibilizados no TABNET em agosto/2023. Veja a versão do Tab
para Windows (TABWIN) \| \|Hantavirose \|HANTAVIROSES - Casos
confirmados notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de fonte de infecção, na Coluna Ano de 1ºs sintomas, em
Períodos disponíveis 2007 até o ano atual e em Seleções assinale Ano de
1ºs sintomas 2007). Dados de 2020 do Espírito Santo não estão
disponíveis neste sistema, pois são oriundos do Sistema de Informação
e-SUS VS, em uso pelo estado desde janeiro de 2020. Dados de 2007 a 2017
atualizados em 07/07/2021. Dados de 2018 e 2022 atualizados em
10/03/2023, dados sujeitos à revisão.

\*Dados disponibilizados no TABNET em março de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Hepatite \|HEPATITES VIRAIS - Casos
confirmados Notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou Período - Correspondem aos anos de
notificação dos casos. Para tabular os dados de Hepatites Virais acesse
o Caderno de Análise, pelo link:
<http://portalsinan.saude.gov.br/doencas-e-agravos> Dados de 2020 e 2021
do Espírito Santo não estão disponíveis neste sistema pois são oriundos
do Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 a 2021 atualizados em 31/03/2021, dados sujeitos à
revisão.

\*Dados disponibilizados no TABNET em dezembro/2021 Veja a versão do Tab
para Windows (TABWIN) \| \|AIDS \|AIDS \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|Influenza Pandêmica
\|INFLUENZA PANDÊMICA - Sinan - Brasil \|Fonte: Ministério da
Saúde/SVS - Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: As duplicidades e inconsistências do banco de dados foram
corrigidas. Os dados são referentes aos anos de 2009 e 2010, período da
pandemia pelo vírus da influenza pandêmica A (H1N1) 2009. A base de
dados do ano de 2009 foi encerrada em 02/08/2010 e a base de dados de
2010 foi encerrada em 21/01/2011. Definição de caso utilizada durante as
fases da pandemia: Fase de contenção: 19/04/2009 a 18/07/2009 (semana
epidemiológica 16 a 28 de 2009); Sindrome Gripal (SG) - Indivíduo com
doença respiratória aguda caracterizada por febre, tosse e/ou dor de
garganta; Fase de mitigação 2009: 19/07/2009 a 02/01/2010 (semana
epidemiológica 29 a 52 de 2009); Sindrome Respiratoria Aguda Grave
(SRAG) - Indivíduo com doença respiratória aguda caracterizada por
febre, tosse e dispnéia; Fase de mitigação 2010: A partir de 03/01/2010
(semana epidemiológica 01 de 2010); Sindrome Respiratoria Aguda Grave
com Hospitalização (SRAGHOSP) - Indivíduo com doença respiratória aguda
caracterizada por febre, tosse e dispnéia e que requer hospitalização;
Declaração de fase pós-pandêmica pela OMS: 10/08/2010. Veja a versão do
Tab para Windows (TABWIN) \| \|Intoxicação Exógena \|INTOXICAÇÃO
EXÓGENA - Notificações registradas no Sinan Net - Brasil \|Fonte:
Ministério da Saúde/SVSA - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. Para casos de exposição ao trabalho considerar
apenas a categoria “Sim”. CAT - Comunicação de acidente de trabalho.
Dados a partir 2020 do Espírito Santo não estão disponíveis neste
sistema, pois são oriundos do Sistema de Informação e-SUS VS, em uso
pelo estado desde janeiro de 2020. Dados de 2007 a 2017 revisados e
atualizados em 15/08/2022. Dados de 2018 revisados e atualizados em
22/08/2022. Dados de 2019 revisados e atualizados junho de 2023. Dados
de 2020 revisados e atualizados em junho de 2023, sujeitos à revisão.
Dados de 2021 revisados e atualizados em agosto de 2023, sujeitos à
revisão. Dados de 2022 revisados e atualizados em julho de 2023,
sujeitos à revisão. Dados de 2023 atualizados em janeiro de 2024,
sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Leishmaniose Visceral \|LEISHMANIOSE
  VISCERAL - Casos confirmados Notificados no Sistema de Informação de
  Agravos de Notificação - Brasil \|Fonte: Ministério da Saúde/SVSA -
  Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Excluídas duplicidades de dados de 2007 a 2022.
Dados validados pela Grupo Técnico de Leishmanioses/CGZV/DEDT/SVSA/MS.
Dados a partir de 2020 referentes ao estado do Espírito Santo são
oriundos do Sistema de Informação e-SUS VS, em uso pelo estado desde
janeiro de 2020. A partir de 2020 foi realizada a incorporação pela CGZV
dos dados do e-SUS VE ES aos dados do banco nacional. Dados de 2007 a
2021 atualizados em 14/09/2022. Dados de 2022 atualizados em 28/08/2023.
Veja a versão do Tab para Windows (TABWIN) \| \|Leishmaniose Tegumentar
Americana \|LEISHMANIOSE TEGUMENTAR AMERICANA - Casos confirmados
Notificados no Sistema de Informação de Agravos de Notificação - Brasil
\|Fonte: Ministério da Saúde/SVSA - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Excluídas duplicidades de dados de 2007 a 2022.
Dados validados pelo Grupo Técnico de Leishmanioses/CGZV/DEDT/SVSA/MS.
Dados a partir de 2020 referentes ao estado do Espírito Santo são
oriundos do Sistema de Informação e-SUS VS, em uso pelo estado desde
janeiro de 2020. A partir de 2020 foi realizada a incorporação pela CGZV
os dados do e-SUS VE ES aos dados do banco nacional. Dados de 2007 a
2020 atualizados em 14/09/2022. Dados de 2021 atualizados em 23/09/2022.
Dados de 2022 atualizados em 22/09/2023.

\*Dados disponibilizados no TABNET em outubro de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Leptospirose \|LEPTOSPIROSE - Casos
confirmados notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007). Dados de 2020 do Espírito Santo não estão disponíveis
neste sistema, pois são oriundos do Sistema de Informação e-SUS VS, em
uso pelo estado desde janeiro de 2020. Dados de 2007 a 2022 atualizados
e revisados em 03/03/2023, dados sujeitos a revisão.

\*Dados disponibilizados no TABNET em março de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Ler/Dort \|INVESTIGAÇÃO DE LER/DORT -
Notificações registradas no Sinan Net - Brasil \|Fonte: Ministério da
Saúde/SVSA - Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho. O
campo “CNAE ? Ativ. Econ.” considera os códigos referentes as tabelas
CNAE 1.0. Dados a partir 2020 do Espírito Santo não estão disponíveis
neste sistema, pois são oriundos do Sistema de Informação e-SUS VS, em
uso pelo estado desde janeiro de 2020. Dados de 2006 a 2017 revisados e
atualizados em 15/08/2022. Dados de 2018 revisados e atualizados em
22/08/2022. Dados de 2019 atualizados em junho de 2023. Dados de 2020
atualizados em junho de 2023, sujeitos à revisão. Dados de 2021
revisados e atualizados em agosto de 2023, sujeitos à revisão. Dados de
2022 revisados e atualizados em julho de 2023, sujeitos à revisão. Dados
de 2023 atualizados em janeiro de 2024, sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Malária \|MALÁRIA - Casos
  confirmados Notificados no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Para tabular dados epidemiológicos de um determinado ano
selecione na linha a variável de interesse, na Coluna Ano dos 1ºs
sintomas; em Períodos Disponíveis assinale o ano inicial da série e
todos os posteriores até o ano atual (p/ incluir casos notificados com
atraso) e em Seleções Disponíveis assinale os anos dos 1ºs sintomas (ex:
nº de casos com início de sintomas 2007: selecione na linha UF de
residência, na Coluna Ano de 1ºs sintomas, em Períodos disponíveis 2007
até o ano atual e em Seleções assinale Ano de 1ºs sintomas 2007). Dados
a partir 2020 do Espírito Santo não estão disponíveis neste sistema pois
são oriundos do Sistema de Informação e-SUS VS, em uso pelo estado desde
janeiro de 2020. Dados de 2007 atualizados em 08/01/2013. Dados de 2008
a 2010 atualizados em 13/06/2013. Dados de 2011 e 2012 atualizados em
01/08/2013. Dados de 2013 atualizados em 16/01/2015. Dados de 2014 e
2015 atualizados em 03/04/2018. Dados de 2016 atualizados em 04/09/2019.
Dados de 2017 atualizados em 01/11/2018. Dados de 2018 atualizados em
22/08/2022. Dados de 2019 a 2022 atualizados em 10/01/2023, dados
sujeitos à revisão.

\*Dados disponibilizados no TABNET em fevereiro de 2023. Veja a versão
do Tab para Windows (TABWIN) \| \|Meningite \|MENINGITE - Casos
confirmados Notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007). Para cálculo da incidência utilize locais de residência.
Dados de 2007 e 2008 atualizados em 02/07/2012. Dados de 2009
atualizados em 06/09/2020. Dados de 2010 atualizados em 04/11/2013.
Dados de 2011 atualizados em 29/08/2014. Dados de 2012 atualizados em
01/06/2015. Dados de 2013 atualizados em 18/12/2017. Dados de 2014
atualizados em 17/12/2018. Dados de 2015 atualizados em 26/11/2018.
Dados de 2016 atualizado em 16/09/2019. Dados de 2017 atualizado em
24/04/2020. Dados de 2018 e 2019 atualizados em 22/08/2022. Dados de
2020 atualizado em 06/03/2023, dados sujeitos à revisão. Dados de 2021
atualizados em 04/04/2023, dados sujeitos à revisão. Dados de 2022
atualizados em 30/05/2023, dados sujeitos à revisão. Dados de 2023
atualizados em 26/05/2023, dados sujeitos à revisão. Dados a partir de
2020 do Espírito Santo não estão disponíveis neste sistema, pois são
oriundos do Sistema de Informação e-SUS VS, em uso pelo estado desde
janeiro de 2020.

\*Dados disponibilizados no TABNET em junho de 2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Paralisia Flácida Aguda \|PARALISIA
FLÁCIDA AGUDA - Notificações registradas no Sistema de Informação de
Agravos de Notificação - Brasil \|Fonte: Ministério da Saúde/SVS -
Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Excluídos casos não residentes no Brasil. Períodos Disponíveis ou
período - Correspondem aos anos de notificação dos casos. Para tabular
dados epidemiológicos de um determinado ano selecione na linha a
variável de interesse, na Coluna Ano dos 1ºs sintomas; em Períodos
Disponíveis assinale o ano inicial da série e todos os posteriores até o
ano atual (p/ incluir casos notificados com atraso) e em Seleções
Disponíveis assinale os anos dos 1ºs sintomas (ex: nº de casos com
início de sintomas 2007); selecione na linha UF de residência, na Coluna
Ano de 1ºs sintomas, em Períodos disponíveis 2007 até o ano atual e em
Seleções assinale Ano de 1ºs sintomas 2007). Dados de 2020 e 2021 do
Espírito Santo não estão disponíveis neste sistema pois são oriundos do
Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 atualizados em 20/03/2012. Dados de 2008 atualizados
em 09/04/2012. Dados de 2009 atualizados em 20/03/2012. Dados de 2010
atualizados em 18/12/2012. Dados de 2011 atualizados em 13/06/2013.
Dados de 2012 atualizados em 18/03/2014. Dados de 2013 a 2014
atualizados em 01/02/2018. Dados de 2015 a 2017 atualizados em
11/01/2019. Dados de 2018 atualizados em 28/01/2020. Dados de 2019
atualizados em 05/03/2021. Dados de 2020 a 2021 atualizados em
23/01/2020, dados sujeitos à revisão. \* Dados disponibilizados no
TABNET em junho/2021. Veja a versão do Tab para Windows (TABWIN) \|
\|PAIR Relacionado ao Trabalho \|Investigação de PAIR Relacionada ao
Trabalho - Notificações registradas no Sinan Net - Brasil \|Fonte:
Ministério da Saúde/SVS - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho. O
campo “CNAE ? Ativ. Econ.” considera os códigos referentes as tabelas
CNAE 1.0. Dados a partir 2020 do Espírito Santo não estão disponíveis
neste sistema, pois são oriundos do Sistema de Informação e-SUS VS, em
uso pelo estado desde janeiro de 2020. Dados de 2006 a 2017 revisados e
atualizados em 15/08/2022. Dados de 2018 revisados e atualizados em
22/08/2022. Dados de 2019 atualizados em junho de 2023. Dados de 2020
atualizados em junho de 2023, sujeitos à revisão. Dados de 2021
revisados e atualizados em agosto de 2023, sujeitos à revisão. Dados de
2022 revisados e atualizados em julho de 2023, sujeitos à revisão. Dados
de 2023 atualizados em janeiro de 2024, sujeitos à revisão.

\*Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
do Tab para Windows (TABWIN) \| \|Peste \|PESTE - Casos confirmados
Notificados no Sistema de Informação de Agravos de Notificação - Brasil
\|Fonte: Ministério da Saúde/SVS - Sistema de Informação de Agravos de
Notificação - Sinan Net

Notas: Excluídos casos não residentes no Brasil. Períodos Disponíveis ou
período - Correspondem aos anos de notificação dos casos. Para tabular
dados epidemiológicos de um determinado ano selecione na linha a
variável de interesse, na Coluna Ano dos 1ºs sintomas; em Períodos
Disponíveis assinale o ano inicial da série e todos os posteriores até o
ano atual (p/ incluir casos notificados com atraso) e em Seleções
Disponíveis assinale os anos dos 1ºs sintomas (ex: nº de casos com
início de sintomas 2007: selecione na linha UF de fonte de infecção, na
Coluna Ano de 1ºs sintomas, em Períodos disponíveis 2007 até o ano atual
e em Seleções assinale Ano de 1ºs sintomas 2007). Dados de 2020 do
Espírito Santo não estão disponíveis neste sistema, pois são oriundos do
Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 a 2017 atualizados em 18/04/2020. Dados de 2018 e
2019 atualizados em 29/07/2021, dados sujeitos à revisão. No ano de 2020
não houve registro de notificação de casos suspeitos para Peste. Veja a
versão do Tab para Windows (TABWIN) \| \|Pneumoconiose Relacionada ao
Trabalho \|Investigação de Pneumoconiose relacionada ao trabalho -
Notificações registradas no Sinan Net - Brasil \|Fonte: Ministério da
Saúde/SVS - Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho. O
campo “CNAE ? Ativ. Econ.” considera os códigos referentes as tabelas
CNAE 1.0. Dados a partir 2020 do Espírito Santo não estão disponíveis
neste sistema, pois são oriundos do Sistema de Informação e-SUS VS, em
uso pelo estado desde janeiro de 2020. Dados de 2006 a 2017 revisados e
atualizados em 15/08/2022. Dados de 2018 revisados e atualizados em
22/08/2022. Dados de 2019 atualizados em junho de 2023. Dados de 2020
atualizados em junho de 2023, sujeitos à revisão. Dados de 2021
revisados e atualizados em agosto de 2023, sujeitos à revisão. Dados de
2022 revisados e atualizados em julho de 2023, sujeitos à revisão. Dados
de 2023 atualizados em janeiro de 2024, sujeitos à revisão.

\*Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
do Tab para Windows (TABWIN) \| \|Raiva Humana \|RAIVA HUMANA - Casos
confirmados notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis - Correspondem aos anos de notificação dos
casos. Dados validados pela Grupo Técnico da Raiva/CGZV/DEDT/SVSA/MS.
Dados a partir 2020 referentes ao estado do Espírito Santo não estão
disponíveis neste sistema, pois são oriundos do Sistema de Informação
e-SUS VS, em uso pelo estado desde janeiro de 2020. Dados de 2007 a 2012
atualizados em 09/02/2018. Dados de 2013, 2014, 2016 e 2017 atualizados
em 24/01/2019. Dados de 2015 foi revisado e atualizados em 03/10/2019.
Dados de 2018 e 2019 atualizados em 28/01/2020. Dados de 2020 e 2021
atualizados em 14/07/2022.

- Dados disponibilizados no TABNET em março de 2023. Veja a versão do
  Tab para Windows (TABWIN) \| \|Sífilis Adquirida \|Sífilis Adquirida -
  Notificações registradas no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou Período - Correspondem aos anos de
notificação dos casos. Para tabular os dados de Sífilis acesse o Caderno
de Análise, pelo link:
<http://portalsinan.saude.gov.br/doencas-e-agravos> Dados de 2020 e 2021
do Espírito Santo não estão disponíveis neste sistema pois são oriundos
do Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2010 a 2021 atualizados em 30/06/2021, dados sujeitos à
revisão.

\*Dados disponibilizados no TABNET em dezembro/2021 Veja a versão do Tab
para Windows (TABWIN) \| \|Sífilis Congênita \|SÍFILIS CONGÊNITA - Casos
confirmados notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou Período - Correspondem aos anos de
notificação dos casos. Para tabular os dados de Sífilis Congênita acesse
o Caderno de Análise, pelo link:
<http://portalsinan.saude.gov.br/doencas-e-agravos> Dados de 2020 e 2021
do Espírito Santo não estão disponíveis neste sistema pois são oriundos
do Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 a 2021 atualizados em 30/06/2021, dados sujeitos à
revisão.

\*Dados disponibilizados no TABNET em dezembro/2021 Veja a versão do Tab
para Windows (TABWIN) \| \|Sífilis em Gestante \|SÍFILIS EM GESTANTE -
Casos confirmados notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou Período - Correspondem aos anos de
notificação dos casos. Para tabular os dados de Sífilis Congênita acesse
o Caderno de Análise, pelo link:
<http://portalsinan.saude.gov.br/doencas-e-agravos> Dados de 2020 e 2021
do Espírito Santo não estão disponíveis neste sistema pois são oriundos
do Sistema de Informação e-SUS VS, em uso pelo estado desde janeiro de
2020. Dados de 2007 a 2021 atualizados em 30/06/2021, dados sujeitos à
revisão.

\*Dados disponibilizados no TABNET em dezembro/2021 Veja a versão do Tab
para Windows (TABWIN) \| \|Síndrome da Rubéola Congênita \|SÍNDROME DA
RUBÉOLA CONGÊNITA - Casos confirmados OU COMPATÍVEIS notificados -
Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de Informação de
Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano do diagnóstico; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos do
diagnóstico (ex: nº de casos 2007:selecione na linha UF de residência,
na Coluna Ano do diagnóstico, em Períodos disponíveis 2007 até o ano
atual e em Seleções assinale Ano do diagnóstico de 2007). Para cálculo
da incidência utilize locais de residência. Para tabulação acessar a
ficha de investigação disponível em Formax - C:.FXF (saude.gov.br) e o
dicionário de dados, em Microsoft Word - DIC_DADOS_NET - Sindrome
Rubeola Congenita.doc (saude.gov.br); Banco de dados, reportam dados não
qualificados, ou seja, não foram retiradas inconsistências e nem
duplicidades; Dados a partir 2020 do Espírito Santo não estão
disponíveis neste sistema, pois são oriundos do Sistema de Informação
e-SUS VS, em uso pelo estado desde janeiro de 2020. O último caso de
Síndrome da Rubéola Congênita (SRC) autóctone, ocorreu no ano de 2009;
Entre os anos 2010 a 2022, o Brasil não confirmou casos de Síndrome da
Rubéola Congênita, tampouco óbitos pela doença; Dados de 2007 a 2022
atualizados em 17/01/2023, sujeitos à revisão.

\*Dados disponibilizados no TABNET em 02/2023. Veja a versão do Tab para
Windows (TABWIN) \| \|Tétano Acidental \|TÉTANO ACIDENTAL - Casos
confirmados Notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para tabular dados epidemiológicos de um
determinado ano selecione na linha a variável de interesse, na Coluna
Ano dos 1ºs sintomas; em Períodos Disponíveis assinale o ano inicial da
série e todos os posteriores até o ano atual (p/ incluir casos
notificados com atraso) e em Seleções Disponíveis assinale os anos dos
1ºs sintomas (ex: nº de casos com início de sintomas 2007: selecione na
linha UF de residência, na Coluna Ano de 1ºs sintomas, em Períodos
disponíveis 2007 até o ano atual e em Seleções assinale Ano de 1ºs
sintomas 2007). Para cálculo da incidência utilize locais de residência.
Dados de 2007 a 2017 atualizados em 01/07/2020, realizada uma validação
dos dados. Dados de 2018 atualizados em 08/02/2023, realizada uma
validação dos dados. Dados de 2019 atualizados em 08/02/2023, realizada
uma validação dos dados. Dados de 2020 atualizados em 08/02/2023,
realizada uma validação dos dados. Dados de 2021 atualizados em
08/02/2023, dados sujeitos à revisão. Dados de 2022 atualizados em
08/02/2023, dados sujeitos à revisão. Foram confirmados casos de Tétano
Acidental no Estado do Espírito Santo (e-SUS VS) nos anos de 2020 (1),
2021 (1) e 2022 (5).

\*Dados disponibilizados no TABNET em fevereiro de 2023. Veja a versão
do Tab para Windows (TABWIN) \| \|Tétano Neonatal \|TÉTANO NEONATAL -
Casos confirmados Notificados no Sistema de Informação de Agravos de
Notificação - Brasil \|Fonte: Ministério da Saúde/SVS - Sistema de
Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Para cálculo da incidência utilize locais de
residência. Dados de 2007 a 2017 atualizados em 01/07/2020, realizada
uma validação dos dados. Dados de 2018 atualizados em 08/02/2023,
realizada uma validação dos dados. Dados de 2019 atualizados em
08/02/2023, realizada uma validação dos dados. Dados de 2020 atualizados
em 08/02/2023, realizada uma validação dos dados. Dados de 2021
atualizados em 08/02/2023, dados sujeitos à revisão. Dados de 2022
atualizados em 08/02/2023, dados sujeitos à revisão. Não foram
registrados casos Tétano Neonatal no Estado do Espírito Santo no período
de 2020 a 2022.

\*Dados disponibilizados no TABNET em fevereiro/2023. Veja a versão do
Tab para Windows (TABWIN) \| \|Transtorno Mental Relacionado ao Trabalho
\|INVESTIGAÇÃO DE TRANSTORNOS MENTAIS RELACIONADOS AO TRABALHO -
Notificações registradas no Sinan Net - Brasil \|Fonte: Ministério da
Saúde/SVSA - Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Períodos Disponíveis / Período - Correspondem aos anos de
notificação dos casos. CAT - Comunicação de acidente de trabalho. O
campo “CNAE ? Ativ. Econ.” considera os códigos referentes as tabelas
CNAE 1.0. Dados a partir 2020 do Espírito Santo não estão disponíveis
neste sistema, pois são oriundos do Sistema de Informação e-SUS VS, em
uso pelo estado desde janeiro de 2020. Dados de 2006 a 2017 revisados e
atualizados em 15/08/2022. Dados de 2018 revisados e atualizados em
22/08/2022. Dados de 2019 atualizados em junho de 2023. Dados de 2020
atualizados em junho de 2023, sujeitos à revisão. Dados de 2021
revisados e atualizados em agosto de 2023, sujeitos à revisão. Dados de
2022 revisados e atualizados em julho de 2023, sujeitos à revisão. Dados
de 2023 atualizados em janeiro de 2024, sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Violência interpessoal /
  autoprovocada \|VIOLÊNCIA INTERPESSOAL/AUTOPROVOCADA - Brasil \|Fonte:
  Ministério da Saúde/SVS - Sistema de Informação de Agravos de
  Notificação - Sinan Net

Notas: Períodos Disponíveis ou período - Correspondem aos anos de
notificação dos casos. Dados de 2019 referentes ao estado do Espírito
Santo são oriundos do Sinan e Sistema de Informação e-SUS VS, em uso
pelo estado desde dezembro de 2019. Dados de 2009 a 2014 atualizados em
15/05/2018. Dados de 2015 e 2016 atualizados em 08/11/2018. Dados de
2017 atualizados em 17/04/2019. Dados de 2018 atualizados em 24/06/2020.
Dados de 2019 atualizados em 18/03/2021. Dados de 2020 atualizados em
25/07/2022. Dados de 2021 atualizados em 19/10/2023. Dados de 2022
atualizados em 27/07/2023, dados sujeitos à revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Zika Vírus \|Zika Vírus -
  Notificações registradas no Sistema de Informação de Agravos de
  Notificação - Brasil \|Fonte: Ministério da Saúde/SVSA - Sistema de
  Informação de Agravos de Notificação - Sinan Net

Notas: Incluídos todos os registros notificados. Períodos Disponíveis ou
período - Correspondem aos anos de notificação dos casos. Casos
notificados no Sinan Online. A partir de 2020 o estado do Espírito Santo
passou a utilizar sistema o e-SUS Vigilância em Saúde. Portanto, para os
casos de ARBOVIROSES urbanas do Espírito Santo foram considerados apenas
os dados disponibilizados pelo Sinan online (dengue e chikungunya) e
Sinan Net (zika). Dados de 2016 atualizados em 08/05/2018. Dados de 2017
atualizados em 29/06/2018. Dados de 2018 atualizados em 19/09/2019.
Dados de 2019 atualizados em 02/07/2020. Dados de 2020 atualizados em
27/01/2022. Dados de 2021 atualizados em 10/05/2023. Dados de 2022
atualizados em 13/07/2023. Dados de 2023 atualizados em 31/01/2023,
sujeitos a revisão. Dados de 2024 atualizados em 02/02/2024, sujeitos a
revisão.

- Dados disponibilizados no TABNET em fevereiro de 2024. Veja a versão
  do Tab para Windows (TABWIN) \| \|Nascimento \|Nascidos vivos - Brasil
  \|Fonte: MS/SVS/CGIAE - Sistema de Informações sobre Nascidos Vivos -
  SINASC

Nota: Em 2011, houve uma mudança no conteúdo da Declaração de Nascidos
Vivos, com maior detalhamento das informações coletadas. Para este ano,
foram utilizados simultaneamente os dois formulários. Para mais detalhes
sobre as mudanças ocorridas e os seus efeitos, veja o documento
“Consolidação do Sistema de Informações sobre Nascidos Vivos - 2011”.

- A categorização da “Adequação quantitativa de pré-natal” mostrada na
  variável “Adeq quant pré-natal” considera o início do pré-natal no
  primeiro trimestre e um mínimo de seis consultas de pré-natal , sendo
  gravada em campo chamado Kotelchuck no arquivo disponível para
  download, calculado a partir dos campos “33  Número de consultas
  pré-natal” (Mesprenat) e “34  Mês de gestação em que iniciou o
  pré-natal” (Consprenat). Maiores informações no documento “Saúde
  Brasil 2017: uma análise da situação de saúde e os desafios para o
  alcance dos Objetivos de Desenvolvimento Sustentável”, página 24.

  Veja a versão do Tab para Windows (TABWIN) \| \|Óbito \|Mortalidade -
  Brasil \|Fonte: MS/SVS/CGIAE - Sistema de Informações sobre
  Mortalidade - SIM

Nota:

Em 2011, houve uma mudança no conteúdo da Declaração de Óbito, com maior
detalhamento das informações coletadas. Para este ano, foram utilizados
simultaneamente os dois formulários. Para mais detalhes sobre as
mudanças ocorridas e os seus efeitos, veja o documento “Sistema de
Informações sobre Mortalidade - SIM. Consolidação da base de dados de
2011”.

No dia 13/06/2019, os arquivos do SIM referentes ao ano de notificação
2017 foram atualizados, com alteração das causas básicas de 2 registros
e exclusão de 1 registro.

No dia 01/04/2020, os arquivos do SIM referentes ao ano de notificação
2019 foram atualizados, com alteração das causas básicas de 4 registros
e exclusão de 1 registro.

     Veja a versão do Tab para Windows (TABWIN)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

\|Nascimento (dados preliminares) \|Nascidos vivos - Brasil - Dados
preliminares \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde -
RJ \| \|Óbito (dados preliminares) \|Mortalidade - Brasil - Dados
preliminares \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde -
RJ \| \|População (estudo de estimativas) \|População Residente - Estudo
de Estimativas Populacionais por Município, Idade e Sexo 2000-2021 -
Brasil \|Fonte: 2000 a 2021  Estimativas preliminares elaboradas pelo
Ministério da Saúde/SVSA/DAENT/CGIAE

     Veja a versão do Tab para Windows (TABWIN)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

\|População (TCU) \|População Residente - Estimativas para o TCU -
Brasil \|Fonte:IBGE - Estimativas de população

Notas: Para alguns anos, os dados aqui apresentados não são comparáveis
com as projeções intercensitárias segundo faixa etária e sexo, devido a
diferenças metodológicas para estimar e projetar os contingentes
populacionais. Veja a nota técnica para detalhes e situações especiais.
Devido a decisões judiciais, as populações apresentadas para alguns
municípios não é a estimada pelo IBGE. Em decorrência desta situação, os
totais apresentados para Unidades da Federação e para o Brasil podem
também não corresponder ao estimado pelo IBGE. Veja também a nota
técnica.

     Veja a versão do Tab para Windows (TABWIN)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

\|Imunização Doses Aplicadas \|Imunizações - Doses Aplicadas - Brasil
\|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ \|
\|Imunização Cobertura \|Imunizações - Cobertura - Brasil \|Fonte:
Ministério da Saúde/Secretaria Estadual de Saúde - RJ \| \|Produção
ambulatorial \|Produção Ambulatorial do SUS - Brasil - por local de
residência \|Fonte: Ministério da Saúde - Sistema de Informações
Ambulatoriais do SUS (SIA/SUS)

Notas: Situação da base de dados nacional em 29/04/2016. Dados de
janeiro de 2015 até março de 2016 sujeitos a retificação. A informação
de município de residência só está disponível para os registros feitos
através do Boletim de Produção Ambulatorial Individualizado (BPA-I) ou
pelas Autorizações de Procedimentos de Alta Complexidade (APAC). A
partir do processamento de junho de 2012, houve mudança na classificação
da natureza e esfera dos estabelecimentos. Com isso, temos que: Até maio
de 2012 estas informações estão disponíveis como “Natureza” e “Esfera
Administrativa”. De junho de 2012 a outubro de 2015, estão disponíveis
tanto como “Natureza” e “Esfera Administrativa”, como “Natureza
Jurídica” e “Esfera Jurídica”. A partir de novembro de 2015, estão
disponíveis como “Natureza Jurídica” e “Esfera Jurídica”. Veja a versão
do Tab para Windows (TABWIN) \| \|Produção hospitalar \|Procedimentos
hospitalares do SUS - por local de residência - Brasil \|Fonte:
Ministério da Saúde - Sistema de Informações Hospitalares do SUS
(SIH/SUS)

Notas: Dados referentes aos últimos seis meses, sujeitos a atualização.
A partir do processamento de junho de 2012, houve mudança na
classificação da natureza e esfera dos estabelecimentos. Com isso, temos
que: Até maio de 2012 estas informações estão disponíveis como
“Natureza” e “Esfera Administrativa”. De junho de 2012 a outubro de
2015, estão disponíveis tanto como “Natureza” e “Esfera Administrativa”,
como “Natureza Jurídica” e “Esfera Jurídica”. A partir de novembro de
2015, estão disponíveis como “Natureza Jurídica” e “Esfera Jurídica”.

     Veja a versão do Tab para Windows (TABWIN)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

\|Morbidade hospitalar a partir de 2008 \|Morbidade Hospitalar do SUS -
por local de residência - Brasil \|Fonte: Ministério da Saúde - Sistema
de Informações Hospitalares do SUS (SIH/SUS)

Notas: Dados referentes aos últimos seis meses, sujeitos a atualização.

     Veja a versão do Tab para Windows (TABWIN)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

\|Tuberculose \|TUBERCULOSE - Casos confirmados notificados no Sistema
de Informação de Agravos de Notificação - Brasil \|Fonte: Ministério da
Saúde/SVSA - Sistema de Informação de Agravos de Notificação - Sinan Net

Notas: Excluídos os registros encerrados com mudança de diagnóstico.
Períodos disponíveis - Correspondem aos anos de diagnóstico dos casos
(até 2022). Para tabular dados epidemiológicos de um determinado ano
selecione na linha a variável de interesse, e na coluna a variável “Ano
do diagnóstico”; em “Períodos Disponíveis” assinale o ano inicial da
série e todos os posteriores até o ano atual (para incluir casos
notificados com atraso) e em “Seleções Disponíveis” assinale os anos do
diagnóstico: - Ex. para tabular o nº de casos diagnosticados em 2007
segundo UF de residência selecione: na linha a “UF de residência” na
Coluna a variável “Ano do diagnóstico” em Períodos disponíveis 2007 até
o ano atual em Seleções o “Ano do diagnóstico” de 2007. Para cálculo da
incidência selecione o local de residência e as seguintes categorias da
variável “Tipo de entrada”: caso novo, não sabe e pós óbito. A variável
“Beneficiário de programa de transferência de renda do governo” não
contém dados do Estado de São Paulo (SP). Quanto a variável “Terapia
antirretroviral durante o tratamento da TB”, os dados do estado de SP
foram inseridos a partir do segundo semestre de 2016. Não é possível
calcular indicadores relacionados aos contatos de tuberculose. Em 2014,
foram incluídas as seguintes variáveis no Sinan Net (Tuberculose):
populações especiais (população privada de liberdade, população em
situação de rua, profissional de saúde e imigrante), doenças e agravos
associados (uso de drogas ilícitas e tabagismo), beneficiário de
programa de transferência de renda do governo, terapia antirretroviral
durante o tratamento para a TB, teste molecular rápido TB (TRM-TB) e
teste de sensibilidade; as categorias: pós-óbito na variável tipo de
entrada; e as categorias: mudança de esquema, falência e abandono
primário na variável situação de encerramento. Por conta disso, não há
informações para essas variáveis em anos anteriores. A variável
“institucionalizado” foi descontinuada em 2015. Portanto, para análise
referente à população privada de liberdade após esse período, utilizar a
variável “PPL” (população privada de liberdade). Para informações
detalhadas sobre o Sinan  Tuberculose e sobre as análises de indicadores
epidemiológicos e operacionais da tuberculose, acessar o link:
<http://portalsinan.saude.gov.br/tuberculose> . Em caso de dúvidas,
encaminhar e-mail para: <tuberculose@saude.gov.br> Dados de 2001 a 2018
estão finalizados. Dados de 2018 a 2022 atualizados em 09/2023, sujeitos
à revisão. Dados a partir de 2020 referentes ao estado do Espírito Santo
são oriundos do Sistema de Informação e-SUS VS, em uso pelo estado desde
janeiro de 2020. Dados referentes ao estado de São Paulo são oriundos do
Sistema de Controle de Pacientes com Tuberculose TBWEB. Dados
disponibilizados no TABNET em 11/2023, após homologação da Coordenação
Geral de Vigilância da Tuberculose, Micoses Endêmicas e Micobactérias
não Tuberculosas /CGTM/SVSA. Veja a versão do Tab para Windows (TABWIN)
\| \|Dengue RJ \|DENGUE - Casos notificados e residentes no Rio de
Janeiro a partir de 2000 \|Fonte: Ministério da Saúde/Secretaria
Estadual de Saúde - RJ \| \|População Pactuada RJ \|População estimada
residente - pactuada pela SES/RJ \|Fonte: Ministério da Saúde/Secretaria
Estadual de Saúde - RJ \| \|População Censo RJ \|População residente
segundo os censos (1991, 2000, 2010 e 2022) e contagens demográficas
(1996) \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ \|
\|População TCU RJ \|População residente - Dados para o Tribunal de
Contas da União - TCU \|Fonte: Ministério da Saúde/Secretaria Estadual
de Saúde - RJ \| \|SIM RJ \|Mortalidade Geral - RJ \|Fonte: Óbitos:
Sistema de Informações sobre Mortalidade - SIM: A partir de 2011:
Secretaria de Estado de Saúde - SES/RJ. Situação da base estadual em
19/02/2024.até 2010: Ministério da Saúde/Secretaria de Vigilância em
Saúde ­ MS/SVS. Situação da base nacional em 28/11/2023. Nota: Constam da
base de dados tanto os óbitos de residentes no estado do Rio de Janeiro
como óbitos de residentes em outras UF que faleceram no estado do Rio de
Janeiro. A partir de 2011, pode haver pequenas diferenças entre as
informações aqui apresentadas e as obtidas a partir da base nacional.
Isto se deve a retificações e inclusões na base estadual, efetuadas
posteriormente ao fechamento da base nacional. \| \|SIM Taxas RJ
\|Indicadores de Mortalidade - Taxas Brutas de Mortalidade e Taxas de
Mortalidade Específica - Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|SIM Taxas DCNT RJ
\|Indicadores de Mortalidade - Taxas de Mortalidade por Doenças Crônicas
Não Transmissíveis (DCNT) - Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|SIM MIF RJ \|Óbitos
maternos, maternos tardios e de mulheres em idade fértil - RJ \|Fonte:
Óbitos: Sistema de Informações sobre Mortalidade - SIM: A partir de
2011: Secretaria de Estado de Saúde - SES/RJ. Situação da base estadual
em 19/02/2024.até 2010: Ministério da Saúde/Secretaria de Vigilância em
Saúde ­ MS/SVS. Situação da base nacional em 28/11/2023. Nota: Constam da
base de dados tanto os óbitos de residentes no estado do Rio de Janeiro
como óbitos de residentes em outras UF que faleceram no estado do Rio de
Janeiro. A partir de 2011, pode haver pequenas diferenças entre as
informações aqui apresentadas e as obtidas a partir da base nacional.
Isto se deve a retificações e inclusões na base estadual, efetuadas
posteriormente ao fechamento da base nacional. \| \|SIM RM RJ
\|Indicadores de Mortalidade - Razão de Mortalidade Materna - Rio de
Janeiro \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ
\| \|SIM OI RJ \|Óbitos infantis - RJ \|Fonte: Óbitos: Sistema de
Informações sobre Mortalidade - SIM: A partir de 2011: Secretaria de
Estado de Saúde - SES/RJ. Situação da base estadual em 19/02/2024.até
2010: Ministério da Saúde/Secretaria de Vigilância em Saúde ­ MS/SVS.
Situação da base nacional em 28/11/2023. Nota: Constam da base de dados
tanto os óbitos de residentes no estado do Rio de Janeiro como óbitos de
residentes em outras UF que faleceram no estado do Rio de Janeiro. A
partir de 2011, pode haver pequenas diferenças entre as informações aqui
apresentadas e as obtidas a partir da base nacional. Isto se deve a
retificações e inclusões na base estadual, efetuadas posteriormente ao
fechamento da base nacional. \| \|SIM OF RJ \|Óbitos fetais - RJ
\|Fonte: Óbitos: Sistema de Informações sobre Mortalidade - SIM: A
partir de 2011: Secretaria de Estado de Saúde - SES/RJ. Situação da base
estadual em 19/02/2024.até 2010: Ministério da Saúde/Secretaria de
Vigilância em Saúde ­ MS/SVS. Situação da base nacional em 28/11/2023.
Nota: Constam da base de dados tanto os óbitos de residentes no estado
do Rio de Janeiro como óbitos de residentes em outras UF que faleceram
no estado do Rio de Janeiro. A partir de 2011, pode haver pequenas
diferenças entre as informações aqui apresentadas e as obtidas a partir
da base nacional. Isto se deve a retificações e inclusões na base
estadual, efetuadas posteriormente ao fechamento da base nacional. \|
\|SIM Taxas OI RJ \|Indicadores de Mortalidade - Taxas de Mortalidade
Infantil e Perinatal - Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|SIM Causas Externas RJ
\|Óbitos por causas externas - RJ \|Fonte: Óbitos: Sistema de
Informações sobre Mortalidade - SIM: A partir de 2011: Secretaria de
Estado de Saúde - SES/RJ. Situação da base estadual em 19/02/2024.até
2010: Ministério da Saúde/Secretaria de Vigilância em Saúde ­ MS/SVS.
Situação da base nacional em 28/11/2023. Nota: Constam da base de dados
tanto os óbitos de residentes no estado do Rio de Janeiro como óbitos de
residentes em outras UF que faleceram no estado do Rio de Janeiro. A
partir de 2011, pode haver pequenas diferenças entre as informações aqui
apresentadas e as obtidas a partir da base nacional. Isto se deve a
retificações e inclusões na base estadual, efetuadas posteriormente ao
fechamento da base nacional. \| \|SIM Taxas Causas Externas RJ
\|Indicadores de Mortalidade - Taxas de Mortalidade por causas
externas - Rio de Janeiro \|Fonte: Ministério da Saúde/Secretaria
Estadual de Saúde - RJ \| \|SINASC RJ \|Nascidos Vivos no Estado do Rio
de Janeiro \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde -
RJ \| \|SINASC RJ \|Nascidos Vivos no Estado do Rio de Janeiro \|Fonte:
Ministério da Saúde/Secretaria Estadual de Saúde - RJ \| \|SINASC Taxas
RJ \|Taxa Bruta de Natalidade \|Fonte: Ministério da Saúde/Secretaria
Estadual de Saúde - RJ \| \|Covid RJ \|COVID-19 no Rio de Janeiro
\|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ \|
\|Tuberculose RJ \|TUBERCULOSE - CASOS NOTIFICADOS - SINAN - Rio de
Janeiro \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ
\| \|Violências RJ \|VIOLÊNCIA INTERPESSOAL / AUTOPROVOCADA - Rio de
Janeiro \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ
\| \|Sífilis Congênita RJ \|SÍFILIS CONGÊNITA - Rio de Janeiro \|Fonte:
Ministério da Saúde/Secretaria Estadual de Saúde - RJ \| \|Sífilis
Gestante RJ \|SÍFILIS EM GESTANTE - Rio de Janeiro \|Fonte: Ministério
da Saúde/Secretaria Estadual de Saúde - RJ \| \|Chik RJ \|CHIKUNGUNYA -
Casos notificados e residentes no Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|Zika RJ \|ZIKA - Casos
notificados e residentes no Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|AIDS/HIV criança RJ \|Casos
notificados de AIDS (Pacientes menores de 13 anos) Rio de Janeiro - veja
Nota de Rodapé \|Fonte: Ministério da Saúde/Secretaria Estadual de
Saúde - RJ \| \|AIDS/HIV adulto RJ \|Casos notificados de AIDS
(Pacientes com 13 anos ou mais) - Rio de Janeiro - veja Nota de Rodapé
\|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ \|
\|AIDS/HIV gestante RJ \|Casos notificados de Gestante HIV+ - Rio de
Janeiro \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ
\| \|AIDS/HIV banco relacionado RJ \|Casos notificados de AIDS - Rio de
Janeiro - Base de dados relacionada (SINAN, SIM, SICLOM, SISCEL)
\|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ \| \|DART
acidente de trabalho RJ \|INVESTIGAÇÃO DE ACIDENTE DE TRABALHO¹ - Sinan
NET \|Fonte: Ministério da Saúde/Secretaria Estadual de Saúde - RJ \|
\|DART acidente com material biológico RJ \|INVESTIGAÇÃO DE ACIDENTE DE
TRABALHO COM EXP. MATERIAL BIOLÓGICO - Sinan NET \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|DART intoxicação exógena RJ
\|INVESTIGAÇÃO DE INTOXICAÇÃO EXÓGENA - Sinan NET \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|Hanseníase RJ \|Casos
notificados de Hanseníase - Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|Hepatites Virais RJ \|CASOS
NOTIFICADOS DE HEPATITES VIRAIS - Rio de Janeiro \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|SIVEP dados básicos RJ
\|SIVEP - Gripe - Notificações de Síndromes Respiratórias Agudas Graves
(SRAG) - Rio de Janeiro - Dados básicos \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|SIVEP dados completos RJ
\|SIVEP - Gripe - Notificações de Síndromes Respiratórias Agudas Graves
(SRAG) - Rio de Janeiro - Dados completos \|Fonte: Ministério da
Saúde/Secretaria Estadual de Saúde - RJ \| \|CNES dados básicos RJ
\|CNES - Módulo Básico - Fichas 01, 02 \|Fonte: Estabelecimentos de
Saúde: Cadastro Nacional de Estabelecimentos de Saúde Ministério da
Saúde ­ MS Situação da base em 15/02/2024. \|

## License

This package is available under the MIT License. See the LICENSE file
for more details.
