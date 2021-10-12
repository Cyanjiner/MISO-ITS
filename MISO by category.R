Faculty_2018_ <- read_csv("~/Desktop/Faculty__2018 .csv")
Faculty_2018_<-Faculty_2018_[-c(1),]
library(ggplot2)
library(descr)
library(reshape2)
Faculty_2018_$IMP_TMS[Faculty_2018_$IMP_TMS %in% c("-99","9") ]<-NA

Faculty_2018_<-Faculty_2018_[!is.na(Faculty_2018_$IMP_TMS),]

Faculty_2018_$ADIV<-as.numeric(Faculty_2018_$ADIV)
Faculty_2018_$ADIV[Faculty_2018_$ADIV == -99]<-NA
Faculty_2018_<-Faculty_2018_[!is.na(Faculty_2018_$ADIV),]

tab1<-ftable(Faculty_2018_$ADIV, Faculty_2018_$IMP_TMS)
tab1_rowProp<-prop.table(tab1, 1)
graph_data<-melt(data.frame(tab1_rowProp))
names(graph_data)<-c("ADIV","IMS","Freq","prop")

ggplot(data = graph_data)+
  geom_bar(aes(x=ADIV,y=prop,fill=IMS),position = "fill",stat = "identity", alpha=0.7)+
  ylab("Proportion of IMS Importance")+
  ggtitle("Proportion of IMS importance rating at each academic division")+
  xlab("Academic Divisions")

ggplot(data = Faculty_2018_)+
  geom_boxplot(aes(x=ADIV,y=IMP_TMS, fill=ADIV))+
  ylab("Importance")+
  xlab("Academic Divisions")
