library(ggplot2)
library(patchwork)

setwd('/Users/user/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling')

Rouse_taxa <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling/taxon_compare_Rouse2016.tsv", header=FALSE)
Cannon_taxa <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling/taxon_compare_Cannon2016.tsv", header=FALSE)
Philippe_taxa <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling/taxon_compare_Philippe2019.tsv", header=FALSE)


a<-ggplot(Rouse_taxa, aes(x = factor(V2, levels=unique(V2)), y = V3)) +
geom_boxplot(aes(fill = V1)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_text(size = 20), axis.text.x = element_text(size = 15, angle = 50, hjust=1), axis.text.y = element_text(size = 15), plot.title = element_text(size = 25, face = "bold"), legend.title = element_blank(), legend.position = "none") +
ylab("# Taxa in OGs") +
ggtitle("Rouse2016") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))



b<-ggplot(Cannon_taxa, aes(x = factor(V2, levels=unique(V2)), y = V3)) +
geom_boxplot(aes(fill = V1)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 15, angle = 50, hjust=1), axis.text.y = element_text(size = 15), plot.title = element_text(size = 25, face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Cannon2016") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


c<-ggplot(Philippe_taxa, aes(x = factor(V2, levels=unique(V2)), y = V3)) +
geom_boxplot(aes(fill = V1)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 15, angle = 50, hjust=1), axis.text.y = element_text(size = 15), plot.title = element_text(size = 25, face = "bold"), legend.title = element_blank()) +
ggtitle("Philippe2019") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))



p<-a + b + c 

pdf("taxon_sampling_CC.pdf", height = 10, width = 15)
print(p)
dev.off()





