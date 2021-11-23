import glob
from Bio import SeqIO
from collections import defaultdict

sp_clan = {}
clan_species = defaultdict(list)
for clan in glob.glob('/data1/bspm/xenacoel_data/philippe_2019/Xenacoelomorpha2019/all_alignments_trimmed/clan_check/*_taxa.tsv'):
    clan_name = clan.split('/')[-1].split('_')[0]
    with open(clan) as f:
        for line in f:
            lines = line.split('\t')
            sp = lines[0]
            sp_clan[sp] = clan_name
            clan_species[clan_name].append(sp)

for k, v in clan_species.items():
    print(k, v)
            
CC_pass = []
CC_fail = []

for fa in glob.glob('../clancheck_pass/*fasta'):
    fa = fa.split('/')[-1]
    CC_pass.append(fa)

for fa in glob.glob('../clancheck_fail/*fasta'):
    fa = fa.split('/')[-1]
    CC_fail.append(fa)

sp_list = []
#for aln in glob.glob('*fasta'):
    
