context("test-.parse_project")

test_that(".parse_project returns a tibble", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  parsed <- .parse_project(table_rows)

  expect_true(tibble::is_tibble(parsed))
})

test_that(".parse_project returns expected tibble", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  parsed <- .parse_project(table_rows)

  expected <-
    structure(
      list(phs = c("phs000007", "phs000007"),
           expiration = c("2019-02-29", "2019-02-29"),
           consent_code = c("Health/Medical/Biomedical (IRB, MDS)",
                            "Health/Medical/Biomedical (IRB, NPU, MDS)")),
      row.names = c(NA, -2L),
      class = c("tbl_df", "tbl", "data.frame")
      )

  expect_identical(parsed, expected)
})
