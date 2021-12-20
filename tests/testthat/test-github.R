test_that("succeeds if issue is still open", {
  expect_invisible(issue_closed("first issue", "edavidaja/todoordie#1"))
})

test_that("fails if issue is closed", {
  expect_error(
    issue_closed(
      "Bob Barker called.",
      "edavidaja/todoordie#2"
      )
    )
})

test_that("succeds if PR is stil open", {
  expect_invisible(
    pr_merged("delete code", "edavidaja/todoordie#3")
  )
})

test_that("fails if PR is closed", {
  expect_error(
    pr_merged("dtplyr support for lead/lag", "tidyverse/dtplyr#277")
  )
})
