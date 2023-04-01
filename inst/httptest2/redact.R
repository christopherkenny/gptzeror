function(resp) {
  resp |>
    httptest2::gsub_response(pattern = gptzeror::gptzero_get_key(), '')
}
