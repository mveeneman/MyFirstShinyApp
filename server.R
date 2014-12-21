library(shiny)
library(XML)

getTicker <- function(ticker) {
url = paste0("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22", ticker, "%22%29&env=store://datatables.org/alltableswithkeys")
  xml = xmlTreeParse(url, useInternalNodes=TRUE) # take a look at the xml output:
  name=xpathSApply(xml,"//results/quote/Name",xmlValue)
  close=xpathSApply(xml,"//results/quote/PreviousClose",xmlValue)
  open=xpathSApply(xml,"//results/quote/Open",xmlValue)
  return(paste0("Results for ",ticker," :",name,"  Open:",open,"  Previous Close:",close ))
}

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$ticker})
    output$tickerValue <- renderPrint({getTicker(input$ticker)})
  }
)