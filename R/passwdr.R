
passphrase <- function(num_words = 6) {

    pass <- vector("character", length = num_words)

    for (i in seq_len(num_words)) {
        num <- paste0(sample(6, 5, replace = TRUE), collapse = "")
        pass[i] <- eff_word_list$word[eff_word_list$num == num]
    }

    new_passphrase(pass)
}

new_passphrase <- function(x) {
    structure(x, class = "passphrase")
}



add_token_between_words <- function(pass, ..., position = length(pass)) {

    if (is.call(position)) {
        position <- position
    }

    stopifnot(
        "position must be an integer 0 to length(pass)" = {is.numeric(position) && (as.integer(position) >= 0L && as.integer(position) <= length(pass))}
    )

    token <- paste0(unlist(list(...)), collapse = "")

    if (position == 0) {
        return(new_passphrase(c(token, pass)))
    }
    idx <- seq_len(position)
    new_passphrase(c(pass[idx], token, pass[-idx]))

}

to_upper_in_word <-  function(pass, position, letter) {

    new_word <- toupper(substr(pass[position], letter, letter))
    substr(pass[position], letter, letter) <- new_word

    pass
}


add_token <- function(..., size = 1, replace = FALSE, prob = NULL) {
    pool <- unlist(...)

    sample(pool, size = size, replace = replace, prob = prob)

}

add_symbol <- function(size = 1, replace = FALSE, prob = NULL) {

    add_token(symbols, size = size, replace = replace, prob = prob)
}

add_number <- function(size = 1, replace = FALSE, prob = NULL) {

    add_token(as.character(0:9), size = size, replace = replace, prob = prob)
}

add_upper_alpha <- function(size = 1, replace = FALSE, prob = NULL) {
    add_token(LETTERS, size = size, replace = replace, prob = prob)
}

shuffle <- function(...) {
    lst <- unlist(list(...))
    num_items <- length(lst)

    lst[sample(num_items, num_items)]
}
#' @importFrom base print
print.passphrase <- function(x, ...) {
    cat("\n    ", paste0(unclass(x), collapse = " "), "\n")
    invisible(x)
}


