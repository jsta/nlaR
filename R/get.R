#' nla_get
#'
#' @export
#' @description Retrieves NLA flat files.
#' @import rappdirs
#' @importFrom utils download.file
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @examples \dontrun{
#' nla_get()
#' }
nla_get <- function(dest_folder = NA){

  baseurl <- "https://www.epa.gov/sites/production/files/2013-09/"
  files   <- "nla2007_alldata.zip"

  dir.create(nla_path(), showWarnings = FALSE)

  invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
                                                        paste0(nla_path(), x))))

  unzip(paste0(nla_path(), files), exdir = nla_path())

}
