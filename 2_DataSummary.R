app <- function(env){
  req <- Rook::Request$new(env)
  res <- Rook::Response$new()
  
  # 'POST' returns a list of all elements collected
  # from a form.
  userData <- req$POST()
  
  if (!is.null(userData$desc)){
    d <- read.csv(userData$csvdat$tempfile)
    res$write(c("<p>",Utils$unescape(userData$desc),"</p>"))
    res$write("<pre>")
    res$write(paste(capture.output(print(d)),collapse="\n"))
    res$write("</pre>")
  } else {
    res$write('Uploade Data Summary and File:<br>')
    res$write('<form enctype="multipart/form-data" method="POST">')
    res$write('<textarea rows="10" cols="80" name="desc"></textarea><br>')
    res$write('<input type="file" name="csvdat"><br>')
    res$write('<input type="submit" name="Submit"></form>')
    
  }
  res$finish()
}