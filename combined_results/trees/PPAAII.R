library(cowplot)
library(ggplot2)
library(ggridges)
library(dplyr)

datasets = factor(c(rep("Rouse2016", 500), rep("Cannon2016", 500),
                  rep("Philippe2019", 500)),
                  levels = c("Rouse2016", "Cannon2016", "Philippe2019"))


ppadiv <- data.frame(mu = c(rep(4.10404, 500), rep(6.09158, 500), rep(4.70425, 500)),
                     label = c("|Z|/U+0.710496", "|Z|/U+3.38769", "|Z|/U+2.35215"),
                     z = factor(c(rep("PPA-DIV", 1500))),
                     x = c(rnorm(500, mean=4.11167, sd = 0.0107364),
                           rnorm(500, mean=6.20869, sd = 0.0345715),
                           rnorm(500, mean=4.73543, sd = 0.0132536)),
                     y = datasets)


ppaconv <- data.frame(mu = c(rep(0.518121, 500), rep(0.564492, 500), rep(0.614574, 500)),
                      label = c("|Z|/U+0.680445", "|Z|/U+2.01063", "|Z|/U+8.58979"),
                     z = factor(c(rep("PPA-CONV", 1500))),
                     x = c(rnorm(500, mean=0.517166, sd = 0.00140306),
                           rnorm(500, mean=0.558643, sd = 0.00290893),
                           rnorm(500, mean=0.603396, sd = 0.0013013)),
                     y = datasets)

ppavar <- data.frame(mu = c(rep(0.0229158, 500), rep(0.0251449, 500), rep(0.0276712, 500)),
                     label = c("|Z|/U+0.958123", "|Z|/U+2.58803", "|Z|/U+9.1866"),
                     z = factor(c(rep("PPA-VAR", 1500))),
                     x = c(rnorm(500, mean=0.0228476, sd = 7.12599e-05),
                           rnorm(500, mean=0.0247506, sd = 0.000152337),
                           rnorm(500, mean=0.0270733, sd = 6.50926e-05)),
                     y = datasets)

ppamax <- data.frame(mu = c(rep(0.00228916, 500), rep(0.0126732, 500), rep(0.000765125, 500)),
                     label = c("|Z|/U+0.767926", "|Z|/U+2.77099", "|Z|/U+8.61367"),
                     z = factor(c(rep("PPA-MAX", 1500))),
                     x = c(rnorm(500, mean=0.00181568, sd = 0.000616568),
                           rnorm(500, mean=0.00628499, sd = 0.00230539),
                           rnorm(500, mean=0.000236713, sd = 6.13458e-05)),
                     y = datasets)

ppamean <- data.frame(mu = c(rep(0.000354856, 500), rep(0.000660874, 500), rep(0.000156628, 500)),
                      label = c("|Z|/U+6.9001", "|Z|/U+7.76602", "|Z|/U+38.1971"),
                     z = factor(c(rep("PPA-MEAN", 1500))),
                     x = c(rnorm(500, mean=0.000169768, sd = 2.68239e-05),
                           rnorm(500, mean=0.000377333, sd = 3.65105e-05),
                           rnorm(500, mean=4.53543e-05, sd = 2.91314e-06)),
                     y = datasets)

ppa <- rbind(ppadiv, ppaconv, ppavar, ppamax, ppamean)


titles <- c("PPA-DIV", "PPA-CONV", "PPA-VAR", "PPA-MAX", "PPA-MEAN")
names(titles) <- levels(ppa$z)




plot<-ggplot(ppa, aes(x, group=y, ..scaled..)) + geom_density(aes(x)) +
  geom_segment(aes(x=mu, y = 0.25, xend = mu, yend = 0.01),
               colour = "red", arrow = arrow(length = unit(0.2, "cm"))) +
  facet_grid(rows = vars(y), cols = vars(z), scales="free",
             switch = "y", labeller=labeller(z = titles)) +
  theme_bw()



