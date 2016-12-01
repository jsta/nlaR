

#' nla_load
#'
#' @return list
#' @export
#'
#' @examples \dontrun{
#' dt <- nla_load()
#' }
nla_load <- function(){
  readRDS(paste0(nla_path(), "data_2007.rds"))
}
