#!/usr/bin/env python3
import os
import glob
import argparse
from Bio import SeqIO
from collections import Counter
from subprocess import Popen, PIPE, check_output
from subprocess import call as unix

# Author: Peter Mulhair
# Date: 21/05/2020

parse = argparse.ArgumentParser()

parse.add_argument("--cc",type=str, help="parse results of gene trees that either passed or failed clan_check",required=True)

args = parse.parse_args()


os.mkdir(args.cc)
os.chdir(args.cc)

'''
CC_pass_list = []
for fa in glob.glob('../../../phylobayes_run/data/raw/*aln'):
    OG = fa.split('/')[-1].split('.')[0]
    CC_pass_list.append(OG)

for aln in glob.glob('../../../optimal_align/*.aln'):
    OG = aln.split('/')[-1].split('.')[0]
    if OG in CC_pass_list:
        unix('cp ../../../tree_files/trees/' + OG + '.aln.contree .', shell=True)
        unix('cp ' + aln + ' .', shell=True)


for align in glob.glob("*aln"):
    unix("tr '|' '_' < " + align + " > " + align + ".rename", shell=True)
'''

#Path to gene fasta files and gene trees for pass or fail gene sets
unix('cp ../../genewise_signal/' + args.cc + '/*fasta .', shell=True)
unix('cp ../../au_test/' + args.cc + '/*contree .', shell=True)


aln_lens = []
bss = []
lb_score = []
pis = []
sat = []
toverr = []
vs = []

stats_list = []
for alns in glob.glob('*fasta'):
    OG_stat_list = []
    OG = alns.split('.')[0]
    trees = OG.split('-')[0] + '_gb_rename.fasta.contree'
    print(OG)
    aln_out = check_output('phykit aln_len ' + alns, shell=True)
    aln_out = aln_out.split()[0].decode("utf-8")
    aln_out.split('\n')[0]
    aln_lens.append(aln_out)

    bss_out = check_output('phykit bss ' + trees, shell=True)
    bss_out = bss_out.decode("utf-8")
    bss_out = bss_out.split('\n')[0].strip('mean: ')
    bss.append(bss_out)

    lb_out = check_output('phykit lb_score ' + trees, shell=True)
    lb_out = lb_out.decode("utf-8")
    lb_out = lb_out.split('\n')[0].strip('mean: ')
    lb_score.append(lb_out)

    pis_out = check_output('phykit pis ' + alns, shell=True)
    pis_out = pis_out.decode("utf-8")
    pis_out = pis_out.split()[0]
    pis.append(pis_out)
    
    sat_out = check_output('phykit sat -a ' + alns + ' -t ' + trees, shell=True)
    sat_out = sat_out.decode("utf-8")
    sat_out = sat_out.split()[0]
    sat.append(sat_out)

    toverr_out = check_output('phykit toverr -a ' + alns + ' -t ' + trees, shell=True)
    toverr_out = toverr_out.decode("utf-8")
    toverr_out = toverr_out.split()[0]
    toverr.append(toverr_out)
    
    vs_out = check_output('phykit vs ' + alns,  shell=True)
    vs_out = vs_out.decode("utf-8")
    vs_out = vs_out.split()[0]
    vs.append(vs_out)

    OG_stat_list.extend((aln_out, bss_out, lb_out, pis_out, sat_out, toverr_out, vs_out))
    stats_list.append(OG_stat_list)
                        
os.chdir('../')

with open('summ_gene_info.tsv', 'a+') as outF:
    for OG_stat_list in stats_list:
        outF.write(args.cc + '\t')
        for stat in OG_stat_list:
            outF.write(stat + '\t')
        outF.write('\n')
            
    
