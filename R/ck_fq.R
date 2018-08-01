#' Check frequencies
#' 
#' This function cheks the frequencies of valid cases for treatments and replications.
#' 
#' @param trait The trait
#' @param factors The factors
#' @param rep The replications
#' @param dfr The name of the data frame
#' @return A table of frequencies of valid cases for all factors' levels combinations
#' (\code{tf}) and a table of frequencies of valid cases for all factors' levels and
#' replications combinations (\code{tfr}).
#' @author Raul Eyzaguirre.
#' @examples 
#' ## Example 1
#' # Create a design
#' dfr <- cr.rcbd(1:20, 3, 10)
#' dfr <- dfr$book
#' # Create some random data
#' dfr$y <- rnorm(60)
#' # Delete some values
#' dfr[c(1, 5, 16, 17), 'y'] <- NA
#' # Check the frequencies
#' ck.fq("y", "geno", "block", dfr = dfr)
#' 
#' ## Example 2
#' # Create a design
#' A <- paste0("a", 1:5)
#' B <- paste0("b", 1:3)
#' dfr <- cr.f(c("A", "B"), list(A, B), "rcbd", 3, 10)
#' dfr <- dfr$book
#' # Create some random data
#' dfr$y <- rnorm(45)
#' # Delete some values
#' dfr[c(5, 10, 24), 'y'] <- NA
#' # Check the frequencies
#' ck.fq("y", c("A", "B"), "block", dfr = dfr)
#' @export

ck.fq <- function(trait, factors, rep, dfr) {
  
  # Number of factors
  
  nf <- length(factors)
  
  # Factors and replications as factors to preserve levels in the table of frequencies
  
  temp <- dfr
  for (i in 1:nf)
    temp[, factors[i]] <- factor(temp[, factors[i]])
  temp[, rep] <- factor(temp[, rep])
  
  # Calculate frequencies
  
  temp <- temp[!is.na(temp[, trait]), ]
  
  if (nf == 1) {
    tf <- table(temp[, factors])
    tfr <- table(temp[, factors], temp[, rep])
  } else {
    expr <- 'table(temp[, factors[1]]'
    for (i in 2:nf)
      expr <- paste0(expr, ', temp[, factors[', i, ']]')
    expr1 <- paste0(expr, ')')
    expr2 <- paste0(expr, ', temp[, rep])')
    tf <- eval(parse(text = expr1))
    tfr <- eval(parse(text = expr2))
  }
  
  # Return
  
  list(tf = tf, tfr = tfr)
  
}