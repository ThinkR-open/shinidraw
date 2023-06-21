#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id Internal parameters for {shiny}.
#' @param path_to_excalidraw Path to the excalidraw file to load.
#' @param with_auto_save Whether to save the project automatically.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_excalidraw_ui <- function(
  id,
  path_to_excalidraw,
  with_auto_save = TRUE
) {
  ns <- NS(id)
  if (is.null(path_to_excalidraw)) {
    excalidraw_initialData <- "[]"
  } else if (tools::file_ext(path_to_excalidraw) != "excalidraw") {
    excalidraw_initialData <- "[]"
  } else if (!file.exists(path_to_excalidraw)) {
    excalidraw_initialData <- "[]"
  } else {
    excalidraw_initialData <- paste(
      suppressWarnings(
        readLines(path_to_excalidraw)
      ),
      collapse = " "
    )
  }

  tagList(
    excalidraw_dependency(),
    htmlTemplate(
      app_sys("app/www/index.html"),
      initialData = excalidraw_initialData,
      auto_save = {
        if (with_auto_save) {
          "true"
        } else {
          "false"
        }
      },
      id_for_shiny = ns("excalidraw")
      # add here other template arguments
    )
  )
}

#' main Server Functions
#'
#' @noRd
mod_excalidraw_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$excalidraw, {
      if (
        as.logical(
          golem::get_golem_options("auto_save")
        )
      ) {
        if (
          as.logical(
            golem::get_golem_options("talkative")
          )
        ) {
          cli::cat_rule(sprintf("[%s] Saving excalidraw", as.character(Sys.time())))
        }
        cat(
          input$excalidraw,
          file = golem::get_golem_options("path_to_excalidraw")
        )
        cli::cat_line()
      }
    }) |> debounce(1000)
  })
}

## To be copied in the UI
# mod_excalidraw_ui("main_1")

## To be copied in the server
# mod_excalidraw_server("main_1")
