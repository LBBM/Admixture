otg_list <- read.delim("data_list_oneTg.txt", header = T, sep="\t")
otg_list <- otg_list[,c(1,4,5,6)]
head(otg_list)
otg_list

pedigree <- read.delim("pedigreelistOneTg.txt", header = T, sep="")
head(pedigree)


child_list <- read.delim("childListOneTg.txt", header = F, sep="")
colnames(child_list)<- "sampleID"
head(child_list)
child_list_vector<- child_list[,1]
child_list_vector
  
#List samples only norelated samples OneThounsandGenome
otg_list_nonrel <- otg_list[!otg_list$Sample.name %in% child_list_vector, ]
head(otg_list_nonrel)
dim(otg_list_nonrel)


popList <- read.delim("popList.txt", header = F, sep="")
colnames(popList)<- "Population.code"
poplist_v<- popList[,1]
poplist_v

otg_list_nonrel_filtpop <- otg_list_nonrel[otg_list_nonrel$Population.code %in% poplist_v,]
head(otg_list_nonrel_filtpop, 50)
dim(otg_list_nonrel_filtpop)


#write.csv(otg_list_nonrel_filtpop[,1], "samplelist_onetg_filt_nonrel_pop.txt",  row.names=FALSE, quote=FALSE)



table(otg_list_nonrel_filtpop$Population.name)
table(otg_list_nonrel_filtpop$Superpopulation.code)

library(treemap)

group <- c(rep("Africa (1KGP) 533",5),  
           rep("Europe (1KGP) 426",4),
           rep("South Asia (1KGP) 516", 5),
           rep("East Asia (1KGP) 319",3))

subgroup <- c("Yoruba 121", "Esan 106","Mandinka 119", "Luhya 99", "Mende 88",
              "CEPH 122","Toscani 107", "British 91","Iberian 106",
              "Punjabi 104",  "Gujarati 103", "Tamil 104", "Bengali 101", "Telugu 104",
              "Japanese 104",  "Southern Han Chinese 112", "Han Chinese 103"
          )

value <- c(121, 106, 119, 99, 88, 122, 107,91, 106, 104, 103, 104, 101, 104, 104, 112, 103)
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
        title="1KGP", 
        fontsize.title=12,
        palette = "Set1",
        
        
)


