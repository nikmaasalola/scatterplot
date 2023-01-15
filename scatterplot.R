data=read.csv("E:/2015.csv",head=TRUE)
View(data)
data$Happiness.Score
names(data)<-c("Country","Region","Happiness_Rank","Happiness_Score",
               "Standard_Error","Economy","Family","Health","Freedom",
               "Corruption","Generossity",
               "Dystopia_Residual")
names(data)
data$Economy
str(data)
tail(data)
head(data)


library(corrplot)
num.cols<-sapply(data,is.numeric)
num.cols
cor.data<-cor(data[,num.cols])
cor.data
corrplot(cor.data,method = "color")
corrplot(cor.data,method = "color",tl.cex = 0.5)

plot(x=data$Health,y=data$Happiness_Score,frame=FALSE)
plot(x=data$Health,y=data$Happiness_Score,pch=16,
     frame=FALSE,xlab = "Health",ylab = "Happiness Score",col="red",
     main="Happiness Score VS Health")
library(ggplot2)
help.search("geom_",package = "ggplot2")
ggplot(data,aes(x=Health,y=Happiness_Score))+geom_point()
ggplot(data,aes(x=Health,y=Happiness_Score))+
  geom_point()+scale_x_continuous("Health")+
  scale_y_continuous("Happiness Score")+
  labs(title = "Happiness Score vs Health")+theme_bw()

#MENGGAMBARKAN KATEGORI YANG TERPISAH
ggplot(data,aes(x=Health,y=Happiness_Score))+
  geom_point(aes(color=Region))+scale_x_continuous("Health")+
  scale_y_continuous("Happiness Score")+
  labs(title = "Happiness Score vs Health")+theme_bw()

#MENGGAMBARKAN KATEGORI YANG TERPISAH
ggplot(data,aes(x=Health,y=Happiness_Score))+
  geom_point(aes(color=Region))+scale_x_continuous("Health")+
  scale_y_continuous("Happiness Score")+
  labs(title = "Happiness Score vs Health")+theme_bw()+
  facet_wrap(~Region)


#HISTOGRAM
hist(data$Corruption)
hist(data$Corruption,xlab="Trust Goverment Corruption",
     ylab="Frequency",main="Histogram of Trust Goverment Corruption")

#HISTOGRAM GGPLOT2
ggplot(data,aes(x=Corruption))+
  geom_histogram()+
  scale_x_continuous("Trust Goverment Corruption",breaks = seq(0,0,6,by=0,1))+
  scale_y_continuous("Frequency",breaks = seq(0,20,by=5))+
  labs(title("Histogram of Trust Goverment Corruption"))
  labs(title = "Happiness Score vs Health")+theme_bw()