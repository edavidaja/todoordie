test_that("works if date in future", {
  expect_invisible(after_date(3000, 1, 1))
})

test_that("fails if date in past", {
  expect_error(after_date(2020, 03, 13))
})
