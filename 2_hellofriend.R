app <- function(env){
   req <- Rook::Request$new(env)
   res <- Rook::Response$new()

   # Add a lastname input, capture it, and print it out
   # in the H1 heading below.

   firstname <- 'Friend'
   if (!is.null(req$GET()[['firstname']]))
      firstname <- req$GET()[['firstname']]

   res$write(c('<h1>Hello ',firstname,'!</h1>'))
   res$write('What is your name?')
   res$write('<form method="GET">')
   res$write('<input type="text" name="firstname">')
   res$write('<input type="submit" name="Submit"></form>')

   res$finish()
}
