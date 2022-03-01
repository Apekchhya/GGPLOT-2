getwd()
setwd("C:\\users\\apeks\\Desktop\\R-online\\GGPLOT")
getwd()
movie<-read.csv("HW.csv")
head(movie)
colnames(movie)
movie$Genre<-factor(movie$Genre)


movie$Genre
summary(movie)

a<-movie$Genre=="action"|movie$Genre=="adventure"|movie$Genre=="animation"|movie$Genre=="comedy"|movie$Genre=="drama"
filter1<-movie[a,]
str(filter1)
summary(filter1)
filter1$Genre<-factor(filter1$Genre)
str(filter1)

filter1$Studio<-factor(filter1$Studio)
b<-filter1$Studio=="Buena Vista Studios"|filter1$Studio=="Fox"|filter1$Studio=="Paramount Pictures"|filter1$Studio=="Sony"|filter1$Studio=="Universal"|filter1$Studio=="WB"
filter2<-filter1[b,]
summary(filter2)
filter2$Studio<-factor(filter2$Studio)
summary(filter2)
summary(movie)
movie$Studio<-factor(movie$Studio)
str(filter2)

p<-ggplot(data=filter2,aes(x=Genre, y=Gross...US))
q<-p+geom_jitter(aes(color=Studio,size=Budget...mill.),)+geom_boxplot(alpha=0.6)
q+xlab("Genre")+ylab("Gross % US")+
  ggtitle("Domestic Gross % by Genre")+
  theme(axis.title.x=element_text(color="Blue",size=20),
        axis.title.y=element_text(color="Blue",size=20),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=10),
        legend.title=element_text(color="Black",size=12),
        legend.text=element_text(color="Black",size=8),
        plot.title=element_text(color="Black",size=25))
        
  
  
  
  
  
  
  
  
  
