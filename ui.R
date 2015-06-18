shinyUI(pageWithSidebar(
  headerPanel("Predicting stopping distances"),
  sidebarPanel(
    h3('Input the values you wish to predict'),
    numericInput('sp', 'Input speed (mph)', 5, min = 0, max = 30, step = 1),
    submitButton('Submit'),
    h3('Your predicted stopping distances (ft)'),
    p('Using the lm method (linear model)'),
    verbatimTextOutput("lmout"),
    p('Using the random forest method'),
    verbatimTextOutput("rfout")
  ),
  mainPanel(
    h4('This is a small webapp that will predict the stopping 
       distance of a car given its speed. The model is built on the cars
       dataset in the datasets package for R, which itself is based on cars that existed in 1920s USA'),
    h4('We use 2 models to try to predict the stopping distance, one is simple linear regression.
       The other model is much more complex, but one we have seen before, random forests.'),
    h4('The code to build the models can be seen here'),
    code('require(datasets)
require(randomForest)'),
    code('data(cars, package = "datasets")
require(caret)'),
    code('fitlm <- train(dist ~ ., method = "lm", data = cars)'),
    code('fitrf <- randomForest(dist ~ ., data = cars)')
)
)
)