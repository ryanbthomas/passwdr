local({
    word_list_file <- "https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt"

    eff_word_list <- readr::read_tsv(
        word_list_file,
        col_names = c("num", "word"),
        col_types = "cc"
    )

    symbols <- c("?", "!", "@", "#", "%", "^", "&", "*", "(", ")")

usethis::use_data(eff_word_list, symbols, internal = TRUE, overwrite = TRUE)

})
