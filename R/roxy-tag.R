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
  x$val <- c(todo_type = first_word, vals)

  x
}

#' roclet for todoordie tags
#'
#' @importFrom roxygen2 roclet roclet roclet_process roclet_output
#' @export
todoordie_roclet <- function() {
  roclet("todoordie")
}

#' @importFrom roxygen2 block_get_tags
#' @export
roclet_process.roclet_todoordie <- function(x, blocks, env, base_path) {
  results <- list()

  for (block in blocks) {
    tags <- block_get_tags(block, "todoordie")

    for (tag_idx in seq_along(tags)) {
      results[[tag_idx]] <- tags[[tag_idx]]$val
    }
  }

  results
}

#' @export
roclet_output.roclet_todoordie <- function(x, results, base_path, ...) {
  for (idx in seq_along(results)) {
    res <- results[[idx]]
    switch(
      res$todo_type,
      after_date = after_date(res$matched_date, res$todo_text),
      issue_closed = issue_closed(res$repo, res$todo_text),
      pr_merged = pr_merged(res$repo, res$todo_text),
      cran_version = cran_version(res$package_name, res$package_version, res$todo_text)
    )
  }
  invisible(NULL)
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

  repo <- issue_closed_split[[1]][2]
  repo_spec <- extract_repo_spec(repo)
  todo_text <- extract_todo_text(3, issue_closed_split)

  c(
    repo = repo,
    repo_spec,
    todo_text = todo_text
  )
}

parse_pr_merged <- function(pr_closed_raw, pr_closed_split) {

  repo <- pr_closed_split[[1]][2]
  repo_spec <- extract_repo_spec(repo)
  names(repo_spec)[[3]] <- "pull_number"

  todo_text <- extract_todo_text(3, pr_closed_split)

  c(
    repo = repo,
    repo_spec,
    todo_text = todo_text
  )
}

parse_cran_version <- function(cran_version_raw, cran_version_split) {
  todo_text <- extract_todo_text(4, cran_version_split)

  list(
    package_name = cran_version_split[[1]][2],
    package_version = cran_version_split[[1]][3],
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
