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

destfile4<-"https://www.dropbox.com/s/x8iw5503silrrni/model_quadgram.RDS?dl=0"
destfile3<-"https://www.dropbox.com/s/gjgw9ufyg1fk1ub/model_trigram.RDS?dl=0"
destfile2<-"https://www.dropbox.com/s/26a427ox1s8c9sr/model_bigram.RDS?dl=0"
destfile1<-"https://www.dropbox.com/s/czov141q5uby39l/model_unigram.RDS?dl=0"

data1<-readRDS(url(destfile1))
data2<-readRDS(url(destfile2))
data3<-readRDS(url(destfile3))
data4<-readRDS(url(destfile4))


#nextword<-data.table(next_word=c("NA","NA","NA"),prob=c("NA","NA","NA"),Ngram=c("NA","NA","NA"))