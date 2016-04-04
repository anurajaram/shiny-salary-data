# Author - Anupama Rajaram
# server.R file for showing salary variations for highly skilled immigrant workers.

# Shiny app called "immi-sal" 
# weblink = https://anurajaram.shinyapps.io/immi-sal/

# Displays 3 types of charts, based on selection
#     (a) Median salary by US state
#     (b) Salary by visa class - greencard, H1-B, etc.
#     (c) Salary by industry/ job title


library(shiny)

# load the salary dataset for immigrant workers
sal_data <- read.csv("salary.csv", header = TRUE)


# function definition, to be used if input selection = "Salary by Visa class"
visapie <- function(){
  boxplot(PAID_WAGE_PER_YEAR~ VISA_CLASS, data=sal_data,
          col=(c("gold","darkgreen")),
          # specifying some color
          main="Salary by visa class", 
          xlab="Visa Class", ylab="Annual Salary")
}


library(ggplot2)



function(input, output) {
  # call from ui.R file comes here
  # we will display output based on input selection, so using switch statement
  output$distPlot <- renderPlot({
    data <- switch(input$plotseln, 
                   "Salary by State" = plot(sal_data$WORK_STATE, 
                                            sal_data$PAID_WAGE_PER_YEAR,
                                            main="Salary by visa class", 
                                            xlab="Visa Class", 
                                            ylab="Annual Salary"),
                   
                   "Salary by Visa class" = visapie(), # call to pre-defined function
                   
                   "Salary by Industry" = plot(sal_data$JOB_TITLE_SUBGROUP,
                                               sal_data$PAID_WAGE_PER_YEAR,
                                               col=(c("gold","darkgreen")),
                                               main="Salary by Industry type", 
                                               xlab="JOb title", 
                                               ylab="Annual Salary")
                   )
    
    print(p)
    
  })
  
}


