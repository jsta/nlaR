
#' Compile NLA data for on-disk storage
#'
#' @param year numeric choice of 2007 or 2012.
#' @param local_path folder path to raw downloads from `nla_get`
#' @param use_rappdirs logical write files to operating system data directories at the location returned by \code{\link[rappdirs]{user_data_dir}}.
#'
#' @return rds
#'
nla_compile <- function(year, use_rappdirs, local_path){

  valid_year(year)

  if(use_rappdirs){
    local_path <- nla_path()
    dir.create(local_path, showWarnings = FALSE)
  }
  res     <- nla_ingest(year, local_path)

  if(use_rappdirs){
    outpath <- file.path(nla_path(), paste0("data_", year, ".rds"))
  }else{
    outpath <- file.path(local_path, paste0("data_", year, ".rds"))
  }

  saveRDS(res, outpath, compress = "xz")
  message(paste0("NLA ", year, " compiled to ", outpath))


  return(dirname(outpath))
}

nla_ingest <- function(year, local_path){
  nla_files <- list.files(local_path, ".csv", full.names = TRUE,
                          include.dirs = TRUE)

  nla_files <- nla_files[grep(year, nla_files)]

  # options(scipen = 999)
  # options("digits" = 15)
  res <- lapply(nla_files, function(x) read.csv(x, stringsAsFactors = FALSE))
  # if(year == 2012){
  #   res[[16]]$RCHCODE <- suppressWarnings(
  #     trimws(format(as.numeric(res[[16]]$RCHCODE), scientific = FALSE)))
  # }

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
