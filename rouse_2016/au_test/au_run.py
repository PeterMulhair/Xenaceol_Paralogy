#!/usr/bin/env python3
import os
import glob
import argparse
from Bio import SeqIO
from collections import Counter
from subprocess import call as unix

# Author: Peter Mulhair
# Date: 15/04/2020

parse = argparse.ArgumentParser()

parse.add_argument("--cc",type=str, help="parse results of gene trees that either passed or failed clan_check",required=True)
parse.add_argument("--path",type=str, help="path to iqtree log files for each OG gene tree",required=True)

args = parse.parse_args()

os.mkdir(args.cc)
os.chdir(args.cc)

unix('cp ../../OG_data/OG_trees/' + args.cc + '/*contree .', shell=True)

def tree_trim(tree, Ttree):
    tree_name = tree.split('.')[0]
    Thyp = Ttree.split('_')[0]
    with open('clann_block.txt', 'w') as outF:
        outF.write('exe ' + tree + ';\ngeneratetrees sourcedata=ideal supertree="' + Ttree + '" savesourcetrees="yes";\n')
    unix('clann -ln -c "clann_block.txt"', shell=True)
    unix('mv sourcetrees.ph ' + tree_name + '_' + Thyp + '.nwk', shell=True)
    unix("sed -i 's/\[\([^]]*\)\]//g' " + tree_name + "_" + Thyp + ".nwk", shell=True)

hyp_tree_list = []
for T_trees in glob.glob('../*nwk'):
    unix('cp ' + T_trees + ' .', shell=True)
    Ttree = T_trees.split('/')[-1]
    hyp_tree_list.append(Ttree)

for trees in glob.glob('*contree'):
    tree = trees.replace('-', '_')
    os.rename(trees, tree)
    for hyp_tree in hyp_tree_list:
        tree_trim(tree, hyp_tree)
    

for tree in glob.glob('*contree'):
    OG = tree.split('.')[0]

    T1 = OG + '_T1.nwk'
    T2 = OG + '_T2.nwk'
    T3 = OG + '_T3.nwk'
    unix('cat ' + T1 + ' ' + T2 + ' ' + T3 + ' >> ' + OG + '.treels', shell=True)
    unix('cp ../../OG_data/OG_aln/' + args.cc + '/' + OG + '.fasta .', shell=True)

    with open(args.path + OG + '.fasta.log') as f:
        lines = f.read()
        info = lines.split('\n')
        for line in info:
            if 'Best-fit model:' in line:
                model = line.split(':')[-1].split(' ')[1]

    unix('iqtree -s ' + OG + '.fasta -m ' + model + ' -z ' + OG + '.treels -te ' + tree + ' -zb 10000 -zw -au', shell=True)
    unix('rm ' + OG + '.fasta', shell=True)



OG_count = 0
single_support = 0
T1_sup = 0
T2_sup = 0
T3_sup = 0
for au_out in glob.glob('*iqtree'):
    OG_count+=1
    OG = au_out.split('.')[0]
    au_res_list = []
    with open(au_out) as f:
        for line in f:
            if line.startswith('  1 '):
                t1_au = line.split(' ')[-2]
            elif line.startswith('  2 '):
                t2_au = line.split(' ')[-2]
            elif line.startswith('  3 '):
                t3_au = line.split(' ')[-2]

    au_res_list.append(t1_au)
    au_res_list.append(t2_au)
    au_res_list.append(t3_au)
    au_counts = Counter(au_res_list)
    if au_counts['-'] == 2:
        single_support += 1
        if au_res_list[0] == '+':
            T1_sup+=1
        elif au_res_list[1] == '+':
            T2_sup+=1
        elif au_res_list[2] == '+':
            T3_sup+=1


os.chdir('../')
with open('au_test_results.txt', 'a+') as outF:
    outF.write(str(OG_count) + ' genes ' + args.cc + '\t' + str(single_support) + ' single topology' + '\t' + str((100*(T1_sup/single_support))) + ' (' + str(T1_sup) + ')' + '\t' + str((100*(T2_sup/single_support))) + ' (' + str(T2_sup) + ')' + '\t' +str((100*(T3_sup/single_support))) + ' (' + str(T3_sup) + ')' + '\n')
