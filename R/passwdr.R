
generate_passphrase <- function(num_words = 6) {
    word_list_file <- "https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt"

    word_list <- readr::read_tsv(word_list_file, col_names = c("num", "word"), col_types = "cc")
    pass <- vector("character", length = num_words)

    for (i in seq_len(num_words)) {
        num <- paste0(sample(6, 5, replace = TRUE), collapse = "")
        pass[i] <- word_list$word[word_list$num == num]
    }

    pass
}
