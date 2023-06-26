test_that("see_normality works", {
  variable <- rnorm(100)
  label <- "teste"

  testthat::expect_true(is.numeric(variable))
  testthat::expect_type(label, "character")
})
