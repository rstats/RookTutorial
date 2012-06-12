app <- function(env){
    req <- Rook::Request$new(env)
    res <- Rook::Response$new()
    
    # Use the Rook::Response 'write' method to print out
    # "Hello World!" with an H1 HTML heading

    # Read the Request help page and try printing out more
    # information about the request by calling one of the
    # other methods.

    res$finish()
}
