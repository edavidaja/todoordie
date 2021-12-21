#' trigger error if after a certain date
#'
#' @param note explain yourself
#' @param due_at an ISO-8601 formatted date
#' @return the current date, invisibly
#'
#' @export
after_date <- function(due_at, note) {
  current_date <- Sys.Date()
  compare_date <- as.Date(due_at)

  is_after_date <-
    difftime(current_date, compare_date, units = "days") |>
    as.double() |>
    sign()

  if (is_after_date == 1) {
    stop(note, " was due on ", due_at)
  }

  if (is_after_date == 0) {
    warning(note, " is due today.")
  }

  invisible(current_date)
}
