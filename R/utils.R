
nla_path <- function() file.path(rappdirs::user_data_dir(), "nlaR")

get_if_not_exists <- function(url, destfile){
  if(!file.exists(destfile)){
    download.file(url, destfile)
  }else{
    message(paste0("A local copy of ", url, " already exists on disk"))
  }
}

valid_year <- function(year){
  if(!(year %in% c(2007, 2012))){
    stop("nlaR only serves the 2007 and 2012 data")
  }
}
