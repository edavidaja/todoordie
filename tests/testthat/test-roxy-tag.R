sample_text <- "
  #' Title
  #'
  #' @todoordie after_date 2021-01-21 do after rstudio conf 2021
  #' @todoordie after_date 3000-12-31 way in the future
  #' @md
  f <- function(x, y) {
    # ...
  }
"

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
