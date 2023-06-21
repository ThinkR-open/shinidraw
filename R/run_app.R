#' Run and save excalidraw projects
#'
#' @param project name to the project to load or create.
#' @param auto_save whether to save the project automatically.
#' @param excalidraw path to the excalidraw file to load.
#' @inheritParams shiny::shinyApp
#'
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options
#' @export
#' @rdname excalidraw
excalidraw_new_project <- function(
	project,
	auto_save = TRUE,
	onStart = NULL,
	options = list(),
	enableBookmarking = NULL,
	uiPattern = "/"
				) {
	run_app(
		excalidraw = handle_new_project(
			project
		),
		auto_save = auto_save,
		onStart = NULL,
		options = list(),
		enableBookmarking = NULL,
		uiPattern = "/"
	)
}
#' @export
#' @rdname excalidraw
excalidraw_open_project <- function(
	project,
	auto_save = TRUE,
	onStart = NULL,
	options = list(),
	enableBookmarking = NULL,
	uiPattern = "/"
				) {
	run_app(
		excalidraw = handle_open_project(
			project
		),
		auto_save = auto_save,
		onStart = NULL,
		options = list(),
		enableBookmarking = NULL,
		uiPattern = "/"
	)
}
#' @export
#' @rdname excalidraw
excalidraw_open_file <- function(
	excalidraw,
	auto_save = TRUE,
	onStart = NULL,
	options = list(),
	enableBookmarking = NULL,
	uiPattern = "/"
				) {
	if (missing(excalidraw)) {
		excalidraw <- tempfile(fileext = ".excalidraw")
	}
	run_app(
		excalidraw = excalidraw,
		auto_save = auto_save,
		onStart = onStart,
		options = options,
		enableBookmarking = enableBookmarking,
		uiPattern = uiPattern
	)
}

#' @export
#' @rdname excalidraw
excalidraw <- function(
	onStart = NULL,
	options = list(),
	enableBookmarking = NULL,
	uiPattern = "/"
				) {
	excalidraw <- tempfile(fileext = ".excalidraw")
	run_app(
		excalidraw = excalidraw,
		auto_save = FALSE,
		onStart = onStart,
		options = options,
		enableBookmarking = enableBookmarking,
		uiPattern = uiPattern
	)
}

run_app <- function(
	excalidraw = NULL,
	auto_save = TRUE,
	onStart = NULL,
	options = list(),
	enableBookmarking = NULL,
	uiPattern = "/"
				) {
	with_golem_options(
		app = shinyApp(
			ui = app_ui,
			server = app_server,
			onStart = onStart,
			options = options,
			enableBookmarking = enableBookmarking,
			uiPattern = uiPattern
		),
		golem_opts = list(
			path_to_excalidraw = excalidraw,
			auto_save = auto_save
		)
	)
}
