library(ggplot2)
library(reshape2)
library(ggpubr)

full_clans_summary_perc_cannon <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/CC_test/full_clans_summary_perc_cannon.tsv")
full_clans_summary_perc_philippe <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/CC_test/full_clans_summary_perc_philippe.tsv")
full_clans_summary_perc_rouse <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/CC_test/full_clans_summary_perc_rouse.tsv")


#fb6a4a, 99000d
#74c476, 005a32
#6baed6, 084594

d2 <- melt(full_clans_summary_perc_philippe, id.vars="Clan")

p2<-ggplot(d2, aes(x = factor(Clan, levels=unique(Clan)), y=value, col=variable)) + geom_point(size=6) +
scale_color_manual(labels = c("% violated", "% non violated"), values=c('#cccccc','#636363')) + scale_y_continuous(expand = c(0,0,0.1,0)) + theme_classic() + theme(axis.text.x = element_text(angle = 70, hjust = 1,size = 20), axis.text.y = element_blank(), axis.title.x = element_blank(), axis.title.y = element_blank(), legend.text=element_text(size=20), legend.title=element_blank(), plot.title = element_text(size = 25, face = "bold")) +
ggtitle("Philippe et al 2019")



d1 <- melt(full_clans_summary_perc_cannon, id.vars="Clan")

p1<-ggplot(d1, aes(x = factor(Clan, levels=unique(Clan)), y=value, col=variable)) + geom_point(size=6) +
scale_color_manual(labels = c("% violated", "% non violated"), values=c('#cccccc','#636363')) + scale_y_continuous(expand = c(0,0,0.1,0)) + theme_classic() + theme(axis.text.x = element_text(angle = 70, hjust = 1,size = 20), axis.text.y = element_blank(), axis.title.x = element_blank(), axis.title.y = element_blank(), legend.text=element_text(size=20), legend.title=element_blank(), legend.position=("none"), plot.title = element_text(size = 25, face = "bold")) +
ggtitle("Cannon et al 2019")



d <- melt(full_clans_summary_perc_rouse, id.vars="Clan")

p<-ggplot(d, aes(x = factor(Clan, levels=unique(Clan)), y=value, col=variable)) + geom_point(size=6) +
scale_color_manual(labels = c("% violated", "% non violated"), values=c('#cccccc','#636363')) + scale_y_continuous(expand = c(0,0,0.1,0)) + theme_classic() + theme(axis.text.x = element_text(angle = 70, hjust = 1,size = 20), axis.text.y = element_text(size = 20), axis.title.x = element_blank(), axis.title.y = element_text(size = 25), legend.text=element_text(size=25), legend.title=element_blank(), legend.position=("none"), plot.title = element_text(size = 25, face = "bold")) +
  ylab("ClanCheck pass/fail prop.") + ggtitle("Rouse et al 2019")


plot <- p + p1 + p2


pdf("clan_check_results_patch.pdf", height = 7, width = 20)
print(plot)
dev.off()



OG_CC_results <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/CC_test/OG_CC_results.tsv")

f<-ggplot(data = OG_CC_results, aes(x = "", y = Count, fill = Result )) + 
    geom_bar(stat = "identity", position = position_fill()) +
    geom_text(aes(label = Count), position = position_fill(vjust = 0.5)) +
    coord_polar(theta = "y") +
    facet_wrap(~ Dataset)  +
    theme(axis.ticks.x = element_blank(), axis.title.x = element_text(size = 25), strip.background = element_blank(), strip.text = element_blank()) + 
    xlab("Number of OGs pass + fail ClanCheck") + 
    ylab(NULL) + 
    theme(legend.position='bottom') + 
    theme_classic() +
    scale_fill_manual(values = c("#969696", "#d9d9d9")) +
    guides(fill=guide_legend(nrow=2, byrow=TRUE))

pdf("OG_CC_results.pdf", height = 10, width = 15)
print(f)
dev.off()

