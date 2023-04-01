with_mock_dir("httptest2/predict", {
  test_that("gptzero_predict_file works", {
    x <- gptzero_predict_file(tf_fake)
    expect_s3_class(x, 'tbl_df')
  })

  gptzero_predict_text

  test_that("gptzero_predict_text works", {
    x <- gptzero_predict_text(abstr)
    expect_s3_class(x, 'tbl_df')
  })
})
