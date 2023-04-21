#' examples
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
excal_helloworld <- function() {
  temp_file <- tempfile(fileext = ".excalidraw")
  file.copy(
    app_sys("rect.excalidraw"),
    temp_file
  )
  temp_file
}
