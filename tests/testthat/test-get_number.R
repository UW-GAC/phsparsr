context("test-.get_number")

test_that(".get_number returns a string", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  project_list <- .split_by_project(table_rows)

  number <- .get_number(project_list[[1]])

  expect_type(number, "character")
})

test_that(".get_number returns expected number", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  project_list <- .split_by_project(table_rows)

  number <- .get_number(project_list[[1]])

  expect_identical(number, "1")
})
