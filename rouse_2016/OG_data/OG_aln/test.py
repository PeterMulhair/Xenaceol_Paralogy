import glob
from Bio import SeqIO
from collections import Counter

CC_fail_sp = []
CC_pass_sp = []
for aln in glob.glob('clancheck_fail/*fasta'):
    with open(aln) as f:
        for record in SeqIO.parse(f, 'fasta'):
            ID = record.id
            CC_fail_sp.append(ID)

for aln	in glob.glob('clancheck_pass/*fasta'):
    with open(aln) as f:
        for record in SeqIO.parse(f, 'fasta'):
            ID = record.id
            CC_pass_sp.append(ID)

CC_fail_sp_count = Counter(CC_fail_sp)
CC_pass_sp_count = Counter(CC_pass_sp)

print(len(set(CC_fail_sp)))

with open('sp_CC_OGs.tsv', 'w') as outF:
    for sp, count in CC_fail_sp_count.items():
        outF.write(sp + '\t' + 'CC_fail' + '\t' + str(count) + '\n')
    for	sp, count in CC_pass_sp_count.items():
        outF.write(sp + '\t' + 'CC_pass' + '\t' + str(count) + '\n')
    '''
    for sp in set(CC_fail_sp):
        fail_count = CC_fail_sp_count[sp]
        pass_count = CC_pass_sp_count[sp]
        outF.write(sp + '\t' + str(pass_count) + '\t' + str(fail_count) + '\n')
    '''
