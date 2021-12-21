test_that("succeeds if issue is still open", {
  expect_invisible(issue_closed("edavidaja/todoordie#1", "first issue"))
})

test_that("fails if issue is closed", {
  expect_error(
    issue_closed(
      "edavidaja/todoordie#2",
      "Bob Barker called."
      )
    )
})

test_that("succeds if PR is stil open", {
  expect_invisible(
    pr_merged("edavidaja/todoordie#3", "delete code")
  )
})

test_that("fails if PR is closed", {
  expect_error(
    pr_merged("tidyverse/dtplyr#277", "dtplyr support for lead/lag")
  )
})
