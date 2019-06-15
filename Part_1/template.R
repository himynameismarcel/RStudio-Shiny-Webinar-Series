library(shiny)
ui <- fluidPage("Hello World")

server <- function(input, output) {
  # *Input() functions,
  # *Output() functions
}

shinyApp(ui = ui, server = server)