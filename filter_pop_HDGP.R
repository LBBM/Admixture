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
