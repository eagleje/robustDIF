# -------------------------------------------------------------------
#' S3 plot method for objects of class "rdif.rho"
#' Plots the rho function of the output from rho_grid.
#'
#' @param object A saved output from rho_grid that is to be plotted.
#' @param ... Additional arguments to be passed to \code{plot()}
#'
#' @return An object of class rdif.rho, a plot with components:
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
#' rho <- rho_grid(mle = rdif.eg, fun = "d_fun3", grid.width = .01)
#' plot(rho) # Calls plot.rdif.rho S3 method
#' }
plot.rdif.rho <- function(object, ...) {
  if (!inherits(object, "rdif.rho")) stop("Object is not of class 'rdif.rho'")

  # Validate output and plot
  if (!is.null(object$theta) && !is.null(object$rho)) {
    plot(object$theta, object$rho, type = "l", xlab = "theta", ylab = "rho", ...)
  } else {
    stop("rho_grid did not return 'theta' and 'rho' components suitable for plotting.")
  }

  invisible(object)
}
