sample_text <- "
  #' Title
  #'
  #' @todoordie after_date 2021-01-21 do after rstudio conf 2021
  #' @todoordie after_date 3000-12-31 way in the future
  f <- function(x, y) {
    NULL
  }
"

test_that("tag parser works", {
  expect_s3_class(roxygen2::parse_text(sample_text)[[1]], "roxy_block")
})
