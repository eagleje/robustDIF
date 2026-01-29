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

  dif.test.res <- tryCatch(
   dif_test(mle = object, theta=NULL, fun = fun,  ...),
   error = function(e){
     warning("dif_test failed: ", conditionMessage(e))
     NULL
   }
 )

 delta.test.res <- tryCatch(
   delta_test(mle = object, fun = fun, alpha = 0.05, ...),
   error = function(e) {
     warning("delta_test failed: ", conditionMessage(e))
     NULL
   }
)

 cat("Results from Wald Tests of DIF:\n")
 if (!is.null(dif.test.res)) {
   print(dif.test.res)
 } else {
   cat("<DIF Test results not found>\n")
 }

 cat("\nResults from Delta Test about Impact:\n")
 if (!is.null(delta.test.res)) {
   print(delta.test.res)
 } else {
   cat("<Delta Test results not found>\n")
 }

 invisible(NULL)

}

