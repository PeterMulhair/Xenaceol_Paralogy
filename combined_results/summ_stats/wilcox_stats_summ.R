library(getopt)

Align_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Align_stats.tsv", header=FALSE)
Bootstrap_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Bootstrap_stats.tsv", header=FALSE)
LongBranch_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/LongBranch_stats.tsv", header=FALSE)
ParsimonySites_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/ParsimonySites_stats.tsv", header=FALSE)
Saturation_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Saturation_stats.tsv", header=FALSE)
Tree_RCFV_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/Tree_RCFV_stats.tsv", header=FALSE)
VariableSites_stats <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/summ_stats/VariableSites_stats.tsv", header=FALSE)


X<-split(Align_stats, Align_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

align_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
align_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
align_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value



X<-split(Bootstrap_stats, Bootstrap_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

bst_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
bst_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
bst_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value


X<-split(LongBranch_stats, LongBranch_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

lb_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
lb_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
lb_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value


X<-split(ParsimonySites_stats, ParsimonySites_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

psi_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
psi_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
psi_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value


X<-split(Saturation_stats, Saturation_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

sat_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
sat_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
sat_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value



X<-split(Tree_RCFV_stats, Tree_RCFV_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

tre_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
tre_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
tre_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value



X<-split(VariableSites_stats, VariableSites_stats$V1)
a_Rouse2016<-X$Rouse2016
a_Cannon2016<-X$Cannon2016
a_Philippe2019<-X$Philippe2019


X1<-split(a_Rouse2016, a_Rouse2016$V2)
Rouse2016_a_pass<- X1$clancheck_pass
Rouse2016_a_fail<- X1$clancheck_fail
X2<-split(a_Cannon2016, a_Cannon2016$V2)
Cannon2016_a_pass<- X2$clancheck_pass
Cannon2016_a_fail<- X2$clancheck_fail
X3<-split(a_Philippe2019, a_Philippe2019$V2)
Philippe2019_a_pass<- X3$clancheck_pass
Philippe2019_a_fail<- X3$clancheck_fail

stat_test_a_Rouse2016 <- wilcox.test(Rouse2016_a_pass$V3, Rouse2016_a_fail$V3, paired=FALSE) 
stat_test_a_Cannon2016 <- wilcox.test(Cannon2016_a_pass$V3, Cannon2016_a_fail$V3, paired=FALSE) 
stat_test_a_Philippe2019 <- wilcox.test(Philippe2019_a_pass$V3, Philippe2019_a_fail$V3, paired=FALSE) 

vs_Rouse2016_pvalue<-stat_test_a_Rouse2016$p.value
vs_Cannon2016_pvalue<-stat_test_a_Cannon2016$p.value
vs_Philippe2019_pvalue<-stat_test_a_Philippe2019$p.value






align_Rouse2016_pvalue
align_Cannon2016_pvalue
align_Philippe2019_pvalue

bst_Rouse2016_pvalue
bst_Cannon2016_pvalue
bst_Philippe2019_pvalue

lb_Rouse2016_pvalue
lb_Cannon2016_pvalue
lb_Philippe2019_pvalue

psi_Rouse2016_pvalue
psi_Cannon2016_pvalue
psi_Philippe2019_pvalue

sat_Rouse2016_pvalue
sat_Cannon2016_pvalue
sat_Philippe2019_pvalue

tre_Rouse2016_pvalue
tre_Cannon2016_pvalue
tre_Philippe2019_pvalue

vs_Rouse2016_pvalue
vs_Cannon2016_pvalue
vs_Philippe2019_pvalue






