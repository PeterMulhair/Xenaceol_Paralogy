data_sizes <- read.delim("~/Dropbox/Projects/Orthology_Xeno/previous_analysis/combined_results/data_sizes.tsv")

# make group a factor
data_sizes$Phylum <- factor(data_sizes$Phylum, levels = unique(data_sizes$Phylum))

# calculate the start and end angles for each pie
data_sizes <- left_join(data_sizes,
  data_sizes %>% 
    group_by(Dataset) %>%
    summarize(nb_total = sum(Count))) %>%
  group_by(Dataset) %>%
  mutate(nb_frac = 2*pi*cumsum(Count)/nb_total,
         start = lag(nb_frac, default = 0))

# overall scaling for pie size
scale = 200/sqrt(max(data_sizes$nb_total))



p<-ggplot(data_sizes) + 
  geom_arc_bar(aes(y0 = OG_size, x0 = Dataset, r0 = 0, r = sqrt(nb_total)*scale, start = start, end = nb_frac, fill = reorder(Phylum, Count))) +
  coord_fixed() +
  theme_classic() +
  scale_x_continuous(breaks = c(300, 600, 900), labels = c("Rouse2016", "Cannon2016", "Philippe2019")) +
  scale_y_continuous(breaks = c(200, 400, 600, 800, 1000, 1200), name = "OrthoGroup count") +
  scale_fill_manual(values=c("#636363", "#ff7f00", "#a6cee3", "#fdbf6f", "#cab2d6", "#33a02c", "#e31a1c", "#fb9a99", "#1f78b4", "#b2df8a")) +
  theme(axis.text.x = element_text(size = 20), axis.title.x = element_blank()) +
  theme(axis.text.y = element_text(size = 20), axis.title.y = element_text(size = 25)) +
  theme(panel.grid.minor = element_blank()) +
  guides(fill=guide_legend(title="Phylum"))


pdf("data_size.pdf", height = 10, width = 10)
print(p)
dev.off()