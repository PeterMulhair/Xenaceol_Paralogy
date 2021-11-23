##Script to pull out tree files which have not violate a given number of clans (at least 1) in clan_check analysis
from collections import Counter
import argparse

parse = argparse.ArgumentParser()
parse.add_argument("--cutoff",type=str, help="cutoff of number of clans which are not violated",required=True)
args = parse.parse_args()

clan_cutoff = args.cutoff

count=0
non_violate_tree = []
with open('tree_files.txt.scores.txt') as f:
    next(f)
    for line in f:
        lines = line.split('\t')
        tree = lines[0]
        clans = lines[2:11]
        clan_count = Counter(clans)
        if clan_count['1'] >= int(clan_cutoff):
            count+=1
            non_violate_tree.append(tree)


tree_list = []
with open('tree_files.txt') as f:
    for line in f:
        tree = line.strip()
        tree_list.append(tree)

trees_non_violate = []
tree_count = 0
for tree in tree_list:
    tree_count+=1
    tree_name = 'Tree ' + str(tree_count)
    if tree_name in non_violate_tree:
        trees_non_violate.append(tree)


trees_non_violate_count = len(trees_non_violate)
print(trees_non_violate_count)
#with open('tree_list_' + str(trees_non_violate_count) + '.txt', 'w') as outF:
#    for tree in trees_non_violate:
#        outF.write(tree + '\n')
