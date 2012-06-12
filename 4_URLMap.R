# This example uses the URLMap Rook application (see the help page for URLMap)
# to map urls to one of two urls: either '/' or any url with the '.png' extensions
#
# This also demonstrates outputing both HTML and dynamic images to the web browser.
#

app <- URLMap$new(
      '^.*png$' = function(env){
         req <- Rook::Request$new(env)
         res <- Rook::Response$new()

         n <- 10

         if (!is.null(req$GET()[['n']]))
            n <- as.integer(req$GET()[['n']])

         # The default output type is 'text/html'.
         # We override this by adding a 'Content-type'
         # HTTP header.
         res$header('Content-type','image/png')

         t <- tempfile()
         png(t)
         plot(rnorm(n),col=rainbow(n))
         dev.off()

         res$body <- readBin(t,'raw',n=file.info(t)$size)
         unlink(t)
         res$finish()

      },
      '.*' = function(env){
         req <- Rook::Request$new(env)
         res <- Rook::Response$new()

         n <- 10

         if (!is.null(req$GET()[['n']]))
            n <- as.integer(req$GET()[['n']])

         res$write("Enter number of elements: ")
         res$write('<form method="GET">')
         res$write('<input type="text" name="n">')
         res$write('<input type="submit" name="Submit">')
         res$write("</form><br>")

         url <- req$to_url('/plot.png',n=as.character(n))


         res$write(sprintf('<img src="%s">',url))

         res$finish()
      }
)
