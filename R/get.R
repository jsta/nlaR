#' Download NLA data from USEPA
#'
#' @description Retrieves NLA flat files.
#'
#' @import rappdirs
#' @importFrom utils download.file
#' @export
#'
#' @param use_rappdirs logical write files to operating system data directories at the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @param year numeric choice of 2007 or 2012.
#'
#' @examples \donttest{
#' nla_get(2012)
#' }
nla_get <- function(year, use_rappdirs = FALSE){

  valid_year(year)

  local_path   <- file.path(tempdir())
  dir.create(local_path, showWarnings = FALSE)

  if(year == 2007){
    baseurl <- "https://www.epa.gov/sites/production/files/2013-09/"
    files   <- "nla2007_alldata.zip"

    invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
                                        file.path(local_path, x))))

    unzip(file.path(local_path, files), exdir = local_path)
  }

  if(year == 2012){
    baseurl <- "https://www.epa.gov/sites/production/files/2016-11/"
    files   <- c(
      "nla2012_algaltoxins_08192016.csv",
      "nla2012_atrazine_08192016.csv",
      "nla2012_bentcond_08232016.csv",
      "nla2012_wide_benthic_08232016.csv",
      "nla2012_bentmet.csv",
      "nla2012_benttaxa_wide_10272015.csv",
      "nla2012_chla_wide.csv")

    invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
                                        file.path(local_path, x))))

    baseurl <- "https://www.epa.gov/sites/production/files/2016-12/"
    files <- c(
      "nla2012_wide_phab_08232016_0.csv",
      "nla2012_wide_phabmet_10202016.csv",
      "nla2012_phytocnt_02122014.csv",
      "nla2012_phytotaxa_wide_10272015.csv",
      "nla2012_wide_profile_08232016.csv",
      "nla2012_secchi_08232016.csv",
      "nla2012_topsedhg_08192016.csv",
      "nla2012_wide_siteinfo_08232016.csv",
      "nla2012_waterchem_wide.csv",
      "nla2012_zoopcond_08192016.csv",
      "nla2012_zoopmets_08192016.csv",
      "nla2012_zooptaxa_wide_10272015.csv")

    invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
                                        file.path(local_path, x))))
  }

  invisible(nla_compile(year, use_rappdirs, local_path))
}
