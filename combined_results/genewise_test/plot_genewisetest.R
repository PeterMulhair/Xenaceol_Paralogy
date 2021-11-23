library(ggplot2)
library(patchwork)


Cannon2016_genewisetest <- read.delim("Cannon2016_genewisetest_combined.tsv")
Rouse2016_genewisetest <- read.delim("Rouse2016_genewisetest_combined.tsv")
Philippe2019_genewisetest <- read.delim("Philippe2019_genewisetest_combined.tsv")



a<-ggplot(Rouse2016_genewisetest, aes(fill=Topology, y=Count, x=Condition)) + geom_bar(position="fill", stat="identity", alpha=0.8) + scale_fill_manual(values = c("#96B2AF", "#D69C4E", "#446455")) + theme_classic() + theme(legend.position = "none", axis.text.y = element_text(size = 20), axis.title.y = element_text(size = 20), axis.text.x = element_text(size = 20, angle = 50, hjust=1), axis.title.x = element_blank(), plot.title = element_text(size = 25, face = "bold")) + ggtitle("Rouse2016") + ylab("Proportion of gene trees")
b<-ggplot(Cannon2016_genewisetest, aes(fill=Topology, y=Count, x=Condition)) + geom_bar(position="fill", stat="identity", alpha=0.8) + scale_fill_manual(values = c("#96B2AF", "#D69C4E", "#446455")) + theme_classic() + theme(legend.position = "none", axis.text.y = element_blank(), axis.ticks.y = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 20, angle = 50, hjust=1), axis.title.x = element_blank(), plot.title = element_text(size = 25, face = "bold")) + ggtitle("Cannon2016")
c<-ggplot(Philippe2019_genewisetest, aes(fill=Topology, y=Count, x=Condition)) + geom_bar(position="fill", stat="identity", alpha=0.8) + scale_fill_manual(values = c("#96B2AF", "#D69C4E", "#446455")) + theme_classic() + theme(axis.text.y = element_blank(), axis.ticks.y = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 20, angle = 50, hjust=1), axis.title.x = element_blank(), plot.title = element_text(size = 25, face = "bold")) + ggtitle("Philippe2019")


p<-a + b + c

pdf("GenewiseTest_results.pdf", height = 8, width = 12)
print(p)
dev.off()
