

#Url to the webpage on the internet by Greg.
url <- "http://blog.yhathq.com/static/misc/data/pigeon-racing.csv"
#This script first checks if the CSV file already exists, if not it will download the file.If it already exists it will reuse the existing file.
if (!file.exists('pigeon-racing.csv')) {
        download.file(url, 'pigeon-racing.csv')
}

#Read the data to a dataframe.
pigeon<-read.csv("pigeon-racing.csv", header = TRUE)
summary(pigeon)

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        # Expression that generates a histogram. The expression is
        # wrapped in a call to renderPlot to indicate that:
        #
        #  1) It is "reactive" and therefore should re-execute automatically
        #     when inputs change
        #  2) Its output type is a plot
        
        output$distPlot <- renderPlot({
                x    <- pigeon[, 9]  # Pigeon racing data set
                bins <- seq(min(x), max(x), length.out = input$bins + 1)
                
                # draw the histogram with the specified number of bins
                hist(x, breaks = bins, col = 'lightblue', border ='white',main ="Histogram of Pigeon's Speed")
        })
})

