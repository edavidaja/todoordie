
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Todo Or Die

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/todoordie)](https://CRAN.R-project.org/package=todoordie)
<!-- badges: end -->

Write TODOs in Code That Ensure You Actually Do Them

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("edavidaja/todoordie")
```

## Example

``` r
todoordie::after_date(2020, 01, 01)
#> Error in todoordie::after_date(2020, 1, 1): is_after_date == 1 is not TRUE
```

## Prior art:

[Ruby](https://github.com/searls/todo_or_die)  
[Rust](https://github.com/davidpdrsn/todo-or-die)  
[Python](https://github.com/achedeuzot/py-todo-or-die)  
[Elixir](https://hex.pm/packages/credo_todo_or_die)  
[Typescript](https://github.com/ngnijland/typescript-todo-or-die-plugin)
