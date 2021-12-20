#' Call crandb for info about package
#'
#' @importFrom httr GET content stop_for_status
#' @param package package name
#'
pkg_info <- function(package) {
  query_url <- glue::glue("https://crandb.r-pkg.org/{package}")

  r <- GET(query_url)
  stop_for_status(r)

  content(r, "parsed")
}

pkg_version <- function(info) {
  info[["Version"]] |>
    as.numeric_version()
}

cran_version <- function(note, package, version) {

}
