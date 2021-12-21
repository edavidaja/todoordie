#' trigger error if an issue is closed
#'
#' @param note explain yourself
#' @param repo a github repository, in remotes shorthand
#'
#' @export
issue_closed <- function(repo, note) {
  params <- extract_repo_spec(repo)

  gh_response <-
    gh::gh(
      endpoint = "/repos/{owner}/{repo}/issues/{issue_number}",
      .params = params
    )

  issue_state <- gh_response$state

  if (issue_state == "closed") {
    stop(note, " has been resolved")
  }

  invisible(issue_state)
}

#' trigger error if a PR is merged
#'
#' @param note explain yourself
#' @param repo a github repository, in remotes shorthand
#'
#' @export
pr_merged <- function(repo, note) {
  params <- extract_repo_spec(repo)
  names(params)[[3]] <- "pull_number"

  gh_response <-
    gh::gh(
      endpoint = "/repos/{owner}/{repo}/pulls/{pull_number}",
      .params = params
    )

  issue_state <- gh_response$state

  if (issue_state == "closed") {
    stop(note, " has been merged")
  }

  invisible(issue_state)
}

extract_repo_spec <- function(repo) {
  repository <- remotes::parse_repo_spec(repo)
  params <- list(
    owner        = repository$username,
    repo         = repository$repo,
    issue_number = repository$pull
  )
  params
}
