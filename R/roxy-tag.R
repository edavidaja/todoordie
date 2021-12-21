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
  raw_todo <- x$raw
  split_todo <- str_split(x$raw, "[:space:]")
  first_word <- split_todo[[1]][1]

  vals <- todo_condition(first_word, raw_todo, split_todo)
  x$val <- vals

  x
}

todoordie_roclet <- function() {
  roclet("todoordie")
}

roclet_process.roclet_todoordie <- function(x, blocks, env, base_path) {

}

roclet_output.roclet_todoordie <- function(x, results, base_path, ...) {

}

todo_condition <- function(condition, raw_todo, split_todo) {
  switch(condition,
    after_date   = parse_after_date(raw_todo, split_todo),
    issue_closed = parse_issue_closed(raw_todo, split_todo),
    pr_merged    = parse_pr_merged(raw_todo, split_todo),
    cran_version = parse_cran_version(raw_todo, split_todo)
  )
}

parse_after_date <- function(after_date_raw, after_date_split) {

  date_regex <- "[0-9]{4}-[0-9]{2}-[0-9]{2}"
  matched_date <- str_extract(after_date_raw, date_regex)

  todo_text <- extract_todo_text(3, after_date_split)

  list(
    matched_date = matched_date,
    todo_text = todo_text
  )
}

parse_issue_closed <- function(issue_closed_raw, issue_closed_split) {

  repo_spec <- extract_repo_spec(issue_closed_split[[1]][2])
  todo_text <- extract_todo_text(3, issue_closed_split)

  c(
    repo_spec,
    todo_text = todo_text
  )
}

parse_pr_merged <- function(pr_closed_raw, pr_closed_split) {

  repo_spec <- extract_repo_spec(pr_closed_split[[1]][2])
  names(repo_spec)[[3]] <- "pull_number"

  todo_text <- extract_todo_text(3, pr_closed_split)

  c(
    repo_spec,
    todo_text = todo_text
  )
}

parse_cran_version <- function(cran_version_raw, cran_version_split) {
  todo_text <- extract_todo_text(4, cran_version_split)

  list(
    package_name = cran_version_split[[1]][1],
    package_version = cran_version_split[[1]][2],
    todo_text = todo_text
  )
}

extract_todo_text <- function(start_word, split_text) {
  word_count <- length(split_text[[1]])

  # text is split by whitespace
  # start word is everything after keywords, which vary in length by todo
  todo_text <- paste(split_text[[1]][c(start_word:word_count)], collapse = " ")

  todo_text
}
