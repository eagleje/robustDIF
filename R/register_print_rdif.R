# -------------------------------------------------------------------
#' Registers S3 methods at load time:
#' - print for class "rdif"
#' - plot for class "rdif.rho"
#' - summary for class "rdif"
#'
#' @param libname
#' @param pkgname
#'
#' @return
#' @export
#'
.onLoad <- function(libname, pkgname) {
  envir <- parent.env(environment())
  ns <- asNamespace(pkgname)

  # Register print method for class "rdif" if available.
  if (exists("print.rdif", mode = "function", envir = envir)) {
    registerS3method("print", "rdif", get("print.rdif", envir = envir), envir = ns)
  }

  # Register plot method for class "rdif" if available.
  if (exists("plot.rdif.rho", mode = "function", envir = envir)) {
    registerS3method("plot", "rdif.rho", get("plot.rdif.rho", envir = envir), envir = ns)
  }

  # Register summary method for class "rdif" if available.
  if (exists("summary.rdif", mode = "function", envir = envir)) {
    registerS3method("summary", "rdif", get("summary.rdif", envir = envir), envir = ns)
  }
}
