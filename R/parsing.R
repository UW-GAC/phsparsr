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
  # get a list of xml_children for each row (basically, number of columns), then
  # get the length of each of these lists
  row_lengths <-
    purrr::map_int(
      purrr::map(
        project_tables, function(x){
          xml2::xml_children(x)
          }
      ),
      function(x){
        length(x)
        }
    )

  # get the row number of each header row
  header_row_indexes <-
    which(row_lengths %in% 2)

  # short circuit if only one project
  if (length(header_row_indexes) == 1) {
    return(project_tables)
  }

  # initialize empty list of length = number of projects
  by_project <- vector("list", length(header_row_indexes))

  # loop to divide project_tables into by_project
  for (index in seq(1:length(by_project))){
    starting_row <- header_row_indexes[index]

    if (is.na(header_row_indexes[index + 1])) {
      ending_row <- length(project_tables)
    } else {
      ending_row <- header_row_indexes[index + 1] - 1
    }

    by_project[[index]] <- project_tables[starting_row:ending_row]
  }

  return(by_project)
}

#' parse a single project to get tibble with phs, expiration, consent code
#' THIS SHOULD BE REFACTORED
#' @noRd
.parse_project <- function(a_project){
  # define my regexes
  phs_regex <- paste0(
    "(phs", # start capture group with the string "phs"
    "\\d{6})", # followed by 6 digits
    "\\.v", # followd by the string ".v"
    "(\\d+?)", # followed by 1 or more (but as few as possible) digits
    "\\.p", # followed yb the string ".p"
    "(\\d+?)") # followed by 1 or more (but as few as possible) digits

  consent_regex <- paste0(
    "^", # at the beginning of the string
    "\\\n", # the string "\n"
    "(.+)") # followed by 1 or more characters that we want to capture

  # run the loop. Note: this is bad b/c uncertain length..
  for (index in 2:length(a_project)){
    # get a row
    a_row <- a_project[index]
    # stop if the row doesn't have 5 columns
    if (length(xml2::xml_children(a_row)) != 5){
      break
    }

    expiration <- xml2::xml_text(xml2::xml_children(a_row)[4])
    string_with_phs <- xml2::xml_text(xml2::xml_children(a_row)[2])
    phs <- stringr::str_match(string_with_phs, phs_regex)[[2]]
    string_with_consent <-
      xml2::xml_text(
        xml2::xml_children(
          xml2::xml_children(
            xml2::xml_children(a_row)[2])
          )
        [2])

    # note: string_with_consent includes \n, introduced by xml_text(), which
    # regex will call end of line...
    consent_code <- stringr::str_trim(
      stringr::str_match(string_with_consent, consent_regex)[[2]])

    # check for results tibble
    if (!"result" %in% ls()){
      # initialze empty data frame
      result <- dplyr::tibble(phs, expiration, consent_code)
    } else {
      result <- dplyr::bind_rows(
        result,
        dplyr::tibble(phs, expiration, consent_code)
      )
    }
  }

  return(result)
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
