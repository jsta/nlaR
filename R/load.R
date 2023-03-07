

#' Load NLA data into current R session
#'
#' @return list
#' @export
#' @param year numeric choice of 2007 or 2012.
#' @param use_rappdirs logical write files to operating system data directories at the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @param source_folder optional custom file.path to data directory
#'
#' @examples \dontrun{
#' # nla_get(2012, use_rappdirs = TRUE)
#' dt <- nla_load(2012, use_rappdirs = TRUE)
#' }
nla_load <- function(year, use_rappdirs = FALSE, source_folder = NA){
  valid_year(year)

  if(!is.na(source_folder) & !use_rappdirs){
    res <- readRDS(file.path(source_folder, paste0("data_", year, ".rds")))
  }else{
    tryCatch(
      res <- readRDS(file.path(nla_path(), paste0("data_", year, ".rds"))),
        error = function(e){
stop("Data not found. Try specifing a source_folder or pull the data using nla_get.")})
  }

  if(length(names(res)) == 0){
    stop("Error in NLA data object. Object is 'empty'.")
  }

  res
}
