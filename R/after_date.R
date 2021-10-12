#' trigger error if after a certain date
#'
#' @param year year
#' @param month month
#' @param day day
#' @return the current date, invisibly
#'
#' @export
after_date <- function(year, month, day) {

  current_date <- Sys.Date()
  compare_date <- ISOdate(year, month, day) |> as.Date()

  is_after_date <-
    difftime(compare_date, current_date, units = "days") |>
    as.double() |>
    sign()

  stopifnot(is_after_date == 1)

  invisible(current_date)
}

