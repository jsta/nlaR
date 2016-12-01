
#' nla_compile
#'
#' @param version optional version id
#'
#' @return rds
#' @export
#'
#' @examples \dontrun{
#' nla_compile()
#' }
nla_compile <- function(version = "2007"){

  res <- nla_ingest()

  outpath <- file.path(nla_path(), paste0("data_", version, ".rds"))

  saveRDS(res, outpath)
  message(paste0("NLA compiled to ", outpath))
}

nla_ingest <- function(){
  nla_files <- list.files(nla_path(), ".csv", full.names = TRUE,
                          include.dirs = TRUE)

  res <- lapply(nla_files, function(x) read.csv(x, stringsAsFactors = FALSE))

  res_names <- sapply(nla_files, function(x) strsplit(x, "_"))
  res_names <- sapply(res_names, function(x) x[2:(length(x) - 1)])
  res_names <- sapply(res_names, function(x) paste(x, collapse = "_"))
  names(res) <- res_names

  res
}
