# Predict miles per gallon for a car

This is the documentation to accompany the Shiny APP for Coursera course of Data Product. 

## Abstract

This APP will calcuate the predicted miles per gallon (mpg) for a car. User needs to input the following 3 pieces of information before a prediction is generated:

> 1. Transmission type of automatic or manual
> 2. Number of cylinders
> 3. Weight of the car in tons

The first two inputs are through radio buttons while the last one is through a slider. 

In the backend (`server.R`), we use a linear model to fit a regression line based on the `mtcars` dataset available in R. Then the fitted model is combined with the user input data to predict the miles per gallon. 



