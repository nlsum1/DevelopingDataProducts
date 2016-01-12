##Server.R
library(UsingR)
library(caret)
library(e1071)
library(randomForest)
library(ggplot2)

##use Iris datasets
iris <-  read.csv(file="iris.csv", header=TRUE, sep=",")
set.seed(5432)

model <- train(Species~., data=iris, method="rf")

shinyServer(
  function(input, output) { 
    result <- reactive({
      header <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
      testdata <- data.frame(as.numeric(input$sepalLength) ,as.numeric(input$sepalWidth),as.numeric(input$petalLength),as.numeric(input$petalWidth))    
      names(testdata) <- header    
      pred <- predict(model, testdata)
      pred
    })
    
    plotresult <- reactive({     
      x <- as.numeric(input$selectPlotX)
      y <- as.numeric(input$selectPloty)
      if(x == y)
      {}
      else{
        ggplot(data = iris, aes_string(x = names(iris)[x], y=names(iris)[y])) + geom_point(aes(color =Species))
      }
    })
    
    blankResult <- reactive({c("Please enter all the measurements.")})
     
    output$species<- renderPrint({
      if (input$submitAction == 0){
       blankResult()
      }
        else{  
      isolate(result())}
      })
    
    output$plot <- renderPlot({
      input$createPlot
      isolate(plotresult())
      })
  })
    