#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(dplyr)
library(backports)
library(tidytext)   
library(stringr)
library(tibble)
library(SnowballC)
library(data.table)
library(ggplot2)


#destfile1<-"C:/Users/sanjayx/Desktop/coursera/swiftkey/Coursera-SwiftKey/final/en_US/model_unigram.RDS"
#destfile2<-"C:/Users/sanjayx/Desktop/coursera/swiftkey/Coursera-SwiftKey/final/en_US/model_bigram.RDS"
#destfile3<-"C:/Users/sanjayx/Desktop/coursera/swiftkey/Coursera-SwiftKey/final/en_US/model_trigram.RDS"
#destfile4<-"C:/Users/sanjayx/Desktop/coursera/swiftkey/Coursera-SwiftKey/final/en_US/model_quadgram.RDS"

#destfile4<-"https://github.com/sanjayk98/predictNextWord/blob/master/model_quadgram.RDS"
#destfile3<-"https://github.com/sanjayk98/predictNextWord/blob/master/model_trigram.RDS"
#destfile2<-"https://github.com/sanjayk98/predictNextWord/blob/master/model_bigram.RDS"
#destfile1<-"https://github.com/sanjayk98/predictNextWord/blob/master/model_unigram.RDS"
destfile1<-"./data/model_unigram.RDS"
destfile2<-"./data/model_bigram.RDS"
destfile3<-"./data/model_trigram.RDS"
destfile4<-"./data/model_quadgram.RDS"

data1<-readRDS(destfile1)
data2<-readRDS(destfile2)
data3<-readRDS(destfile3)
data4<-readRDS(destfile4)


#nextword<-data.table(next_word=c("NA","NA","NA"),prob=c("NA","NA","NA"),Ngram=c("NA","NA","NA"))