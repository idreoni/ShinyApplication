#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$OzonePlot <- renderPlot({
        a <- seq(min(input$Solar), max(input$Solar), by = .1)
        airquality$Month <- month.name[airquality$Month]
        y <- airquality[airquality$Solar.R %in% a & !(is.na(airquality$Ozone)) & airquality$Month %in% input$Month, ]
        g <- ggplot(data = y, aes(Solar.R, Ozone))
        g <- g + geom_point(aes(col = Month),size=3)
        g <- g + geom_smooth(method="lm", col="firebrick", size=2) 
        g <- g + labs(x="Solar radiation", y="Ozone")
        g
    })
    
    output$SolarPlot <- renderPlot({
        a <- seq(min(input$Wind), max(input$Wind), by = .1)
        airquality$Month <- month.name[airquality$Month]
        y <- airquality[airquality$Wind %in% a & !(is.na(airquality$Ozone)) & airquality$Month %in% input$Month, ]
        g <- ggplot(data = y, aes(Wind, Ozone))
        g <- g + geom_point(aes(col = Month),size=3)
        g <- g + geom_smooth(method="lm", col="firebrick", size=2) 
        g <- g + labs(x="Average wind speed", y="Ozone")
        g
    })
    
    data <- reactive({
        switch(input$var,
               "Ozone" = airquality$Ozone,
               "Solar Radiation" = airquality$Solar.R,
               "Wind" = airquality$Wind)
    })
    
    output$plot <- renderPlot({
        var <- input$var
        bins <- seq(min(data(),na.rm = TRUE), max(data(), na.rm = TRUE), length.out = input$bins + 1)
        hist(data(),na.rm = TRUE,breaks = bins, xlab = var, col='lightblue',main='Histogram')
        })
})
