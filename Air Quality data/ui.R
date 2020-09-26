#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Air Quality",
                   
                   fluidPage(
                       
                       # Application title
                       titlePanel("Air Quality"),
                       
                       # Input here the linear regression code and the code has
                       # to be included in sidebar layout I think followed by ,
                       # change the plot and data according to server code
                       
                       #THIS IS TO CREATE THE PLOTS WITH REGRESSION LINES
                       
                       tabsetPanel(type = "tabs", 
                                   tabPanel("Histogram", fluid=TRUE,
                                            sidebarLayout(
                                                sidebarPanel(
                                                    selectInput("var", "Choose a variable:", 
                                                                choices = c("Ozone", "Solar Radiation", "Wind")),
                                                    br(),
                                                    sliderInput("bins", "Number of bins:",
                                                                min = 1,
                                                                max = 50,
                                                                value = 30),
                                                    br(),
                                                    helpText("Note: Data contains daily air quality measurements in",
                                                             "New York State (May to September)."),
                                                    submitButton("Submit")
                                                ),
                                                mainPanel(
                                                    plotOutput("plot")
                                                    )
                                                )
                                            ),
                                   tabPanel("Scatterplot", fluid=TRUE,
                                            sidebarLayout(position = "left",
                                                          sidebarPanel(
                                                              sliderInput("Solar",
                                                                          "Slide Solar: ",
                                                                          min = 7,
                                                                          max = 334,
                                                                          value = c(115,258), width = "1400px"),
                                                              sliderInput("Wind",
                                                                          "Slide Wind: ",
                                                                          min = 1.7,
                                                                          max = 20.7,
                                                                          value = c(7.4,11.5), width = "1400px"),
                                                              selectInput(
                                                                  inputId = "Month",
                                                                  label = "Choose Month:",
                                                                  choices = c("May", "June", "July", "August", "September"),
                                                                  selected = "May",
                                                                  multiple = TRUE),
                                                              helpText("Note: the initial position of the slidebar represents", 
                                                                       "the 25% and 75% quantile. All months can be selected simultaneously"),
                                                              submitButton("Submit")
                                                          ),
                                                          mainPanel(
                                                              plotOutput("OzonePlot"),plotOutput("SolarPlot")
                                                          )))
                       ))
))
                      
