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
