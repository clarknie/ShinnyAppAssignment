library(shiny)
data(mtcars)

mtcars$am <- as.numeric(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)
fit <- lm(mpg ~ am + wt + cyl, data = mtcars )
summary(fit)

shinyServer(
  function(input, output) {
      output$am <- renderText({input$am})
      output$cyl <- renderText({input$cyl})
      output$wt <- renderText({input$wt})
      output$summary <- renderDataTable({summary(fit)$coef})
      output$summary <- renderPrint({summary(fit)$coef})
      output$summary <- renderPrint({summary(fit)})
      # output$summary <- renderDataTable({mtcars})
      
      # predict based on fitted linear model
      am <- reactive(ifelse(input$am == "Automatic", 0, 1))
      cyl <- reactive(as.factor(input$cyl))
      newCar <- reactive(data.frame(am = am(), wt = input$wt, cyl = cyl()))
      
      output$p_mpg <- renderText({round(predict(fit, newdata = newCar()),1)})
  }
)
