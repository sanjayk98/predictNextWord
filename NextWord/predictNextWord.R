library(dplyr)
library(backports)
library(tidytext)   
library(stringr)
library(tibble)
library(SnowballC)

clean_data<-function(data){
  d <- data_frame(txt=data)
  url_words <- data_frame(word = c("https","http"))
  d$txt <- gsub("[^\x20-\x7E]", "", d$txt) #remove non-ascii
  tidy_dataset <- d %>%
    unnest_tokens(output = word, input = txt) %>% #seperate as words
    filter(!str_detect(word, "^[0-9]*$"))  %>%  # remove numbers
    anti_join(get_stopwords(),by="word")  %>%  # remove snowball stop words
    anti_join(url_words,by="word")     # remove some urls
  #mutate(word = SnowballC::wordStem(word))    # apply a stemming procedure
  d<-data_frame(txt=unlist(tidy_dataset))
  return(d)
}

predictWord1<-function (nword,data1) {
  ngram<-1
  next_word<-""
  prob<-0
  d<-data.table(next_word,prob,ngram)
  nword<-as.character(nword)
  #data1<-readRDS(destfile1)
  data1<-data1[[2]]
  
  filtered_word<-data1 %>% filter(startsWith(word1,nword)) %>% top_n(3,prob)
  # if (length(filtered_word$word1)>=3){
  next_word<-filtered_word$word1
  prob<-filtered_word$prob
  
  if (length(next_word)>0) {
    ngram<-rep(ngram, each =length(next_word) )
    d<-data.table(next_word,prob,ngram)
  }
  
  
  if (nrow(d)>3)  d<-d[1:3,]          
  
  return(d)
}

predictWord2<-function (word,data1,data2) {
  # print("i am in predictword2")
  #  print(word)
  ngram<-2
  prob<-0
  #d<-data.table(next_word,prob,ngram)
  word<-as.character(word)
  #data2<-readRDS(destfile2)
  data2<-data2[[2]]
  next_word<-""
  filtered_bigram<-data2 %>% filter(word1==word)  %>% top_n(3,prob)
  #next_word<-filtered_bigram$word2[1]
  
  prev_word1<-filtered_bigram$word1
  next_word<-filtered_bigram$word2
  prob<-filtered_bigram$prob
  if (length(next_word)>0) {
    ngram<-rep(ngram, each =length(next_word) )
    d<-data.table(prev_word1,next_word,prob,ngram)
  }
  
  
  
  if (is.na(next_word[1]))  {
    d<-predictWord1(word,data1)
    
  }
  #if (is.na(ngram[1])) 
  # ngram[1]<-1
  #else if (ngram[1]==1)
  # d<-data.table(next_word,prob,ngram)
  #else if (ngram[1]==2)
  
  
  # else  d<-data.table(next_word,prob,ngram)
  if (nrow(d)>3)  d<-d[1:3,]          
  
  return(d)
}

predictWord3<-function (nword1,nword2,data1,data2,data3) {
  ngram<-3
  prob<-0
  next_word<-""
  nword1<-as.character(nword1)
  nword2<-as.character(nword2)
  # data3<-readRDS(destfile3)
  data3<-data3[[2]]
  filtered_trigram<-data3 %>% filter((word1==nword1)&(word2==nword2))  %>% top_n(3,prob)
  
  prev_word1<-filtered_trigram$word1
  prev_word2<-filtered_trigram$word2
  next_word<-filtered_trigram$word3
  prob<-filtered_trigram$prob
  ngram<-rep(ngram, each =length(next_word))
  if (length(next_word)>0) {
    ngram<-rep(ngram, each =length(next_word) )
    d<-data.table(prev_word1,prev_word2,next_word,prob,ngram)
  }
  
  
  if (is.na(next_word[1])) {
    d<-predictWord2(nword2,data1,data2)
    
  }
  
  
  if (nrow(d)>3)  d<-d[1:3,]          
  
  return(d)
}
predictWord4<-function (nword1,nword2,nword3,data1,data2,data3,data4) {
  ngram<-4
  prob<-0
  next_word<-""
  nword1<-as.character(nword1)
  nword2<-as.character(nword2)
  nword3<-as.character(nword3)
  
  #data4<-readRDS(destfile4)
  
  data4<-data4[[2]]
  filtered_fourgram<-data4 %>% filter((word1==nword1)&(word2==nword2)&(word3==nword3)) %>% top_n(3,prob)
  prev_word1<-filtered_fourgram$word1
  prev_word2<-filtered_fourgram$word2
  prev_word3<-filtered_fourgram$word3
  next_word<-filtered_fourgram$word4
  prob<-filtered_fourgram$prob
  if (length(next_word)>0) {
    ngram<-rep(ngram, each =length(next_word))
    d<-data.table(prev_word1,prev_word2,prev_word3,next_word,prob,ngram) 
  }
  
  if (is.na(next_word[1])) {
    d<-predictWord3(nword2,nword3,data1,data2,data3)
    
    
    
  }
  
  
  
  if (nrow(d)>3)  d<-d[1:3,]          
  
  return(d)
}

predictNextWord<-function(sentence,data1,data2,data3,data4) {
  
  
  
  data<-data_frame(word=unlist(clean_data(sentence)))
  data=data_frame(word=unlist(sentence))
  words <- data.table(data) %>%
    unnest_tokens(word1,word, token = "ngrams", n = 1)
  # print(words)
  n<-nrow(words)
  
  if (n==1) next_word<-predictWord2(words[n,1],data1,data2)
  if (n==2) next_word<-predictWord3(words[n-1,1],words[n,1],data1,data2,data3)
  if (n>=3) next_word<-predictWord4(words[n-2,1],words[n-1,1],words[n,1],data1,data2,data3,data4)
  
  
  
  return(next_word)
}