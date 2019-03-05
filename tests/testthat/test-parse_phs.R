context("test-.parse_phs")

test_that(".parse_phs correct 1-length list", {
  html_path <-
    system.file("extdata", "1_example.html",
                package = "phsparsr", mustWork = TRUE)

  parsed <- parse_phs(html_path)

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

test_that(".parse_phs returns corect 2-length list", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)

  parsed <- parse_phs(html_path)

  expected <-
    list(`1` =
           structure(
             list(phs = c("phs000007", "phs000007"),
                  expiration = c("2019-02-29", "2019-02-29"),
                  consent_code = c("Health/Medical/Biomedical (IRB, MDS)",
                                   "Health/Medical/Biomedical (IRB, NPU, MDS)")
             ),
             row.names = c(NA, -2L),
             class = c("tbl_df", "tbl", "data.frame")),
         `2` =
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
