context("load")

test_that("load fails well", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  # resolve issue #6
  tdir <- tempdir()
  tfile <- file.path(tdir, basename(tempfile(fileext = ".rds")))
  file.create(tfile)
  expect_error(tryCatch(res <- readRDS(tfile), error  = function(e)
           stop("Error in data compilation.")),
           "Error in data compilation.")
  })