library(shiny)
ui <- fluidPage(
  # *Input() functions
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  
  # *Output() functions
  # output() adds a space in the ui for an R object
  # we still must build the object in the server fuction below!
  plotOutput("hist")
)

# tell the server how to assemble inputs into outputs
server <- function(input, output) {
  # both input- and output-objects in the server will be list-like objects
  
  # use 3 rules to display to output$
  # (1) when building outputs, save them to the output-object
  # (which, essentially, is nothing other than a list)
  # (2) what we save into output should be sth build with a render-function
  # (to place an R-object as html onto the web-page)
  # (3) use input values with input$ when we make our outputs
  
  # our first render-function:
  output$hist <- renderPlot({ 
    title <- "100 random normal values"
    hist(rnorm(input$num), main = title) 
  })
  
  
}

shinyApp(ui = ui, server = server)