context("test-.parse_list")

test_that(".parse_list returns a list", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)

  table_rows <- .get_rows_from_html(html_path)
  project_list <- .split_by_project(table_rows)
  parsed <- .parse_list(project_list)

  expect_type(parsed, "list")
})

test_that(".parse_list correct 1-length list", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)

  table_rows <- .get_rows_from_html(html_path)
  project_list <- .split_by_project(table_rows)
  parsed <- .parse_list(project_list)

  expected <-
    list(`1` =
           structure(
             list(phs = c("phs000007", "phs000007"),
                  expiration = c("2019-02-29", "2019-02-29"),
                  consent_code = c("Health/Medical/Biomedical (IRB, MDS)",
                                   "Health/Medical/Biomedical (IRB, NPU, MDS)")
                  ),
             row.names = c(NA, -2L),
             class = c("tbl_df", "tbl", "data.frame")))
  expect_identical(parsed, expected)
})

test_that(".parse_list returns 2-length list for 2-project doc", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  project_list <- .split_by_project(table_rows)
  parsed <- .parse_list(project_list)
  expect_equal(2, length(parsed))
})
