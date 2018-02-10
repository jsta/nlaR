#' nla_get
#'
#' @export
#' @description Retrieves NLA flat files.
#' @import rappdirs
#' @importFrom utils download.file
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @param year numeric choice of 2007 or 2012.
#' @examples \dontrun{
#' nla_get()
#' }
nla_get <- function(year, dest_folder = NA){

  valid_year(year)

  if(year == 2007){

    dir.create(nla_path(), showWarnings = FALSE)

    baseurl <- "https://www.epa.gov/sites/production/files/2013-09/"
    files   <- "nla2007_alldata.zip"

    invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
                                        file.path(nla_path(), x))))

    unzip(file.path(nla_path(), files), exdir = nla_path())
  }

  if(year == 2012){

    dir.create(nla_path(), showWarnings = FALSE)

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
                                        file.path(nla_path(), x))))

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
                                        file.path(nla_path(), x))))
  }

}
