sdgp_list <- read.delim("samples_total_sdgp.txt", header = T, sep="\t")
sdgp_list <- sdgp_list[,c(1,5)]
head(sdgp_list)
dim(sdgp_list)

popList <- read.delim("popList_sdgp.txt", header = F, sep="")
colnames(popList)<- "Population.name"
poplist_v<- popList[,1]
poplist_v

sdgp_list_filtpop <- sdgp_list[sdgp_list$Population.name %in% poplist_v,]
head(sdgp_list_filtpop, 50)
dim(sdgp_list_filtpop)

#write.csv(sdgp_list_filtpop[,1], "samplelist_sdgp_filt_pop.txt",  row.names=FALSE, quote=FALSE)


table(sdgp_list_filtpop$Population.name)
table(sdgp_list_filtpop$Superpopulation.name)

library(treemap)

group <- c(rep("America (SDGP) 13", 6))
subgroup <- c("Chane 1","Mixe 3", 
              "Mixtec 2", "Piapoco 2","Quechua 3", "Zapotec 2")
value <- c(1, 3, 2, 2, 3, 2)
data <- data.frame(group,subgroup,value)
data

treemap(data, index=c("group","subgroup"),     
        vSize="value", type="index",
        fontsize.labels=c(15,12),                # size of labels. Give the size per level of aggregation: size for group, size for subgroup, sub-subgroups...
        fontcolor.labels=c("white","black"),    # Color of labels
        fontface.labels=c(2,1),                  # Font of labels: 1,2,3,4 for normal, bold, italic, bold-italic...
        bg.labels=c("transparent"),              # Background color of labels
        align.labels=list(
          c("center", "top"), 
          c("center", "center")
        ),                                   # Where to place labels in the rectangle?
        overlap.labels=0.5,                      # number between 0 and 1 that determines the tolerance of the overlap between labels. 0 means that labels of lower levels are not printed if higher level labels overlap, 1  means that labels are always printed. In-between values, for instance the default value .5, means that lower level labels are printed if other labels do not overlap with more than .5  times their area size.
        inflate.labels=F,                        # If true, labels are bigger when rectangle is bigger.
        border.col=c("black","white"),             # Color of borders of groups, of subgroups, of subsubgroups ....
        border.lwds=c(3,2),                        # Width of colors
        title="SDGP", 
        fontsize.title=12,
        palette = "Set1",
        
        
)

