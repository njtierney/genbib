#' Make it easier to cite web addresses
#' Based on 'Twitter Rant!' Addin UI from Bob Rudis; see
#'    \url{https://github.com/hrbrmstr/hrbraddins}
#'
#' @export
#'

gen_bib_addin <- function(){
  ui <- miniPage(
    gadgetTitleBar("Generate a Website BibTeX Entry!"),
    miniContentPanel(
      textAreaInput("inHandle", "Handle for Website", cols = 120, rows = 5),
      textAreaInput("inUrl", "Website URL", cols = 120, rows = 5),
      checkboxInput("inClipboard",
                    "Copy to Clipboard?", value = FALSE),
      htmlOutput("output")
    )
  )

  server <- function(input, output, session) {

    reactiveData <- reactive({
      dataHandle <- input$inHandle
      dataUrl <- input$inUrl
      dataClipboard <- input$inClipboard
      list(dataHandle,dataUrl, dataClipboard)
    })

    output$output <- renderText({
      gen_bib_url(handle = reactiveData()[[1]],
                  url = reactiveData()[[2]], clipboard = reactiveData()[[3]])
    })

    # Listen for 'done'.
    observeEvent(input$done, {
      invisible(stopApp())
    })
  }

  # Use a modal dialog as a viewer
  viewer <- dialogViewer("BibTeX on the Fly!", width = 1000, height = 800)
  runGadget(ui, server, viewer = viewer)
}
