import glob
from subprocess import call as unix

pass_list = []
for aln in glob.glob('*fasta'):
    OG = aln.split('.')[0]
    pass_list.append(OG)


for aln in glob.glob('../all_aln/*fasta'):
    OG = aln.split('/')[-1].split('.')[0]
    if OG in pass_list:
        unix('cp /data1/bspm/xenacoel_phylo/reanalysis/rouse_2016/OG_data/OG_trees/all_trees/' + OG + '.fasta.contree /data1/bspm/xenacoel_phylo/reanalysis/rouse_2016/OG_data/OG_trees/clancheck_pass/', shell=True)
    else:
        unix('cp ' + aln + ' ../clancheck_fail/', shell=True)
        unix('cp /data1/bspm/xenacoel_phylo/reanalysis/rouse_2016/OG_data/OG_trees/all_trees/' + OG + '.fasta.contree /data1/bspm/xenacoel_phylo/reanalysis/rouse_2016/OG_data/OG_trees/clancheck_fail/', shell=True)
    
    
