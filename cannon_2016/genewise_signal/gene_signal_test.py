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

args = parse.parse_args()

os.mkdir(args.cc)
os.chdir(args.cc)

unix('cp ../../OG_data/OG_aln/' + args.cc + '/*fasta .', shell=True)
unix('echo *fasta >> alns.txt', shell=True)
unix("tr ' ' '\n' < alns.txt > alns1.txt", shell=True)
unix('rm alns.txt', shell=True)
unix('mv alns1.txt alns.txt', shell=True)
unix('cp ../*nwk .', shell=True)
unix('cat *nwk >> Ttest.nwk', shell=True)
#unix('cp ../Ttest.nwk .', shell=True)
unix('phykit create_concatenation_matrix -a alns.txt -p cannon_CCfail', shell=True)    

unix('raxmlHPC-PTHREADS-SSE3 -s cannon_CCfail.fa -m PROTGAMMAGTR -f G -z Ttest.nwk -n cannon_CCfail_OGs -T 8', shell=True)


os.chdir('../')
