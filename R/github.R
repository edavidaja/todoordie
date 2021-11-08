#' trigger error if an issue is closed
#'
#' @param note explain yourself
#' @param repo a github repository, in remotes shorthand
issue_closed <- function(note, repo) {

  repository <- remotes::parse_repo_spec(repo)
  params <- list(
    owner        = repository$username,
    repo         = repository$repo,
    issue_number = repository$pull
    )

  gh::gh(
    endpoint = "/repos/{owner}/{repo}/issues/{issue_number}",
    .params = params
    )

  stop
}

#' error if a pull request is merged
#'
#' param
pr_merged <- function(note, repo) {
  repository <- remotes::parse_repo_spec(repo)
  params <- list(
    owner = repository$username,
    repo = repository$repo,
    pull_number = repository$pull
  )

  gh::gh(
    endpoint = "/repos/{owner}/{repo}/pulls/{pull_number}"
  )

}
