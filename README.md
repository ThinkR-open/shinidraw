
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinidraw

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/ColinFay/shinidraw/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ColinFay/shinidraw/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{shinidraw}` is to bring the amazing
[Exaclidraw](https://excalidraw.com/) to your R console.

⚠️ WORK IN PROGRESS ⚠️

## Installation

You can install the development version of `{shinidraw}` like so:

``` r
pak::pak("thinkr-open/shinidraw")
```

## Why?

Excalidraw is awesome, and we’ve been using it for prototyping `{shiny}`
apps for a while now. So what is missing, and what does `{shinidraw}`
bring to the table?

### Projects

When used in the browser, Excalidraw saves your drawings in your
browser’s local storage, and you can export and save locally.

When using `{shinidraw}`, you’ll have a built-in project system, where
the `.excalidraw` files are stored on the machine running the app.

If you develop in an existing project, `{shinidraw}` will load the
latest version of the `.excalidraw` file.

Here are the commands you can use to manage your projects:

``` r
library(shinidraw)

# Create an empty, temp file (will not be saved)
excalidraw()

# This will create a new project
excalidraw_new_project()

# This will open an existing project
excalidraw_open_project("rr-2023")

# Simply open a file
excalidraw_open_file(
  excal_helloworld()
)
```

Note that the first time you launch `{shinidraw}`, it will prompt for
your consent to store data on your computer.

### Auto saving

The app will auto-save your drawings at a given interval, so you don’t
have to worry about losing your work.

## About

You’re reading the doc about version: 0.0.0.9005

This README has been compiled on the

``` r
Sys.time()
#> [1] "2023-06-21 14:40:50 CEST"
```

Here are the test & coverage results:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading shinidraw
#> Writing 'excalidraw.Rd'
#> ── R CMD check results ────────────────────────────────────────────────────────────────────── shinidraw 0.0.0.9005 ────
#> Duration: 10.7s
#>
#> ❯ checking Rd \usage sections ... WARNING
#>   Undocumented arguments in documentation object 'excalidraw_new_project'
#>     ‘talkative’
#>
#>   Functions with \usage entries need to have the appropriate \alias
#>   entries, and all their arguments documented.
#>   The \usage entries must correspond to syntactically valid R code.
#>   See chapter ‘Writing R documentation files’ in the ‘Writing R
#>   Extensions’ manual.
#>
#> ❯ checking R code for possible problems ... NOTE
#>   excalidraw_new_project: no visible binding for global variable
#>     ‘talkative’
#>   Undefined global functions or variables:
#>     talkative
#>
#> 0 errors ✔ | 1 warning ✖ | 1 note ✖
```

``` r
covr::package_coverage()
#> shinidraw Coverage: 59.19%
#> R/run_app.R: 0.00%
#> R/excal_existing_project.R: 12.84%
#> R/mod_excalidraw.R: 60.78%
#> R/excalidraw_consent.R: 74.07%
#> R/consent.R: 79.17%
#> R/get_excalidraw_path.R: 80.00%
#> R/golem_utils_server.R: 84.62%
#> R/golem_utils_ui.R: 89.57%
#> R/app_ui.R: 93.10%
#> R/app_config.R: 100.00%
#> R/app_server.R: 100.00%
#> R/excal_dependency.R: 100.00%
#> R/utils_examples.R: 100.00%
```

## Code of Conduct

Please note that the shinidraw project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
