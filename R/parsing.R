#' Get the set of approved projects tables from HTML
#' see https://www.w3schools.com/xml/xml_xpath.asp for xpath syntax
#' @noRd
.get_rows_from_html <- function(html_path){
    xml2::read_html(html_path) %>%
    xml2::xml_find_all("//body//div[@id='approved']//tbody//tr")
}

#' split the project tables by project. Return list of projects.
#' @noRd
.split_by_project <- function(project_tables){
# note: this is useful for finding project splits...
#  purrr::map_int(purrr::map(table_rows, function(x){xml_children(x)}), function(x){length(x)})
}

#' Get phs identifiers from a dbGaP-provided Study Request List
#'
#' @param html_path filepath to the html page downloaded from dbGaP
#' @return a list whose elements are each a list of phs identifiers with one
#'   list per projects
#'
#' @examples
#' \dontrun{
#' html_path <-
#' system.file("extdata", "example.html", package = "phsparsr", mustWork = TRUE)
#' ids <- parse_phs(html_path)
#' }
#' @export
parse_phs <- function(html_path){
  table_rows <- .get_rows_from_html(html_path)

}