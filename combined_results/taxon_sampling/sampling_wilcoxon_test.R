library(getopt)

Rouse_taxa <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling/taxon_compare_Rouse2016.tsv", header=FALSE)
Cannon_taxa <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling/taxon_compare_Cannon2016.tsv", header=FALSE)
Philippe_taxa <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/taxon_sampling/taxon_compare_Philippe2019.tsv", header=FALSE)

X<-split(Rouse_taxa, Rouse_taxa$V2)
xan<-X$Xenacoelomorpha
amb<-X$Ambulacraria
cho<-X$Chordata
ecd<-X$Ecdysozoa
lop<-X$Lophotrochozoa


X_xan<-split(xan, xan$V1)
xan_pass<- X_xan$CC_pass
xan_fail<- X_xan$CC_fail

X_amb<-split(amb, amb$V1)
amb_pass<- X_amb$CC_pass
amb_fail<- X_amb$CC_fail

X_cho<-split(cho, cho$V1)
cho_pass<- X_cho$CC_pass
cho_fail<- X_cho$CC_fail

X_ecd<-split(ecd, ecd$V1)
ecd_pass<- X_ecd$CC_pass
ecd_fail<- X_ecd$CC_fail

X_lop<-split(lop, lop$V1)
lop_pass<- X_lop$CC_pass
lop_fail<- X_lop$CC_fail


stat_test_xan <- wilcox.test(xan_fail$V3, xan_pass$V3, paired=FALSE) 
stat_test_xan$p.value
stat_test_amb <- wilcox.test(amb_fail$V3, amb_pass$V3, paired=FALSE) 
stat_test_amb$p.value
stat_test_cho <- wilcox.test(cho_fail$V3, cho_pass$V3, paired=FALSE) 
stat_test_cho$p.value
stat_test_ecd <- wilcox.test(ecd_fail$V3, ecd_pass$V3, paired=FALSE) 
stat_test_ecd$p.value
stat_test_lop <- wilcox.test(lop_fail$V3, lop_pass$V3, paired=FALSE) 
stat_test_lop$p.value


X<-split(Philippe_taxa, Philippe_taxa$V2)
xan<-X$Xenacoelomorpha
amb<-X$Ambulacraria
cho<-X$Chordata
ecd<-X$Ecdysozoa
lop<-X$Lophotrochozoa
por<-X$Porifera
cni<-X$Cnidaria


X_xan<-split(xan, xan$V1)
xan_pass<- X_xan$CC_pass
xan_fail<- X_xan$CC_fail

X_amb<-split(amb, amb$V1)
amb_pass<- X_amb$CC_pass
amb_fail<- X_amb$CC_fail

X_cho<-split(cho, cho$V1)
cho_pass<- X_cho$CC_pass
cho_fail<- X_cho$CC_fail

X_ecd<-split(ecd, ecd$V1)
ecd_pass<- X_ecd$CC_pass
ecd_fail<- X_ecd$CC_fail

X_lop<-split(lop, lop$V1)
lop_pass<- X_lop$CC_pass
lop_fail<- X_lop$CC_fail

X_por<-split(por, por$V1)
por_pass<- X_por$CC_pass
por_fail<- X_por$CC_fail

X_cni<-split(cni, cni$V1)
cni_pass<- X_cni$CC_pass
cni_fail<- X_cni$CC_fail


stat_test_xan <- wilcox.test(xan_fail$V3, xan_pass$V3, paired=FALSE) 
stat_test_xan$p.value
stat_test_amb <- wilcox.test(amb_fail$V3, amb_pass$V3, paired=FALSE) 
stat_test_amb$p.value
stat_test_cho <- wilcox.test(cho_fail$V3, cho_pass$V3, paired=FALSE) 
stat_test_cho$p.value
stat_test_ecd <- wilcox.test(ecd_fail$V3, ecd_pass$V3, paired=FALSE) 
stat_test_ecd$p.value
stat_test_lop <- wilcox.test(lop_fail$V3, lop_pass$V3, paired=FALSE) 
stat_test_lop$p.value
stat_test_por <- wilcox.test(por_fail$V3, por_pass$V3, paired=FALSE) 
stat_test_por$p.value
stat_test_cni <- wilcox.test(cni_fail$V3, cni_pass$V3, paired=FALSE) 
stat_test_cni$p.value




