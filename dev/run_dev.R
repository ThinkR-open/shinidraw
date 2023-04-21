# Set options here
options(golem.app.prod = FALSE) # TRUE = production mode, FALSE = development mode

# Comment this if you don't want the app to be served on a random port
options(shiny.port = httpuv::randomPort())

# Detach all loaded packages and clean your environment
golem::detach_all_attached()
rm(list=ls(all.names = TRUE))

# Document and reload your package
golem::document_and_reload()
pkgload::load_all()
# Run the application

# run_app(excalidraw = "inst/rect.excalidraw")

excalidraw()

excalidraw_new_project("test")

excalidraw_open_project("rr-2023")

excalidraw_open_file(
  excal_helloworld()
)
