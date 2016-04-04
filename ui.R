# Author - Anupama Rajaram
# ui.R file for showing salary variations for highly skilled immigrant workers.

# Shiny app called "immi-sal" 
# weblink = https://anurajaram.shinyapps.io/immi-sal/

# sidebar allows selection of 3 types of charts
#     (a) Median salary by US state
#     (b) Salary by visa class - greencard, H1-B, etc.
#     (c) Salary by industry/ job title

library(shiny)

# load the salary dataset
sal_data <- read.csv("salary.csv", header = TRUE)


library(ggplot2)


# code to format page layout, input selection on left, output chart on right
fluidPage(
  
  titlePanel("Skilled Immigrant Salary Explorer"),
  
  sidebarPanel(
    # code below provides users with a dropdown box with 3 options
    selectInput("plotseln", 
                label = " Select plot for viewing",
                choices = c("Salary by State", 
                            "Salary by Visa class",
                            "Salary by Industry"),
                # also specifying default selection
                selected = "Salary by Visa class")
    
  ),
  
  # main panel which will display the charts based on selection
  # call to object in server.R file
  mainPanel(
    plotOutput("distPlot")
    
  )
)
