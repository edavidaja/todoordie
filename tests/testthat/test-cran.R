test_that("error on cran version greater than todo", {
  expect_error(cran_version("no 0.* in prod", "plumber", "0.4.0"))
})

test_that("cran version lte todo", {
  expect_invisible(cran_version("breaking drake", "drake", "8.0.0"))
})
