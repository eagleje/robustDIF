# -------------------------------------------------------------------
#' S3 plot method for objects of class "rdif"
#' Plots the rho function of the output from rdif.
#'
#' @param object A saved output from \code{rdif()} that is to be plotted.
#' @param ... Additional arguments to be passed to \code{plot()}
#'
#' @return An object of class rdif, a plot with components:
#' \itemize {
#' \item{\code{xlab}}{theta}
#' \item{\code{ylab}}{rho}
#' \item{\code{type}}{line}
#' }
#' @export
#'
#' @examples
#' \dontrun{
#' # Assuming "rdif.eg" is a list of parameter values
#' rho <- rdif(mle = rdif.eg, fun = "d_fun3", grid.width = .01)
#' plot(rho)
#' }
plot.rdif.rho <- function(object, ...) {
  if (!inherits(object, "rdif")) stop("Object is not of class 'rdif'")

  # Validate output and plot
  if (!is.null(object[["rho.plot"]][["theta"]]) && !is.null(object[["rho.plot"]][["rho"]])) {
    plot(object[["rho.plot"]][["theta"]], object[["rho.plot"]][["rho"]], type = "l", xlab = "theta", ylab = "rho", ...)
  } else {
    stop("rho_grid did not return 'theta' and 'rho' components suitable for plotting.")
  }

  invisible(object)
}
