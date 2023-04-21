#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  # Just to satisfy testthat
  if (is.null(golem::get_golem_options("auto_save"))) {
    with_auto_save <- TRUE
  } else {
    with_auto_save <- golem::get_golem_options("auto_save")
  }
  if (is.null(golem::get_golem_options("path_to_excalidraw"))) {
    path_to_excalidraw <- tempfile(fileext = ".excalidraw")
  } else {
    path_to_excalidraw <- golem::get_golem_options("path_to_excalidraw")
  }
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    mod_excalidraw_ui(
      "main_1",
      path_to_excalidraw = path_to_excalidraw,
      with_auto_save = with_auto_save
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "shinidraw"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
