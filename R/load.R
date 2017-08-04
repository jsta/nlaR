

#' nla_load
#'
#' @return list
#' @export
#' @param year numeric choice of 2007 or 2012.
#'
#' @examples \dontrun{
#' dt <- nla_load(2012)
#' }
nla_load <- function(year){
  valid_year(year)

  readRDS(file.path(nla_path(), paste0("data_", year, ".rds")))
}
