#
# This is a Shiny web application built for Dr. Bradley Carter's lab at University of Wisconsin-Eau Claire. It was created and is maintained by Maggie Westerland westersm9447@uwec.edu.You can run the application by clicking the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(DT)

ui <- basicPage(
  titlePanel("This is a Shiny web application built for Dr. Bradley Carter's lab at University of Wisconsin-Eau Claire."),
  "It was created and is maintained by Maggie Westerland westersm9447@uwec.edu.",
  sidebarLayout(
    sidebarPanel(
      fileInput(inputId = "file1", label = "Upload .csv file here",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      )
    ),
    mainPanel(
      DT::dataTableOutput("file1")
    )
  )
)
server <- function(input, output) {
  output$file1 = DT::renderDataTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    subset(read.csv(inFile$datapath))
  })
}

shinyApp(ui, server)

