context("load")

test_that("load fails well", {
  skip_on_cran()
  skip_on_ci()

  # resolve issue #6
  tdir <- tempdir()
  tfile <- file.path(tdir, basename(tempfile(fileext = ".rds")))
  file.create(tfile)
  expect_error(tryCatch(res <- readRDS(tfile), error  = function(e)
           stop("Error in data compilation.")),
           "Error in data compilation.")
  })

test_that("data objects are correct dimensions", {
  skip_on_cran()
  skip_on_ci()

  nla <- nla_load(2012, source_folder = nla_get(2012))
  # print(class(nla))
  # print(names(nla))
  testthat::expect_true("chla_wide" %in% names(nla))
})
