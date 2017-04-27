library(shiny) ; library(readxl) ; library(dplyr) ; library(plotly) ; library(forecast) ; library(Hmisc)
path <- "/Users/Caner/Desktop/Data/Coursera-Developing Data Products/CountryGDP"
GDP_melted <- read_excel("GDP_melted.xlsx" , sheet = "Data")
shinyServer(function(input, output) {
    output$plot <- renderPlotly({
          inityear <- input$Year[1]
          endyear <-  input$Year[2]
          CountryInput <- input$Country
          selectedcountrydata <- filter(GDP_melted, Country == CountryInput)
          forecastdata <- ts(selectedcountrydata$GDP)
          arimafit <- auto.arima(forecastdata)
          predicted_vals <- as.numeric(forecast(forecastdata, h= 5 , model = arimafit)$mean)
          futureinterval <- c(2016:2020)
          predictiondf <- data.frame(Country = CountryInput, Year = futureinterval, GDP = predicted_vals)
          predictiondf$Country <- as.character(predictiondf$Country) ; predictiondf$Year <- as.numeric(predictiondf$Year)
          GDP_melted <- rbind(GDP_melted[,-1],predictiondf)
          dftoplot <- filter(GDP_melted, Year >= inityear & Year <= endyear & Country == CountryInput)
          b <- cut2(dftoplot$Year,c(2016))
          plot_ly(data = dftoplot, x = ~Year, y = ~GDP , type = 'scatter',mode = 'lines+markers',color = b) %>% 
              layout(title = "",
                    xaxis = list(title = ''),
                    yaxis = list(title = 'GDP in billion $') 
          )
        })
    output$event <- renderPrint({
        d <- event_data("plotly_hover")
        if (is.null(d)) "Hover on a point" else d
    })
})


