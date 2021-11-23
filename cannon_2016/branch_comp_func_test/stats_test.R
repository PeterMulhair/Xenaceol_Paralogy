#!/usr/bin/env Rscript

library(getopt)

#Get call input
spec <- matrix(c('stats', 't', 1, "character", 'output', 'o', 1, "character"), byrow=TRUE, ncol=4)

opt <- getopt(spec)

CC_res <- read.table(file = opt$stats, sep = '\t', header = TRUE)

stat_test <- wilcox.test(CC_res$Passed, CC_res$Failed, paired=TRUE) 

#cat(stat_test, file = opt$output)
lapply(stat_test, write, opt$output, append=TRUE)