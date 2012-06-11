app <- function(env){
  req <- Rook::Request$new(env)
  res <- Rook::Response$new()
  
  n <- 100
  
  # After getting this up and running, See if the user
  # input a GET variable named n like so:
  #
  # http://localhost:1234/dyngraph?n=53
  #
  # NOTICE: All user data input is text by default, thus
  # it is up to you to cast to numeric if necessary (as.numeric).

  
  # The default output type is 'text/html'.
  # We override this by adding a 'Content-type'
  # HTTP header.
  res$header('Content-type','image/png')
  
  t <- tempfile()
  png(t)
  plot(rnorm(n))
  dev.off()
  
  res$body <- readBin(t,'raw',n=file.info(t)$size)
  unlink(t)
  res$finish()
  
}