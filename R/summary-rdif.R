# -------------------------------------------------------------------
#' S3 summary method for objects of class "rdif.sum"
#' Prints: results of dif_test, results of delta_test
#'
#' @param object A saved list of parameter values from \code{\link[robustDIF]{get_model_parms}}
#' @param fun One of \code{c("a_fun1", "a_fun2", "d_fun1", "d_fun2", "d_fun3")}.
#' @param ... Additional arguments to be passed to \code{dif_test()} and \code{delta_test{}}
#'
#' @return A printed summary of values
#' @export
#'
#' @examples
#' \dontrun{
#' # Assuming "rdif.eg" is a list of parameter values
#' summary.rdif(rdif,eg)
#' }
summary.rdif <- function(object, fun = "d_fun3", ...) {

  df.name <- as.character(object[["df"]])
  n.iter <- as.character(object$n.iter)
  n.sols <- object$multiple.solutions
  theta <- as.character(round(object[["est"]], 3))
  se <- as.character(round(object[["delta.test"]][["rdif.se"]], 4))
  walds <- as.data.frame(object[["dif.test"]])

 cat("Robust Differential Item Functioning in IRT Model estimated by IRLS.\n\n")
 cat("Data:", df.name, "\n")
 cat("Estimation ended after ", n.iter, " iterations.\n")
 if (n.sols) {
   cat("Multiple solutions found.\n\n")
 }
 if (!n.sols) {
   cat("Single solution found.\n\n")
 }
 cat("Est:", theta, "   SE:", se, "\n\n")

 cat("Results from Wald Tests of DIF:\n")
 print(walds)

 invisible(NULL)

}

