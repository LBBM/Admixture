
library(RColorBrewer)
library(ggplot2)

data<- read.delim("data_admixture.5.Q.txt", sep = "", header = T)
rownames(data)<- data[,7]
data<- data[,-7]
head(data)

#Pie Plot
df<-as.data.frame(table(data$POP))
head(df)
df<- subset(df, Var1 %in% c("AFR", "EUR", "SAS", "EAS", "NAM"))
df
# Compute percentages
df$fraction = df$Freq / sum(df$Freq)

# Compute the cumulative percentages (top of each rectangle)
df$ymax = cumsum(df$fraction)

# Compute the bottom of each rectangle
df$ymin = c(0, head(df$ymax, n=-1))

# Compute label position
df$labelPosition <- (df$ymax + df$ymin) / 2

# Compute a good label
df$label <- paste0(df$Var1, "\n value: ", df$Freq)

# Make the plot
ggplot(df, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Var1)) +
  geom_rect() +
  geom_text( x=1.8, aes(y=labelPosition, label=label), size=5) + # x here controls label position (inner / outer)
  scale_fill_brewer(palette=5) +
  scale_color_brewer(palette=5) +
  coord_polar(theta="y") +
  xlim(c(-1, 4)) +
  theme_void() +
  theme(legend.position = "none")



mm<- t(as.matrix(data[,c(1:5)]))
barplot(mm,col=rainbow(5),xlab="Individual #", ylab="Ancestry",border=NA)



library(ggplot2)
library(hrbrthemes)
library(ggpubr)

data_cor<- read.delim("data_cor_r.txt", sep = "", header = T)
head(data_cor)

df<- data_cor[,c(1,2)]
colnames(df)<- c("x","y")
head(df)

p1 <- ggplot(df, aes(x=x, y=y)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)+
  stat_cor(label.y = 0.8)+
  labs(x = "EUR", y="EUR_SCORGE")+
  xlim(0, 1)+
  ylim(0, 1)+
  theme_ipsum()
p1


df<- data_cor[,c(3,4)]
colnames(df)<- c("x","y")
head(df)

p2 <- ggplot(df, aes(x=x, y=y)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)+
  stat_cor(label.y = 0.8)+
  labs(x = "AFR", y="AFR_SCORGE")+
  xlim(0, 1)+
  ylim(0, 1)+
  theme_ipsum()
p2


df<- data_cor[,c(5,6)]
colnames(df)<- c("x","y")
head(df)

p3 <- ggplot(df, aes(x=x, y=y)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)+
  stat_cor(label.y = 0.8)+
  labs(x = "AES", y="AES_SCORGE")+
  xlim(0, 1)+
  ylim(0, 1)+
  theme_ipsum()
p3


df<- data_cor[,c(7,8)]
colnames(df)<- c("x","y")
head(df)

p4 <- ggplot(df, aes(x=x, y=y)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)+
  stat_cor(label.y = 0.8)+
  labs(x = "NAM", y="AMR_SCORGE")+
  xlim(0, 1)+
  ylim(0, 1)+
  theme_ipsum()
p4


df<- data_cor[,c(9,10)]
colnames(df)<- c("x","y")
head(df)

p5 <- ggplot(df, aes(x=x, y=y)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)+
  stat_cor(label.y = 0.08)+
  labs(x = "SAS", y="SAS_SCORGE")+
  xlim(0, 0.3)+
  ylim(0, 0.1)+
  theme_ipsum()
p5


ggarrange(p1, p2, p3, p4, p5 + rremove("x.text"), 
          labels = c("A", "B", "C", "D" ,"E"),
          ncol = 2, nrow = 3)









