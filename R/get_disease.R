#' Get the list of events avaibles at the package
#'
#' @param disease string
#'
#' @return an object for use
#' @export
#'
#' @examples catoper::get_disease("Dengue")
#'
#'

get_disease <- function(disease){

  metadata <- utils::read.csv2("man/metadata_datasus.csv")
  base_meta <- dplyr::filter(metadata, disease == {{disease}})

  if (nrow(base_meta)==0){
    usethis::ui_stop(paste0("Não tem esta doença ainda"))
  }

  page <- xml2::read_html(base_meta$url_form)
  list_ob <- list(page, base_meta)

  list_ob
}
