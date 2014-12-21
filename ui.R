library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Get Quotes"),
    
    sidebarPanel(
      textInput('ticker', "Please specify the ticker name:" , "AAPL"),
      submitButton('Submit')
    ),
    mainPanel(
      h4("You've search for:"),
      verbatimTextOutput("inputValue"),
      h4('Available results:'),
      verbatimTextOutput("tickerValue")
    )
  )
)