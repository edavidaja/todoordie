test_that("works if date in future", {
  expect_invisible(after_date("date in future", "3000-01-01"))
})

test_that("fails if date in past", {
  expect_error(after_date("date in past", "2020-03-12"))
})

test_that("warning if due today", {
  expect_warning(after_date("it's today", as.character(Sys.Date())))
})
