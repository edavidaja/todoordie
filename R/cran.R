#' Call crandb for info about package
#'
#' @importFrom httr GET content stop_for_status
#' @param package package name
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


#' check whether cran version is greater than stated
#'
#' @param note explain yourself
#' @param package package name
#' @param version version to compare
#'
#' @return the version number of the package on cran, invisibly
#'
#' @export
cran_version <- function(note, package, version) {

  package_info <- pkg_info(package)
  package_version <- pkg_version(package_info)

  if (package_version > version) {
    stop(note, "has exceeded version", version)
  }

  return(invisible(package_version))

}
