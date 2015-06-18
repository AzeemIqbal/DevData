require(datasets)
require(randomForest)
data(cars, package = 'datasets')
require(caret)
fitlm <- train(dist ~ ., method = 'lm', data = cars)
fitrf <- randomForest(dist ~ ., data = cars)

shinyServer(
  function(input, output) {
    a <- reactive(predict(fitlm, data.frame(speed = input$sp)))
    b <- reactive(predict(fitrf, data.frame(speed = input$sp)))
    output$lmout <- renderPrint(a())
    output$rfout <- renderPrint(b())
  }
)


