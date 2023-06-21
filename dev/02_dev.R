# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Amend DESCRIPTION with dependencies read from package code parsing
## install.packages('attachment') # if needed.
attachment::att_amend_desc()

## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "excalidraw", with_test = TRUE) # Name of the module
golem::add_module(name = "name_of_module2", with_test = TRUE) # Name of the module

rm(list = ls())
{
  comfy_inflate <- purrr::partial(
    fusen::inflate,
    check = FALSE,
    vignette_name = NA
  )
  comfy_inflate(
    flat_file = "dev/flat_htmldep.Rmd"
  )
  comfy_inflate(
    flat_file = "dev/flat_consent.Rmd"
  )
  comfy_inflate(
    flat_file = "dev/flat_utils.Rmd"
  )
  comfy_inflate(
    flat_file = "dev/flat_project_mgmt.Rmd"
  )
}
grkstyle::grk_style_pkg()
devtools::check()
desc::desc_bump_version("dev")
rmarkdown::render("README.Rmd")
remotes::install_local(force = TRUE)

## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct("helpers", with_test = TRUE)
golem::add_utils("examples", with_test = TRUE)

golem::add_html_template("index")

golem::use_external_js_file("https://fb.me/react-0.14.3.min.js")
golem::use_external_js_file("https://fb.me/react-dom-0.14.3.min.js")

golem::use_external_js_file("https://unpkg.com/@excalidraw/excalidraw/dist/excalidraw.js")
golem::use_external_js_file("https://unpkg.com/react@18.2.0/umd/react.development.js")
golem::use_external_js_file("https://unpkg.com/react-dom@18.2.0/umd/react-dom.development.js")
golem::use_external_js_file("https://unpkg.com/@excalidraw/excalidraw/dist/excalidraw.js")


golem::use_external_js_file("https://unpkg.com/react@18.2.0/cjs/react.production.min.js")
golem::use_external_js_file("https://unpkg.com/react-dom@18.2.0/cjs/react-dom.production.min.js")
golem::use_external_js_file("https://unpkg.com/react-dom@18.2.0/umd/react-dom.development.js")
golem::use_external_js_file("https://unpkg.com/@excalidraw/excalidraw/dist/excalidraw.js")

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file("values")
golem::add_js_handler("handlers")
golem::add_css_file("custom")
golem::add_sass_file("custom")

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw(name = "my_dataset", open = FALSE)

## Tests ----
## Add one line by test you want to create
usethis::use_test("app")

# Documentation

## Vignette ----
usethis::use_vignette("shinidraw")
devtools::build_vignettes()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# Create a summary readme for the testthat subdirectory
covrpage::covrpage()

## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
##
## (You'll need GitHub there)
usethis::use_github()

# GitHub Actions
usethis::use_github_action()
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
usethis::use_github_action_check_release()
usethis::use_github_action_check_standard(
  save_as = "R-CMD-check.yaml",
  ref = NULL,
  ignore = TRUE,
  open = FALSE
)
usethis::use_github_action_check_full()
# Add action for PR
usethis::use_github_action_pr_commands()

# Travis CI
usethis::use_travis()
usethis::use_travis_badge()

# AppVeyor
usethis::use_appveyor()
usethis::use_appveyor_badge()

# Circle CI
usethis::use_circleci()
usethis::use_circleci_badge()

# Jenkins
usethis::use_jenkins()

# GitLab CI
usethis::use_gitlab_ci()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")
