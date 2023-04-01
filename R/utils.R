process_doc <- function(doc) {
  lapply(seq_len(length(doc$documents)), function(i){
    doc_lvl <- dplyr::bind_rows(doc$documents[[i]][1:3]) |>
      dplyr::rename_with(.fn = function(x) paste0('doc_', x))

    par_lvl <- dplyr::bind_rows(doc$documents[[i]]$paragraphs) |>
      dplyr::rename_with(.fn = function(x) paste0('par_', x))

    sen_lvl <- dplyr::bind_rows(doc$documents[[i]]$sentences) |>
      dplyr::mutate(sentence_index = dplyr::row_number() - 1L, .before = dplyr::everything())

    sen_lvl |>
      dplyr::left_join(par_lvl, by = c(sentence_index = 'par_start_sentence_index'), keep = TRUE) |>
      dplyr::bind_cols(doc_lvl) |>
      dplyr::select(dplyr::all_of(c(names(doc_lvl), names(par_lvl), names(sen_lvl)))) |>
      tidyr::fill(dplyr::starts_with(c('par_')))
  }) |>
    dplyr::bind_rows()
}
