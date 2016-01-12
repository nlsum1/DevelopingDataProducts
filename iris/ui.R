##ui.R

fluidPage(pageWithSidebar(
  headerPanel("Predicting species of Iris"),
  sidebarPanel(
    h3("Measurements of Iris"),
    numericInput('sepalLength', 'Sepal Length (cm)', 0, min = 0, max = 100, step = 1),
    numericInput('sepalWidth', 'Sepal Width (cm)', 0, min = 0, max = 100, step = 1),
    numericInput('petalLength', 'Petal Length (cm)', 0, min = 0, max = 100, step = 1),
    numericInput('petalWidth', 'Petal Width (cm)', 0, min = 0, max = 100, step = 1),
    actionButton("submitAction", "Submit")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Prediction",
    h3('Predicted species:'),
    verbatimTextOutput("species")),
    tabPanel("Plot", 
             h5('Observe Iris scatter plot by selecting measurement type'),
             selectInput("selectPloty", "y :",
                         c("Sepal Length" = 1,
                           "Sepal Width" = 2,
                           "Petal Length" = 3,
                           "Petal Width" = 4)),
             selectInput("selectPlotX", "x :",
                         c("Sepal Length" = 1,
                           "Sepal Width" = 2,
                           "Petal Length" = 3,
                           "Petal Width" = 4)),
             actionButton("createPlot", "Create Plot"),
             plotOutput("plot"))
    )
)
))