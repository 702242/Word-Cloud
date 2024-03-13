library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("NLP")


getwd()
setwd("C:/Users/namra/Desktop/KHUSHI/SK - DATA SCIENCE--R")
text=readLines(file.choose())
docs=Corpus(VectorSource(text))
inspect(docs)#Corpus are collections of documents containing (natural language) text
docs=tm_map(docs,content_transformer(tolower))
inspect(docs)
docs=tm_map(docs,removeNumbers)
inspect(docs)
docs=tm_map(docs,removeWords,stopwords("english"))
inspect(docs)
###
docs=tm_map(docs,removePunctuation)
inspect(docs)
docs=tm_map(docs,stripWhitespace)#for removing extra white space
inspect(docs)
dtm=TermDocumentMatrix(docs)
inspect(dtm)

m=as.matrix(dtm)
View(m)
v=sort(rowSums(m),decreasing = TRUE)
View(v)

d=data.frame(word=names(v),freq=v)
View(d)

set.seed(1234)
wordcloud(words=d$word,freq = d$freq,min.freq = 1,max.words = 200,random.order = FALSE,rot.per = 0.35,colors = brewer.pal(8,"Dark2"))

