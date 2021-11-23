import glob
from subprocess import call as unix

pass_list = []
for aln in glob.glob('*fasta'):
    OG = aln.split('.')[0]
    pass_list.append(OG)


for aln in glob.glob('../all_aln/*fasta'):
    OG = aln.split('/')[-1].split('_rename')[0]
    if OG in pass_list:
        unix('cp ' + aln + ' .', shell=True)
        unix('cp /data1/bspm/xenacoel_phylo/reanalysis/philippe_2019/OG_data/OG_trees/all_trees/' + OG + '_rename.fasta.contree /data1/bspm/xenacoel_phylo/reanalysis/philippe_2019/OG_data/OG_trees/clancheck_pass/', shell=True)
    else:
        unix('cp ' + aln + ' ../clancheck_fail/', shell=True)
        unix('cp /data1/bspm/xenacoel_phylo/reanalysis/philippe_2019/OG_data/OG_trees/all_trees/' + OG + '_rename.fasta.contree /data1/bspm/xenacoel_phylo/reanalysis/philippe_2019/OG_data/OG_trees/clancheck_fail/', shell=True)
    
    
