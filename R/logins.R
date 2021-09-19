
generate_animal_name <- function(size = 1, ...) {
    sample(animals, size = 1, ...)
}

get_animal_adjective <- function(animal) {
    starts <- substring(animal, 1, 1)
    query <- glue::glue("https://api.datamuse.com/words?sp={starts}*&max=100&rel_jjb={animal}")
    query_result <- httr::GET(query)

    all_results <- httr::content(query_result)
    idx <- sample(seq_along(all_results), 1)
    all_results[[idx]][["word"]]
}

#' Title
#'
#' @return
#' @export
#'
#' @examples
generate_login <- function() {
    my_animal <- generate_animal_name()
    my_adjective <- get_animal_adjective(my_animal)
    login <- paste0(my_adjective, '-', my_animal)
    nchar_login <- nchar(login)
    m <- crayon::magenta
    g <- crayon::green
    box_text(login)
}

box_text <- function(text, border = crayon::magenta, color = crayon::green) {
    nchar_text <- nchar(text)
    top_bottom_bar <- border(paste0(rep("#", 2*3 + nchar_text)))
    cat(top_bottom_bar, '\n', sep = "")
    cat(border('#  '), color(text), border('  #'), '\n', sep = "")
    cat(top_bottom_bar, '\n', sep = "")
    invisible(text)
}
