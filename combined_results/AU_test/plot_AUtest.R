library(ggplot2)
library(patchwork)

Cannon2016_AUtest <- read.delim("Cannon2016_AUtest.tsv")
Rouse2016_AUtest <- read.delim("Rouse2016_AUtest.tsv")
Philippe2019_AUtest <- read.delim("Philippe2019_AUtest.tsv")


a<-ggplot(Rouse2016_AUtest, aes(fill=Topology, y=Count, x=Condition)) + geom_bar(position="fill", stat="identity", alpha=0.8) + scale_fill_manual(values = c("#96B2AF", "#D69C4E", "#446455")) + theme_classic() + theme(legend.position = "none", axis.text.y = element_text(size = 20), axis.title.y = element_text(size = 20), axis.text.x = element_text(size = 20), axis.title.x = element_blank(), plot.title = element_text(size = 25, face = "bold")) + ggtitle("Rouse2016") + ylab("Proportion")
b<-ggplot(Cannon2016_AUtest, aes(fill=Topology, y=Count, x=Condition)) + geom_bar(position="fill", stat="identity", alpha=0.8) + scale_fill_manual(values = c("#96B2AF", "#D69C4E", "#446455")) + theme_classic() + theme(legend.position = "none", axis.text.y = element_blank(), axis.ticks.y = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 20), axis.title.x = element_blank(), plot.title = element_text(size = 25, face = "bold")) + ggtitle("Cannon2016")
c<-ggplot(Philippe2019_AUtest, aes(fill=Topology, y=Count, x=Condition)) + geom_bar(position="fill", stat="identity", alpha=0.8) + scale_fill_manual(values = c("#96B2AF", "#D69C4E", "#446455")) + theme_classic() + theme(axis.text.y = element_blank(), axis.ticks.y = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 20), axis.title.x = element_blank(), plot.title = element_text(size = 25, face = "bold")) + ggtitle("Philippe2019")


p<-a + b + c


pdf("AUtest_results.pdf", height = 8, width = 15)
print(p)
dev.off()