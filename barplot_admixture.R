
library(RColorBrewer)

data<- read.delim("data_admixture.5.Q.txt", sep = "", header = T)
rownames(data)<- data[,7]
data<- data[,-7]
head(data)

mm<- t(as.matrix(data[,c(1:5)]))
barplot(mm,col=rainbow(5),xlab="Individual #", ylab="Ancestry",border=NA)

