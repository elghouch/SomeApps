#' Launch some Shiny apps
#'
#' @param name The name of the app to run
#' @param ... arguments to pass to `shiny::runApp()` or to `rmarkdown::run()`
#'
#' @section Examples:
#'
#' ```{r eval = FALSE}
#' apps()
#' apps("app1")
#' apps("app2)
#' ```
#'
#' @export
#'
apps <- function(name = "app1", ...) {
  appDir <- system.file("ShinyApps", name, package = "pkgnam2")
  if ("app.R" %in% list.files(appDir)) {
    shiny::runApp(appDir, launch.browser = TRUE, ...)
  } else if ("app.Rmd" %in% list.files(appDir)) {
    rmarkdown::run(file = paste0(appDir, "/app.Rmd"), shiny_args = list(launch.browser = TRUE), ...)
  } else {
    stop("The app ", name, " does not exist")
  }
}
