import glob

for tsv in glob.glob('CC*tsv'):
    data = tsv.split('_')[-1].split('.')[0]
    with open(tsv) as f, open(data + 'CCpass_summary.tsv', 'w') as outF:
        outF.write('Clan\tperc_non_violated\tperc_violated\n')
        next(f)
        for line in f:
            lines = line.split('\t')
            clade = lines[0]
            pres = lines[1]
            abse = lines[2]
            unsure = lines[3].strip()
            total = int(pres) + int(abse) + int(unsure)

            pres_per = round(int(pres)/total*100)
            abse_per = round(int(abse)/total*100)

            outF.write(clade + '\t' + str(pres_per) + '\t' + str(abse_per) + '\n')
