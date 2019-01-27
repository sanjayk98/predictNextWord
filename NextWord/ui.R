#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Smart Keyboard"),
 
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
    
      textAreaInput(inputId="text", "", "Type here",height = "100px", width = "250px"),
      verbatimTextOutput("value")
    ),
    
    # Show a plot of the generated distribution
  
    mainPanel(
      h2("Top 3 predictions"),
      tableOutput("nextword"),
      plotOutput("p1")
  )
)))
