app <- function(env){
    req <- Rook::Request$new(env)
    res <- Rook::Response$new()

    # Use the method write() to print out a nicely formatted
    # listing of everything in the env variable
    # Make use of capture.output and str. And don't forget how
    # print verbatim text with HTML.

    res$finish()
}
