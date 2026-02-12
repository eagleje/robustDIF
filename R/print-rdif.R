# -------------------------------------------------------------------
#' S3 print method for objects of class "rdif"
#' Prints the estimated scaling parameter from rdif. (to be added: SE)
#'
#' @param object An object of class 'rdif', the saved output from the \code{rdif()} function.
#'
#' @return An object of class rdif, a string with rdif estimate value.
#' @export
#'
#' @examples
#' \dontrun {
#' #Assuming "rdif.eg" is a list of parameter values
#' rdif.ex <- rdif(mle = rdif.eg, fun = "d_fun3", alpha = .05)
#' print(rdif.ex)
#' }
print.rdif <- function(object) {
  if (!inherits(object, "rdif")) stop("Object is not of class 'rdif'")
  est <- object$est
  se <- object[["delta.test"]][["rdif.se"]]
  if (is.null(est)) {
    cat("Estimated scaling parameter is null.\n")
  } else {
    cat("Estimated scaling parameter:", est, "    RDIF Standard Error:", se, "\n")
  }
  invisible(object)
}
