#' Generate bib citations for URLs for some given strings
#'
#' @param handle character - the name of the handle
#' @param url character - the URL
#' @param title character - the title for the bib reference. Default is to use
#'   the handle
#' @param date character - the date accessed. Default is current date
#' @param clipboard logical - do you want to use the clipboard? Default to FALSE
#'
#' @return string of the bib handle
#' @export
#'
#' @examples
#' gen_bib_url(handle = "data-access",
#'             url = "https://github.com/JuliaDatabases")
gen_bib_url <- function(handle,
                        url,
                        title = handle,
                        date = Sys.Date(),
                        clipboard = FALSE) {

  bib <-
    glue::glue("@misc{[[handle]],
              title = {[[title]]},
              howpublished = {[[url]]},
              note = {Accessed: [[date]]}
             }",
               .open = "[[",
               .close = "]]")

  if (clipboard){
    message("writing bib to clip board")
    clipr::write_clip(bib)
    return(bib)
  }

  if (!clipboard){
    return(bib)
  }
}
