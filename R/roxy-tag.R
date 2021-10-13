#' @title Roxygen tags for todoordie
#' @rdname roxy_tag_parse
#'
#' @param x a tag
#' @return something
#' @export
#'
#' @importFrom roxygen2 roxy_tag_parse
roxy_tag_parse.roxy_tag_todoordie <- function(x) {
  parsed <- strsplit(x$raw, "\n")

  date_regex <- "[0-9]{4}-[0-9]{2}-[0-9]{2}"
  matched_date <- regexpr(date_regex, parsed)
  due_at <- regmatches(parsed, matched_date)

  first_word <- "^\\b[a-z_]+\\b"
  matched_first_word <- regexpr(first_word, parsed)
  condition <- regmatches(parsed, matched_first_word)

  x$val <- list(
    condition = condition,
    due_at = due_at,
    note = parsed
  )
  x
}
