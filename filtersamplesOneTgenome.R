otg_list <- read.delim("data_list_oneTg.txt", header = T, sep="\t")
otg_list <- otg_list[,c(1,4,5,6)]
head(otg_list)


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


write.csv(otg_list_nonrel_filtpop[,1], "samplelist_onetg_filt_nonrel_pop.txt",  row.names=FALSE, quote=FALSE)
