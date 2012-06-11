app <- function(env){
  req <- Rook::Request$new(env)
  res <- Rook::Response$new()
  
  # 'POST' returns a list of all elements collected
  # from a form.
  userData <- req$POST()
  
  if (!is.null(userData$desc)){
    
    # There's no check to see if the user actually uploaded a file
    # how and where would up check to see if this occurs?
    #
    # FYI, an uploaded file input element contains a list with
    # four elements: 'filename' = original file name, 'tempfile' =
    # location of temporary file, 'content_type' = type of file,
    # and 'head' = mime time header for file portion of message
    d <- read.csv(userData$csvdat$tempfile)
    
    # Read the help file for the Utils object to learn
    # about 'unescape'.
    res$write(c("<p>",userData$desc,"</p>"))
    
    # Rather that printing the raw data, try capturing the output
    # of summary.
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