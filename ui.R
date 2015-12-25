# Refer to this example to create tabs and navigation bar
# http://shiny.rstudio.com/gallery/navbar-example.html
# http://shiny.rstudio.com/gallery/including-html-text-and-markdown-files.html
library(shiny)
library(markdown)

shinyUI(navbarPage("Predict mpg",
           # headerPanel("Predict the miles per gallon (mpg) based on user input"),
           tabPanel("Prediction APP",
                    sidebarLayout(
                        sidebarPanel(
                            h2("Predict the miles per gallon (mpg) based on user input"),
                            h3("Please note that there are 3 tabs for this app 'Prediction APP', 'Regression Model', and 'Documentation'. You can choose them by clicking them on the top of the app. "),
                            br(),
                            radioButtons("am", "Transmission Type",
                                         c("Automatic" = "Automatic",
                                           "Manual" = "Manual")),
                            
                            radioButtons("cyl", "Number of Cylinders",
                                               c("4" = "4",
                                                 "6" = "6",
                                                 "8" = "8")),
                            
                            sliderInput('wt', 'Weight of the Car in Tons',value = 3.5, min = 1.5, max = 5.5, step = 0.1)
                        ),
                        mainPanel(
#                                 p('Transmission Type'),
#                                 textOutput('am'),
#                                 p('Number of Cylinders'),
#                                 textOutput('cyl'),
#                                 p('Weight in Tons'),
#                                 textOutput('wt'),
                                h3('Prediction of Miles per Gallon (mpg)'),
                                h1(textOutput('p_mpg'))
                        )
                    )
           ),
           
           tabPanel("Regression Model",
                    verbatimTextOutput("summary")
           ),
           
           tabPanel("Documentation",
                    includeMarkdown("README.md"))
))