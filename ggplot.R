getwd()
setwd("C:\\users\\apeks\\Desktop\\R-online")
getwd()



MR<-read.csv("P2-Movie-Ratings.csv")
head(MR)
tail(MR)
str(MR)
MR$Genre<-factor(MR$Genre)
str(MR)
summary(MR)
colnames(MR)<-c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
MR$Year<-factor(MR$Year)
MR$Film<-factor(MR$Film)
summary(MR)

Action<-MR[MR$Genre=="Action",]

Action
summary(Action)

Action$Genre<-factor(Action$Genre)

summary(Action)
str(MR)


#Aesthetics.............
library(ggplot2)

ggplot(data=MR, aes(x=CriticRating, y=AudienceRating))


#add geometry

ggplot(data=MR, aes(x=CriticRating, y=AudienceRating))+
  geom_point()

#add color

ggplot(data=MR, aes(x= CriticRating, y=AudienceRating, color=Genre))+
  geom_point()


#add size

ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, color=Genre, size=Genre))+
  geom_point()


#add size in a good way

ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))+
  geom_point()


#plotting with layers

p<-ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

p
#line
p+geom_line()

#multiple layers

p+geom_line() + geom_point()


#overriding aesthetics

p + geom_point(aes(size=CriticRating))

p+ geom_point(aes(color=BudgetMillions))

p + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget in Million")

p + geom_line(size=1) + geom_point()

#...................Mapping vs setting

r<-ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, color=Genre, size = BudgetMillions))

#Mapping
r+geom_point(aes(color=Genre))

#Setting
r+geom_point(colour="Purple")


#histogram and density charts

s<-ggplot(data=MR, aes(x=BudgetMillions))
s
s+geom_histogram(binwidth = 10)

#add color

s+geom_histogram(binwidth = 10, aes(fill=Genre),color="Black")


#density charts

s+geom_density(aes(fill=Genre))
s+geom_density(aes(fill=Genre), position="Stack")


#...............starting layer tips



t<-ggplot(data=MR, aes(x= AudienceRating))
t+geom_histogram(binwidth=10, 
                 fill="White",color="Blue")

#another way

t<-ggplot(data=MR)

t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),fill="White", color="Blue")
t+geom_histogram(binwidth=10, aes(x=CriticRating), fill="White", color="Blue")

#................Statistical transformation

u<-ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, color=Genre))
u
u+geom_point() + geom_smooth(fill=NA)

u<-ggplot(data=MR, aes(x=Genre, y=AudienceRating, color=Genre))
u+geom_boxplot(size=1.2) + geom_jitter()

u+geom_jitter()+geom_boxplot(size=1.2, alpha=0.5)

w<-ggplot(data=MR, aes(x=Genre, y=CriticRating, color=Genre))

w+geom_jitter()+geom_boxplot(size=1.2, alpha=0.5)

#..........using facets

v<-ggplot(data=MR, aes(x= BudgetMillions))

v+geom_histogram(binwidth=10, aes(fill=Genre), color="Black")+
  facet_grid(Genre~., scales="free")

#using facets in scatter plot

z<-ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, color=Genre))

z + geom_point(size=3)

#facets

z + geom_point(size=3)+facet_grid(Genre~Year) 

z + geom_point(aes(size=BudgetMillions))+geom_smooth()+facet_grid(Genre~Year) 

#coordinates

m<-ggplot(data=MR, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, color=Genre))
m+geom_point()

m+geom_point()+
  xlim(50,100)+
  ylim(50,100)

#won't work well always

n<-ggplot(data=MR, aes(x=BudgetMillions))

n + geom_histogram(binwidth = 10, aes(fill=Genre),color="Black")+
  ylim(0,50)
#here we lost the data :(

#instead zoom
n + geom_histogram(binwidth = 10, aes(fill=Genre),color="Black")+
  coord_cartesian(ylim=c(0,50))

z + geom_point(aes(size=BudgetMillions))+geom_smooth()+facet_grid(Genre~Year)+coord_cartesian(ylim=c(0,100))

#...........theme

o<-ggplot(data=MR, aes(x=BudgetMillions))

h<-o+geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")
h

#axes labels
h+xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x=element_text(color="DarkGreen",size=20), axis.title.y=element_text(color="DarkGreen", size=20))

#tick mark formatting
h+xlab("Money Axis")+
  ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x=element_text(color="DarkGreen",size=20), 
        axis.title.y=element_text(color="DarkGreen", size=20),
        axis.text.x=element_text(size=15),
        axis.text.y=element_text(size=15),
        legend.title=element_text(size=15),
        legend.text=element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="DarkBlue", size=25,
                                  family="Courier"))

?theme






