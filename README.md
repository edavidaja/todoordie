
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Todo Or Die

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/todoordie)](https://CRAN.R-project.org/package=todoordie)
[![R-CMD-check](https://github.com/edavidaja/todoordie/workflows/R-CMD-check/badge.svg)](https://github.com/edavidaja/todoordie/actions)

<!-- badges: end -->

Write TODOs in Code That Ensure You Actually Do Them

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("edavidaja/todoordie")
```

## Usage

Use the functions directly:

``` r
todoordie::after_date("fix after conf 2021", "2021-01-21")
#> Error in todoordie::after_date("fix after conf 2021", "2021-01-21"): fix after conf 2021 was due on 2021-01-21
```

``` r
todoordie::issue_closed("rewrite once dtplyr supports across()", "tidyverse/dtplyr#154")
#> Error: 'issue_closed' is not an exported object from 'namespace:todoordie'
```

``` r
todoordie::cran_version("can't use in production before 1.0 :eyeroll:", "plumber", "1.0.0")
#> Error: 'cran_version' is not an exported object from 'namespace:todoordie'
```

If you’d prefer for them to live in your function documentation, you can
also use them as roxgyen tags:

``` r
#' sketchy function 
#'
#' @todoordie after_date 2012-12-21 if we're not all dead make this less sketchy
sketchy <- function() {}
```

## Prior art:

[Ruby](https://github.com/searls/todo_or_die)  
[Rust](https://github.com/davidpdrsn/todo-or-die)  
[Python](https://github.com/achedeuzot/py-todo-or-die)  
[Elixir](https://hex.pm/packages/credo_todo_or_die)  
[Typescript](https://github.com/ngnijland/typescript-todo-or-die-plugin)
