test_that("error on cran version greater than todo", {
  expect_error(cran_version("plumber", "0.4.0", "no 0.* in prod"))
})

test_that("cran version lte todo", {
  expect_invisible(cran_version("drake", "8.0.0", "breaking drake"))
})
