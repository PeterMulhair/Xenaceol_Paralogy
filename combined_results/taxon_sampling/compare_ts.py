#!/usr/bin/env python3
import glob
from Bio import SeqIO
from collections import defaultdict, Counter

'''
Script to compare taxon sampling for
different phyla in OGs from CC pass
and CC fail datasets
'''

sp_phyla = {}
phyla_sp = defaultdict(list)
with open('phyla_taxa.tsv') as f:
    for line in f:
        lines = line.split('\t')
        phyla = lines[0]
        sp = lines[1]
        sp = sp.split(' ')
        phyla_sp[phyla] = sp
        for species in sp:
            sp_phyla[species] = phyla


with open('taxon_compare_Philippe2019.tsv', 'w') as outF:            
    #Parse CC fail OGs
    for OG in glob.glob('../OG_data/OG_aln/clancheck_fail/*fasta'):
        phyla_list = []
        with open(OG) as f:
            for record in SeqIO.parse(f, 'fasta'):
                sp = record.id
                if sp in sp_phyla:
                    phyla = sp_phyla[sp]
                    phyla_list.append(phyla)

        phyla_count = Counter(phyla_list)
        for k, v in phyla_count.items():
            outF.write('CC_fail' + '\t' + k + '\t' + str(v) + '\n')
    
    #Parse CC pass OGs
    for OG in glob.glob('../OG_data/OG_aln/clancheck_pass/*fasta'):
        phyla_list = []
        with open(OG) as f:
            for record in SeqIO.parse(f, 'fasta'):
                sp = record.id
                if sp in sp_phyla:
                    phyla = sp_phyla[sp]
                    phyla_list.append(phyla)

        phyla_count = Counter(phyla_list)
        for k, v in phyla_count.items():
            outF.write('CC_pass' + '\t' + k + '\t' + str(v) + '\n')
