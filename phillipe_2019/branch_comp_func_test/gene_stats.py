#!/usr/bin/env python3

import os
import csv
import glob
import numpy as np
import scipy.stats
import itertools
from Bio import Phylo
from subprocess import call as unix

# Author: Peter Mulhair
# Date: 15/04/202


os.mkdir('clancheck_pass')
os.chdir('clancheck_pass')
unix('cp ../../OG_data/OG_trees/clancheck_pass/*contree .', shell=True)
os.chdir('../')
os.mkdir('clancheck_fail')
os.chdir('clancheck_fail')
unix('cp ../../OG_data/OG_trees/clancheck_fail/*contree .', shell=True)
os.chdir('../')


def calculate_tree_length(tree):
    #Read newick tree
    tree = Phylo.read(tree, 'newick')
    #Get total branch length
    totalLen = tree.total_branch_length()
    #Get number of branches
    tip_nodes = []
    internal_nodes = []
    for tips in tree.get_terminals():
        tip_nodes.append(tips)
    for clade in tree.get_nonterminals():
        internal_nodes.append(clade)
    inter_count = 0
    tip_count = 0
    for i in internal_nodes:
        inter_count+=1
    for j in tip_nodes:
        tip_count+=1
    total_branches = (inter_count + tip_count) - 1

    #Calculate avg branch length
    avg_brlen = totalLen/total_branches

    return avg_brlen

ccPass_avg_brlens = []
for i in glob.glob('clancheck_pass/*contree'):
    brlen = calculate_tree_length(i)
    ccPass_avg_brlens.append(brlen)

ccFail_avg_brlens = []
for i in glob.glob('clancheck_fail/*contree'):
    brlen = calculate_tree_length(i)
    ccFail_avg_brlens.append(brlen)

#Write results to file
output_columns = ['Passed', 'Failed']
data = itertools.zip_longest(ccPass_avg_brlens, ccFail_avg_brlens)
with open('avg_brlens_results.tsv', 'w', newline='') as f_output:
    tsv_output = csv.writer(f_output, delimiter='\t')
    tsv_output.writerow(output_columns)
    for id, val in data:
        tsv_output.writerow([id, val])
    
#Wilcoxon test between CC passed and failed trees
unix('Rscript stats_test.R -t avg_brlens_results.tsv -o avg_brlens_wilcoxon_test.txt', shell=True) 




def comp_het_test(trees):
    #Get species count for tree
    tree = Phylo.read(trees, 'newick')
    sp_count = tree.count_terminals()

    #Get number of sp failing comp het test from IQtree logfile
    OG = trees.split('/')[-1].split('.')[0]
    #OG_log_file = '../../tree_files/output/' + OG + '.aln.log'
    OG_log_file = '/data1/bspm/xenacoel_data/philippe_2019/Xenacoelomorpha2019/all_alignments_trimmed/tree_files/renamed/iqtree_output/' + OG + '.fasta.log'
    fail_count = 0
    with open(OG_log_file) as f:
        lines = f.read()
        line = lines.split('\n\n')
        comp_info = line[2]
        comp_info_lines = comp_info.split('\n')
        for res in comp_info_lines[:-2]:
            if 'failed' in res:
                fail_count+=1

    #Calculate proportion of taxa failing comp het test
    prop_comp_failed = fail_count/sp_count

    return prop_comp_failed


ccPass_compHet = []
for i in glob.glob('clancheck_pass/*contree'):
    comp_het_prop = comp_het_test(i)
    ccPass_compHet.append(comp_het_prop)

ccFail_compHet = []
for i in glob.glob('clancheck_fail/*contree'):
    comp_het_prop = comp_het_test(i)
    ccFail_compHet.append(comp_het_prop)

    
#Write results to file
output_columns = ['Passed', 'Failed']
data = itertools.zip_longest(ccPass_compHet, ccFail_compHet)
with open('prop_compHet_fail.tsv', 'w', newline='') as f_output:
    tsv_output = csv.writer(f_output, delimiter='\t')
    tsv_output.writerow(output_columns)
    for id, val in data:
        tsv_output.writerow([id, val])

#Wilcoxon test between CC passed and failed trees
unix('Rscript stats_test.R -t prop_compHet_fail.tsv -o prop_compHet_fail_wilcoxon_test.txt', shell=True)

os.mkdir('results')
unix('mv *txt results/', shell=True)
unix('mv *tsv results/', shell=True)
