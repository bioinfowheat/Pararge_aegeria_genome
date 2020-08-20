# eggNOG annotation

# fasta files are in
cd /cerberus/projects/chrwhe/Paegeria_genome/v2_genome

head Pararge_aegeria_v2.Braker_proteins.fa
>jg25560.t1 gene=jg25560
YTAPALAITSLYWRGWMLLTMLAAHNPQGFAERAAAAYPTLRALIECCITGKPSIEWSCAAESERAEAER
AAVLQLESHLAAASNAKLPVTEHSSRLLAQVMRTRTALIFHSNIFNISHLMFSA.
>jg580.t1 gene=jg580
GPEARALFKELSKRVIESSGDPRAGSYLGQRISLAIQRGNAASIFGTVPRWGGFEDVLDFI.
>jg1893.t1 gene=jg1893
ISDSPLCRACMETDETLGDLGGLLSFWREFTIRDPAGSRINHTYNGHFGLTKYGDSPKKRRRRRRRRKNW
SGR.
>jg14456.t1 gene=jg14456
MFKLFDISGYYRDQKHYNYHSDHGHNDYIDHGDHHYYKEKSDEVQTTASPITPDELRDRLERLFITNKDH



# first need to get the fasta file into a format that is only 2 lines per sequence
# rather than the format above where the sequences are hard wrapped at 70 characters

python /data/programs/scripts/multiline_to_two_line.py Pararge_aegeria_v2.Braker_proteins.fa > Pararge_aegeria_v2.Braker_proteins.2line.fa


head Pararge_aegeria_v2.Braker_proteins.2line.fa
# >jg25560.t1 gene=jg25560
# YTAPALAITSLYWRGWMLLTMLAAHNPQGFAERAAAAYPTLRALIECCITGKPSIEWSCAAESERAEAERAAVLQLESHLAAASNAKLPVTEHSSRLLAQVMRTRTALIFHSNIFNISHLMFSA.
# >jg580.t1 gene=jg580
# GPEARALFKELSKRVIESSGDPRAGSYLGQRISLAIQRGNAASIFGTVPRWGGFEDVLDFI.
# >jg1893.t1 gene=jg1893
# ISDSPLCRACMETDETLGDLGGLLSFWREFTIRDPAGSRINHTYNGHFGLTKYGDSPKKRRRRRRRRKNWSGR.
# >jg14456.t1 gene=jg14456
# MFKLFDISGYYRDQKHYNYHSDHGHNDYIDHGDHHYYKEKSDEVQTTASPITPDELRDRLERLFITNKDHGNDQRDDGKVINARNYQWTPISSG.
# >jg25903.t1 gene=jg25903
# MSSDAKKSRSKGRRTRSPSSNKQLEEILKKLQVLEERSLAYAVPRAAAGTSAGTDSRHASMTSVEPSRALVPNSPPRASPSSERTELNHALSIPNTPRTAAAPATLLSHPLLPAQAPTPAETGREIAAAPQLVQSDMKSAAERLLDAISSLP

# looks good.

# now the stop codons '.' need to be removed, and in the process we can also filter the dataset for good proteins.

# this awk command will filter fasta file to output only seq with start M and stop codon ., and no internal stops
infile=Pararge_aegeria_v2.Braker_proteins.2line.fa
awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' $infile | awk -F '\t'  '($2 ~ /^M/)' | tr "\t" "\n" | \
awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' | awk -F '\t'  '($2 ~ /\.$/)' |  awk '{gsub("\.$","",$0); print;}' | awk -F '\t'  '!($2 ~ /\./)' |  tr "\t" "\n" > \
Pararge_aegeria_v2.Braker_proteins.2line.start_stop_stoprm.fa

head Pararge_aegeria_v2.Braker_proteins.2line.start_stop_stoprm.fa
>jg14456.t1 gene=jg14456
MFKLFDISGYYRDQKHYNYHSDHGHNDYIDHGDHHYYKEKSDEVQTTASPITPDELRDRLERLFITNKDHGNDQRDDGKVINARNYQWTPISSG
>jg25782.t1 gene=jg25782
MADFDDDGFEITEDILTQLNDIEISLLNNSFQLSSEDEDDYQILPTKKKRRRIIQSDSEISENEAVGPDTSGSTPSTNVWTEPKGNQRKIIPFTEISGAPLHVKLSMSNKSPVDFYSLFLTDDILQQIVNHTNCYAIAKITNMPEATPSARIRKWHPTNLTEMKQFFGLILFMGLVKLVKLADYWSKDKITGHPFSRTVMSRNRFELLLQMLHFSDNDDHNKEDRLHRVRQLIENLNSNFKKNYTPTEDICIDESMVPFRGRIIFRQYNKQKRHKYGIKEFKLCTIPGYTYKVSIYAGKNDETNNTPTNVVMSLCGDLLNKGHTLYTDNWYTSVDLARQLIDQETHLVGTIRKNRRKLPKDVVTAKLRKGEFAAAESFDGITMMKWKDKRDVYVLSTKHSIQFHDVNKRDKIVSKPKIVVDYNKVKGAVDLADQLAAYSTPLRKSLKWHKKLAINLLLNTSLVNAYILYQKVTNKKIPISNFRKSIVESFCMQTNIKEIQDERPKRLKHKLVKKEGKSSIVRRSCSQCYKNIVQSQGRKQAKNKVKKVQTFCDDCPNKPFLCLDCFNKAHRFA
>jg25783.t1 gene=jg25783
MSPIIVPDGPLRMVICISYGARRAGHVVAHSTYAAPPRRLLAEKYSARTTLPSRSHHSAVRAIRYPPAPL
>jg20693.t1 gene=jg20693
MATLTDPYGTTGQLTLKWDPKNLEIRTMSVERTLEPLVLQVTTLVNSKDKAAKKKRPGKSKRASALVATVERATEIFIERGQTIAYENPEITQEMLAAVEEVRKAGKIHPLFISVEP
>jg422.t1 gene=jg422
MLGVSLRDQIRNEEIRKRTRVTNIAQRVSKLKSKWAEHIARRIDGRWGSIPYWNGDSAQVNAALVGPQRGGQTTLNESPGAAGNKRPRTVDFGTPYKRPMSSSELQSVEVMINPKTTRSK

# now count the number of sequences in each file
grep -c '>' *fa
Pararge_aegeria_v2.Braker_proteins.2line.fa:29069
Pararge_aegeria_v2.Braker_proteins.2line.start_stop_stoprm.fa:23567
Pararge_aegeria_v2.Braker_proteins.fa:29069
Pararge_aegeria_v2.Braker_proteins_hiqualityfiltered.fa:23567

# so we have after start top filtering 23567 genes, which is pretty impressive as a nice annotation.

# so now submit this sequence to
http://eggnog-mapper.embl.de/

# need to do this from a local computer

scp chrwhe@duke.zoologi.su.se:/cerberus/projects/chrwhe/Paegeria_genome/v2_genome/Pararge_aegeria_v2.Braker_proteins.2line.start_stop_stoprm.fa .

and run on the default settings
# the email that was sent to me included this command that was run
emapper.py --cpu 6 -i /data/shared/emapper_jobs/user_data/MM_e73nchtb/query_seqs.fa --output query_seqs.fa --output_dir /data/shared/emapper_jobs/user_data/MM_e73nchtb -m diamond -d none --tax_scope auto --go_evidence non-electronic --target_orthologs all --seed_ortholog_evalue 0.001 --seed_ortholog_score 60 --query-cover 20 --subject-cover 0 --override --temp_dir /data/shared/emapper_jobs/user_data/MM_e73nchtb

# be sure to go into the email from eggnog and click on the link "Click to manage your job"
# then at the website, you have to submit the job!!!!
# you only know things are running if you go back to the homepage and in the queue of jobs you see your ID.
http://eggnog-mapper.embl.de/

# from local to DUKE
scp /Users/chriswheat/Desktop/Genomic_analysis/Paegeria_v2_2020annotation/job_MM_e73nchtb_annotations.tsv chrwhe@duke.zoologi.su.se:/cerberus/projects/chrwhe/Paegeria_genome/v2_genome/

mv job_MM_e73nchtb_annotations.tsv Pararge_aegeria_v2.EGGnot_jun2020_annotations.tsv

# once you get this back, it will be a large table.
# columns for eggnog v2 (which are different from v1) are:
1. query_name
2. seed eggNOG ortholog
3. seed ortholog evalue
4. seed ortholog score
5. Predicted taxonomic group
6. Predicted protein name
7. Gene Ontology terms
8. EC number
9. KEGG_ko
10. KEGG_Pathway
11. KEGG_Module
12. KEGG_Reaction
13. KEGG_rclass
14. BRITE
15. KEGG_TC
16. CAZy
17. BiGG Reaction
18. tax_scope: eggNOG taxonomic level used for annotation
19. eggNOG OGs
20. bestOG (deprecated, use smallest from eggnog OGs)
21. COG Functional Category
22. eggNOG free text description

#query_name	seed_eggNOG_ortholog	seed_ortholog_evalue	seed_ortholog_score	best_tax_level	Preferred_name	GOs	EC	KEGG_ko	KEGG_Pathway	KEGG_Module	KEGG_Reaction	KEGG_rclass	BRITE	KEGG_TC	CAZy	BiGG_Reaction

# all lines of annotation with "#" as they are metadata, delete
# assess distribution of seed_ortholog_score
sed '/^#/d' Pararge_aegeria_v2.EGGnot_jun2020_annotations.tsv |\
cut -f4 | csvstat

Smallest value:        60.1
Largest value:         21,716
Sum:                   8,233,201.7
Mean:                  493.095
Median:                331.3
StDev:                 590.483


# filter
awk -F"\t" '{if ($4 > 100) print $0}' Pararge_aegeria_v2.EGGnot_jun2020_annotations.tsv > Pararge_aegeria_v2.EGGnot_jun2020_annotations.no_header.filtered.tsv
wc -l *tsv
16891 Pararge_aegeria_v2.Braker_functional_annotations.tsv # original

16705 Pararge_aegeria_v2.EGGnot_jun2020_annotations.tsv	# new
14885 Pararge_aegeria_v2.EGGnot_jun2020_annotations.no_header.filtered.tsv # new post filtering
# still lots of gene annotations after filtering

# extracting results out to different tables, as indicated by their resulting file name output
annotation_file=Pararge_aegeria_v2.EGGnot_jun2020_annotations.no_header.filtered.tsv
prefix=Pararge_aegeria_v2.BRAKER_prot_IDs.
awk 'BEGIN {FS="\t";OFS=""} {split($1,a,";");print a[1],"\t",$7}' $annotation_file > $prefix.GO.eggNOG.tsv
awk 'BEGIN {FS="\t";OFS=""} {split($1,a,";");print a[1],"\t",$9}' $annotation_file > $prefix.KEGG.eggNOG.tsv
awk 'BEGIN {FS="\t";OFS=""} {split($1,a,";");print a[1],"\t",$6}' $annotation_file > $prefix.gene_name.eggNOG.tsv
awk 'BEGIN {FS="\t";OFS=""} {split($1,a,";");print a[1],"\t",$6,"\t",$22}' $annotation_file > $prefix.gene_name.gene_function.eggNOG.tsv

head Pararge_aegeria_v2.BRAKER_prot_IDs*tsv
==> Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.eggNOG.tsv <==
#query_name     Preferred_name
jg25782.t1
jg20693.t1      alpha-Cat
jg26517.t1
jg27915.t1
jg17857.t1      dhs-24
jg24567.t1
jg2682.t1
jg22145.t1
jg27086.t1      dy

==> Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.tsv <==
#query_name     Preferred_name
jg25782.t1              piggyBac transposable element-derived protein 4-like
jg20693.t1      alpha-Cat       Vinculin family
jg26517.t1              Reverse transcriptase (RNA-dependent DNA polymerase)
jg27915.t1              BESS motif
jg17857.t1      dhs-24  oxidation-reduction process
jg24567.t1              Ribonuclease H protein
jg2682.t1               Biotin carboxylase C-terminal domain
jg22145.t1              Component of the MICOS complex, a large protein complex of the mitochondrial inner membrane that plays crucial roles in the maintenance of crista junctions, inner membrane architecture, and formation of contact sites to the outer membrane
jg27086.t1      dy      Zona pellucida (ZP) domain

==> Pararge_aegeria_v2.BRAKER_prot_IDs..GO.eggNOG.tsv <==
#query_name     GOs
jg25782.t1
jg20693.t1      GO:0000902,GO:0000904,GO:0001700,GO:0002009,GO:0002064,GO:0003382,GO:0003383,GO:0003674,GO:0003779,GO:0005488,GO:0005515,GO:0005575,GO:0005623,GO:0005886,GO:0005911,GO:0005912,GO:0005913,GO:0005914,GO:0005915,GO:0006928,GO:0006996,GO:0007010,GO:0007016,GO:0007163,GO:0007275,GO:0007391,GO:0008092,GO:0008104,GO:0008150,GO:0009653,GO:0009790,GO:0009792,GO:0009888,GO:0009987,GO:0010171,GO:0016020,GO:0016043,GO:0016331,GO:0016342,GO:0019897,GO:0019898,GO:0022607,GO:0030029,GO:0030048,GO:0030054,GO:0030154,GO:0030855,GO:0032501,GO:0032502,GO:0032507,GO:0032989,GO:0032991,GO:0033036,GO:0034329,GO:0034330,GO:0034332,GO:0034333,GO:0034613,GO:0043296,GO:0044085,GO:0044425,GO:0044459,GO:0044464,GO:0045185,GO:0045216,GO:0046664,GO:0048468,GO:0048598,GO:0048729,GO:0048856,GO:0048869,GO:0051179,GO:0051235,GO:0051641,GO:0051651,GO:0060322,GO:0060323,GO:0060429,GO:0065007,GO:0065008,GO:0070161,GO:0070252,GO:0070727,GO:0071840,GO:0071944,GO:0098796,GO:0098797
jg26517.t1
jg27915.t1
jg17857.t1      GO:0003674,GO:0003824,GO:0008150,GO:0008152,GO:0016491,GO:0055114
jg24567.t1
jg2682.t1       GO:0000902,GO:0005575,GO:0005622,GO:0005623,GO:0005737,GO:0005975,GO:0005976,GO:0005977,GO:0006073,GO:0006091,GO:0006112,GO:0006629,GO:0006638,GO:0006639,GO:0006641,GO:0008150,GO:0008152,GO:0008610,GO:0009058,GO:0009653,GO:0009743,GO:0009744,GO:0009987,GO:0010033,GO:0015980,GO:0016043,GO:0019432,GO:0032502,GO:0032989,GO:0034285,GO:0042221,GO:0043170,GO:0044042,GO:0044237,GO:0044238,GO:0044249,GO:0044255,GO:0044260,GO:0044262,GO:0044264,GO:0044424,GO:0044464,GO:0045017,GO:0046460,GO:0046463,GO:0046486,GO:0048856,GO:0048869,GO:0050896,GO:0051716,GO:0055114,GO:0070887,GO:0071310,GO:0071322,GO:0071324,GO:0071329,GO:0071704,GO:0071840,GO:1901576,GO:1901700,GO:1901701
jg22145.t1      GO:0005575,GO:0005622,GO:0005623,GO:0005737,GO:0005739,GO:0005740,GO:0005743,GO:0006996,GO:0007005,GO:0008150,GO:0009653,GO:0009987,GO:0016020,GO:0016043,GO:0019866,GO:0031090,GO:0031966,GO:0031967,GO:0031975,GO:0032502,GO:0032989,GO:0032990,GO:0043226,GO:0043227,GO:0043229,GO:0043231,GO:0044422,GO:0044424,GO:0044429,GO:0044444,GO:0044446,GO:0044464,GO:0048856,GO:0048869,GO:0070584,GO:0071840
jg27086.t1      GO:0000902,GO:0002009,GO:0002165,GO:0005575,GO:0007275,GO:0007444,GO:0007472,GO:0007476,GO:0007552,GO:0007560,GO:0008150,GO:0009653,GO:0009791,GO:0009886,GO:0009887,GO:0009888,GO:0009987,GO:0016020,GO:0016021,GO:0016043,GO:0031224,GO:0032501,GO:0032502,GO:0032989,GO:0035107,GO:0035114,GO:0035120,GO:0035220,GO:0035239,GO:0035295,GO:0044425,GO:0048513,GO:0048563,GO:0048569,GO:0048707,GO:0048729,GO:0048731,GO:0048736,GO:0048737,GO:0048856,GO:0048869,GO:0060429,GO:0060562,GO:0071840

==> Pararge_aegeria_v2.BRAKER_prot_IDs..KEGG.eggNOG.tsv <==
#query_name     KEGG_ko
jg25782.t1
jg20693.t1      ko:K05691
jg26517.t1
jg27915.t1
jg17857.t1      ko:K11153,ko:K11161
jg24567.t1
jg2682.t1       ko:K11262
jg22145.t1      ko:K17785
jg27086.t1
