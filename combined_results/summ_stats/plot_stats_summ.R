library(ggplot2)
library(patchwork)

Align_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Align_stats.tsv", header=FALSE)
Bootstrap_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Bootstrap_stats.tsv", header=FALSE)
LongBranch_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/LongBranch_stats.tsv", header=FALSE)
ParsimonySites_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/ParsimonySites_stats.tsv", header=FALSE)
Saturation_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Saturation_stats.tsv", header=FALSE)
Tree_RCFV_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Tree_RCFV_stats.tsv", header=FALSE)
VariableSites_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/VariableSites_stats.tsv", header=FALSE)


a<-ggplot(Align_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Alignment lenght") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


b<-ggplot(Bootstrap_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Bipartition support") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


c<-ggplot(LongBranch_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Long branch score") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


d<-ggplot(ParsimonySites_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Parsimony inform sites") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


e<-ggplot(Saturation_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Saturation") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


f<-ggplot(Tree_RCFV_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position = "none") +
ggtitle("Treeness by comp var") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


g<-ggplot(VariableSites_stats, aes(x = factor(V1, levels=unique(V1)), y = V3)) +
geom_boxplot(aes(fill = V2)) +
theme_classic() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 15), plot.title = element_text(face = "bold"), legend.title = element_blank(), legend.position="bottom") +
ggtitle("Variable sites") +
scale_fill_manual(values = alpha(c("#1c9099", "#fe9929"), 0.8))


p<-a + b + c + d + e + f + g

pdf("stats_summ.pdf", height = 10, width = 15)
print(p)
dev.off()





