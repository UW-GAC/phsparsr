context("test-.split_by_project")

test_that(".spllit_by_project returns a list", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)

  split <- .split_by_project(table_rows)
  expect_type(split, "list")
})

test_that(".split_by_project returns correct 1-length list", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)

  split <- .split_by_project(table_rows)
  expect_identical(split, table_rows)
})

test_that(".split_by_project returns 2-length list for 2-project doc", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)

  split <- .split_by_project(table_rows)
  expect_equal(2, length(split))
})
