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

write.csv(sdgp_list_filtpop[,1], "samplelist_sdgp_filt_pop.txt",  row.names=FALSE, quote=FALSE)
