## Description of directories

Download raw data from Philippe et al. 2019 [here](https://github.com/MaxTelford/Xenacoelomorpha2019)

---

`OG_data` - contains gene family data from [Philippe et al. 2019](https://www.sciencedirect.com/science/article/pii/S0960982219304075), including aligned fasta files and gene trees. All datasets are also split up into those that passed the Clan_Check filter and those that failed.

`au_test` - contains constrained trees for each alternative topology (T1, T2, T3) as well as the script required to run the analysis.

`branch_comp_func_test` - contains scripts required to compared CC pass and CC fail gene sets to check if there are any biased following filtering for branch length, compositional heterogeneity and function.

`clan_check` - data required to run [Clan_Check](https://github.com/ChrisCreevey/clan_check) on all gene trees, including predefined clans (clans.txt). To run [Clan_Check](https://github.com/ChrisCreevey/clan_check) type `clan_check -f tree_files.txt -c clans.txt`

`genewise_signal` - Trees and script required to run gene-wise log likelihood test [Shen et al. 2017](https://www.nature.com/articles/s41559-017-0126). See [here](https://figshare.com/articles/dataset/Contentious_relationships_in_phylogenomic_studies_can_be_driven_by_a_handful_of_genes/3792189/4) for further information on how to run this test.

`summ_data` - Script required to measure for 7 alignment and tree based metrics, to test for phylogenetic signal. This script uses the handy [phykit software](https://github.com/JLSteenwyk/PhyKIT).

`phylobayes.tar.gz` - Tarred folder of the parameters and output from a phylobayes run on the CC pass gene set. Folder is compressed to save storage.