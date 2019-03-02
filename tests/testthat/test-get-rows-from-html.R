context("test-.get-rows-from-html")

test_that(".get_rows_from_html returns a list", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  expect_type(table_rows, "list")
})

test_that(".get_rows_from_html returns an xml_nodeset", {
  html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)
  table_rows <- .get_rows_from_html(html_path)
  expect_is(table_rows, "xml_nodeset")
})