App to Predict Your Vehicle MPG
====================================

author: "ACQL"
date: "26 April 2015"

====================================

## Page 2 - Introduction

- The shiny app under development allows a user to enter some basic information about their vehicle, and obtain a prediction for its MPG.  The app relies on a simple GLM algorithm and a data set "auto MPG" from the UCI Machine Learning Repository located [here](http://bit.ly/1sgiKaS).


====================================

## Page 3 - The Algorithm

```r
library(RCurl)
library(caret)
mpg <- getURL("https://docs.google.com/spreadsheets/d/12s5WVmzalqI4rwVkahBrtewMxFFPJwue4-vOq_atv4M/pubhtml")
mpg <- read.csv(text = mpg)
modFit <- train(mpg ~ cyl + disp + horse + weight + accel + year + origin, method="glm", data=mpg)
```
- The simple GLM model has a $RMSE$ of 3.35, and an $R^2$ of 0.818.  While other more complex algorithms were implemented, they yielded small improvements at the cost of much longer execution times so the GLM model was chosen as the backbone of the shiny app.


====================================

## Page 4 - Algorithm Predictions

<a href="http://tinypic.com?ref=so8eab" target="_blank"><img src="http://i58.tinypic.com/so8eab.png" border="0" alt="Image and video hosting by TinyPic"></a>


***
- The relative 45 degree line shape of this simple plot of actual vs. predicted MPG values demonstrates the simple GLM's decent fit.


====================================

## Page 5 - Shiny App

<a href="http://tinypic.com?ref=i4mm8j" target="_blank"><img src="http://i62.tinypic.com/i4mm8j.png" border="0" alt="Image and video hosting by TinyPic"></a>

***
- This is a screenshot of the deployed shiny app.  It was tested and worked for various combinations of numeric inputs. It is available [here](https://acql.shinyapps.io/devdatapdt/).

