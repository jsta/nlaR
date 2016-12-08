
#' nla_compile
#'
#' @param year numeric choice of 2007 or 2012.
#'
#' @return rds
#' @export
#'
#' @examples \dontrun{
#' nla_compile(2012)
#' }
nla_compile <- function(year){

  valid_year(year)

  res <- nla_ingest(year)

  outpath <- file.path(nla_path(), paste0("data_", year, ".rds"))

  saveRDS(res, outpath)
  message(paste0("NLA ", year, " compiled to ", outpath))
}

nla_ingest <- function(year){
  nla_files <- list.files(nla_path(), ".csv", full.names = TRUE,
                          include.dirs = TRUE)

  nla_files <- nla_files[grep(year, nla_files)]

  res <- lapply(nla_files, function(x) read.csv(x, stringsAsFactors = FALSE))

  res_names <- sapply(nla_files, function(x) strsplit(x, "_"))
  junk_name_pos <- sapply(res_names, function(x) unlist(grep("0", x)))

  good_name_pos <-  sapply(seq_along(res_names), function(x)
                      !(seq_along(unlist(res_names[x])) %in% unlist(junk_name_pos[x],
                      use.names = FALSE)))

  res_names <- sapply(seq_along(res_names), function(x)
                unlist(res_names[x])[unlist(good_name_pos[x])])

  # res_names <- sapply(res_names, function(x) x[2:(length(x) - 1)])
  res_names <- sapply(res_names, function(x) paste(x, collapse = "_"))
  res_names <- sapply(res_names, function(x) gsub(".csv", "", x))
  names(res) <- res_names

  res
}
