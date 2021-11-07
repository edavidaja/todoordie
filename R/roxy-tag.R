#' @title Roxygen tags for todoordie
#' @rdname roxy_tag_parse
#'
#' @param x a tag
#' @return something
#' @export
#'
#' @importFrom roxygen2 roxy_tag_parse
#' @importFrom stringr str_split str_extract
roxy_tag_parse.roxy_tag_todoordie <- function(x) {
  parsed <- str_split(x$raw, "\n")

  date_regex <- "[0-9]{4}-[0-9]{2}-[0-9]{2}"
  matched_date <- str_extract(parsed, date_regex)

  first_word_regex <- "^\\b[a-z_]+\\b"
  matched_first_word <- str_extract(parsed, first_word_regex)

  x$val <- list(
    # condition = condition,
    due_at = matched_date,
    note = matched_first_word
  )
  x
}

roclet_todoordie <- function() {
  roclet("todoordie")
}

roclet_process.roclet_todoordie <- function(x, blocks, env, base_path) {

}

roclet_output.roclet_todoordie <- function(x, results, base_path, ...) {

}
