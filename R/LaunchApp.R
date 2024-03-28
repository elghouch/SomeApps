#' Launch some Shiny apps
#'
#' @param name The name of the app to run
#' @param ... arguments to pass to `shiny::runApp()` or to `rmarkdown::run()`
#'
#' @return Shiny app
#'
#' @section Examples:
#'
#' ```{r eval = FALSE}
#' apps()
#' apps("app1")
#' apps("app2")
#' ```
#'
#' @export
#'
#' @import shiny
#' @import rmarkdown
#'
apps <- function(name = "app1", ...) {
  appDir <- system.file("ShinyApps", name, package = getNamespaceName(parent.env(environment())))
  if ("app.R" %in% list.files(appDir)) {
    shiny::runApp(appDir, launch.browser = TRUE, ...)
  } else if ("app.Rmd" %in% list.files(appDir)) {
    rmarkdown::run(file = paste0(appDir, "/app.Rmd"), shiny_args = list(launch.browser = TRUE), ...)
  } else {
    stop("The app ", name, " does not exist")
  }
}
