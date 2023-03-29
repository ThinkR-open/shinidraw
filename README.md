
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinidraw

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/ColinFay/shinidraw/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ColinFay/shinidraw/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of shinidraw is to …

## Installation

You can install the development version of shinidraw like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Run the app

You can launch the app with:

``` r
shinidraw::run_app()
```

## About

You’re reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2023-03-29 10:34:52 CEST"
```

Here are the test & coverage results :

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading shinidraw
#> ── R CMD check results ─────────────────────────────── shinidraw 0.0.0.9000 ────
#> Duration: 11.3s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> shinidraw Coverage: 79.81%
#> R/run_app.R: 0.00%
#> R/utils_examples.R: 0.00%
#> R/mod_excalidraw.R: 52.00%
#> R/golem_utils_server.R: 77.78%
#> R/golem_utils_ui.R: 87.94%
#> R/app_config.R: 100.00%
#> R/app_server.R: 100.00%
#> R/app_ui.R: 100.00%
```

## Code of Conduct

Please note that the shinidraw project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
