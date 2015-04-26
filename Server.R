library(shiny)
library(RCurl)
library(caret)
mpg <- getURL("https://docs.google.com/spreadsheets/d/12s5WVmzalqI4rwVkahBrtewMxFFPJwue4-vOq_atv4M/pubhtml")
mpg <- read.csv(text = mpg)
modFit <- train(mpg ~ cyl + disp + horse + weight + accel + year + origin, method="glm", data=mpg)
shinyServer(
  function(input, output) { 
    #pred = predict(modFit, data)
    #output$prediction <- renderPrint ({as.string(pred)})
    output$prediction <- renderPrint ({
      cyl = input$cyl
      disp = input$disp
      horse = input$horse
      weight = input$weight
      accel = input$accel
      year = input$year
      origin = input$origin
      predict(modFit,data.frame(cyl, disp, horse, weight, accel, year, origin))})
  }
)
