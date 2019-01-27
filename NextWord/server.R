#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source('predictNextWord.R')
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$nextword <-renderTable({
    nextword<-""
    nextword<-predictNextWord(input$text,data1,data2,data3,data4)
    #nextword1<-nextword[[1]]
    #prob1<-nextword[[2]]
    #ngram1<-nextword[[3]]
    #d<-data.table(data1[[2]])
    #d[prob>=prob1]
    if (nrow(nextword)>0)
             nextword
    else data.table(next_word=c("NA"),prob=c("0"),ngram=c("1"))
    #data.table(NextWord=nextword1,Probability=prob1,NGram=ngram1)  
  })
  output$p1<-renderPlot({
    
  })
  
})
