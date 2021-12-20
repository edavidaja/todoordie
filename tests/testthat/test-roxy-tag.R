sample_text <- "
  #' Title
  #'
  #' @todoordie after_date 2021-01-21 do after rstudio conf 2021
  #' @todoordie after_date 3000-12-31 way in the future
  #' @todoordie issue_closed edavidaja/todoordie#1 shouldn't this be drew carey
  #' @todoordie pr_merged edavidaja/todoordie#3 hightower optimization
  #' @todoordie cran_version plumber 1.0.0 no 0.* in prod
  f <- function(x, y) {
    NULL
  }
"

test_that("tag parser works", {
  expect_s3_class(roxygen2::parse_text(sample_text)[[1]], "roxy_block")
})
