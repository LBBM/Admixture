hdgp_list <- read.delim("samples_total_hdgp.txt", header = T, sep="\t")
hdgp_list <- hdgp_list[,c(1,5,7)]
head(hdgp_list)
dim(hdgp_list)

popList <- read.delim("popList_hdgp.txt", header = F, sep="")
colnames(popList)<- "Population.code"
poplist_v<- popList[,1]
poplist_v

hdgp_list_filtpop <- hdgp_list[hdgp_list$Population.name %in% poplist_v,]
head(hdgp_list_filtpop, 50)
dim(hdgp_list_filtpop)

write.csv(hdgp_list_filtpop[,1], "samplelist_hdgp_filt_pop.txt",  row.names=FALSE, quote=FALSE)



table(hdgp_list_filtpop$Superpopulation.name)

data <- data.frame(
  group=c("Africa (HGDP)", "America (HGDP)", "East Asia (HGDP)", "Europe (HGDP)"),
  value=c(38,51,57,76)
)

library(ggplot2)
library(dplyr)


p1=ggplot(data, aes(x = "", y = value, fill = group)) +
  geom_col(color = "black") +
  geom_text(aes(label = value),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  scale_fill_brewer() +
  theme_void()

table(hdgp_list_filtpop$Population.name)
table(hdgp_list_filtpop$Superpopulation.name)

data <- data.frame(
  group=c("Basque ", "Colombian", "French", "Europe (HGDP)"),
  value=c(38,51,57,76)
)
p2=ggplot(data, aes(x = "", y = value, fill = group)) +
  geom_col(color = "black") +
  geom_text(aes(label = value),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  scale_fill_brewer() +
  theme_void()


library(treemap)

group <- c(rep("Africa (HGDP) 38",2), rep("America (HGDP) 51",5), rep("East Asia (HGDP) 57",2), 
           rep("Europe (HGDP) 76",4))
subgroup <- c("Yoruba 18","Mandenka 9", 
              "Colombian 5", "Karitian 9","Maya 19", "Pima 12","Surui 6", 
              "Han 30","Japanese 27",
              "Basque 22",  "French 24", "Sardinian 24",  "Tuscan 6")
value <- c(18, 20, 5, 9, 19, 12, 6, 30, 27, 22, 24, 24, 6)
data <- data.frame(group,subgroup,value)
data
treemap(data, index=c("group","subgroup"),     
        vSize="value", type="index",
        fontsize.labels=c(15,12),                # size of labels. Give the size per level of aggregation: size for group, size for subgroup, sub-subgroups...
        fontcolor.labels=c("white","black"),    # Color of labels
        fontface.labels=c(2,1),                  # Font of labels: 1,2,3,4 for normal, bold, italic, bold-italic...
        bg.labels=c("transparent"),              # Background color of labels
        align.labels=list(
          c("center", "center"), 
          c("right", "top")
        ),                                   # Where to place labels in the rectangle?
        overlap.labels=0.5,                      # number between 0 and 1 that determines the tolerance of the overlap between labels. 0 means that labels of lower levels are not printed if higher level labels overlap, 1  means that labels are always printed. In-between values, for instance the default value .5, means that lower level labels are printed if other labels do not overlap with more than .5  times their area size.
        inflate.labels=F,                        # If true, labels are bigger when rectangle is bigger.
        border.col=c("black","white"),             # Color of borders of groups, of subgroups, of subsubgroups ....
        border.lwds=c(3,2),                        # Width of colors
        title="HDGP", 
        fontsize.title=12
        
        
)
  