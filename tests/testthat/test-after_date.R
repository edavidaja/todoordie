test_that("works if date in future", {
  expect_invisible(after_date("3000-01-01", "date in future"))
})

test_that("fails if date in past", {
  expect_error(after_date("2020-03-12", "date in past"))
})

test_that("warning if due today", {
  expect_warning(after_date(as.character(Sys.Date()), "it's today"))
})
