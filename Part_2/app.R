# 08-reactiveValues

# code outside the server function will
# be run once per R session (worker)
library(shiny)

ui <- fluidPage(
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),
  plotOutput("hist")
)

# code insid the server function will be run once per end suer
# (connection)
server <- function(input, output){
  
  # code inside a reactive function will be run once per reaction
  # (e.g. many times a minute)
  
  # reactiveValues() creates a list of reactive
  # values that can then be used further down!
  rv <- reactiveValues(data = rnorm(100))
  
  observeEvent(input$norm, { rv$data <-  rnorm(100) })
  observeEvent(input$unif, { rv$data <-  runif(100) })
  
  output$hist <- renderPlot({
    hist(rv$data)
  })
}

shinyApp(ui = ui, server = server)