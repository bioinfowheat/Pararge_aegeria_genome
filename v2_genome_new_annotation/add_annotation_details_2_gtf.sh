
cd /cerberus/projects/chrwhe/Paegeria_genome/v2_genome

more Pararge_aegeria_v2.Braker_predictions.gtf

# overlap start --------------------------------------------------------------------------------
# this overlap has 1 different transcripts
# This transcript jg1.t1 is derived from g21976.t1 from the input file /mnt/griffin/chrwhe/Paeg_assembly/Pararge_aegeria_v2/braker_annotation/star_alignment_v_Pararge_aegeria_v2/braker/P_aegeria_v2_RNAseq_prot/augustus.E.g
tf
# It is supported by 0 other predicted genes
# the core of this joined transcript has priority 2
contig_9728     AUGUSTUS        transcript      146     734     .       +       .       jg1.t1
contig_9728     AUGUSTUS        CDS     146     254     0.38    +       0       transcript_id "jg1.t1"; gene_id "jg1";
contig_9728     AUGUSTUS        CDS     679     734     0.73    +       2       transcript_id "jg1.t1"; gene_id "jg1";
contig_9728     AUGUSTUS        stop_codon      732     734     .       +       0       transcript_id "jg1.t1"; gene_id "jg1";
# overlap start --------------------------------------------------------------------------------

head Pararge_aegeria_v2.Braker_functional_annotations.tsv
jg14456.t1      34740.HMEL010669-PA     3.1e-15 86.3            GO:0005575,GO:0005623,GO:0005886,GO:0005887,GO:0016020,GO:0016021,GO:0031224,GO:0031226,GO:0044425,GO:0044459,GO:0044464,GO:0071944                     artNOG[6]     038A0@artNOG,0A70X@biNOG,0J208@euNOG,0SVA8@inNOG,0TDQC@lepNOG,0VFYD@meNOG,11YGT@NOG,13VG2@opiNOG        NA|NA|NA
jg25782.t1      7029.ACYPI008430-PA     1.4e-102        379.0                                   artNOG[6]       038KM@artNOG,0AAWU@biNOG,0IZZ8@euNOG,0SV2G@inNOG,0VH34@meNOG,0YA2Y@NOG,13U4T@opiNOG     NA|NA|NA        S    Inherit from opiNOG: PiggyBac transposable element-derived protein
jg20693.t1      13037.EHJ77709  5.4e-49 198.7   ALPHA-CAT       GO:0000003,GO:0003006,GO:0003674,GO:0003779,GO:0005488,GO:0005515,GO:0005575,GO:0005623,GO:0005886,GO:0005911,GO:0005912,GO:0005913,GO:0005914,GO:0005915,GO:0006996,GO:0007010,GO:0007016,GO:0007155,GO:0007163,GO:0007276,GO:0007292,GO:0007293,GO:0008092,GO:0008104,GO:0008150,GO:0009653,GO:0009987,GO:0016020,GO:0016043,GO:0016342,GO:0019897,GO:0019898,GO:0019953,GO:0022414,GO:0022610,GO:0030054,GO:0030055,GO:0030720,GO:0032501,GO:0032502,GO:0032504,GO:0032507,GO:0032991,GO:0033036,GO:0034613,GO:0043234,GO:0043296,GO:0044425,GO:0044459,GO:0044464,GO:0044699,GO:0044702,GO:0044763,GO:0044767,GO:0045185,GO:0045296,GO:0048477,GO:0048609,GO:0048646,GO:0048856,GO:0050839,GO:0051179,GO:0051235,GO:0051641,GO:0051651,GO:0051674,GO:0065007,GO:0065008,GO:0070161,GO:0070727,GO:0071840,GO:0071944   K05691          artNOG[6]    032UU@artNOG,09VIV@biNOG,0SPPV@inNOG,0V6I2@meNOG,0XSRU@NOG,12S4A@opiNOG,KOG3681@euNOG    NA|NA|NA        W       Vinculin family
jg422.t1        13037.EHJ73538  9.2e-12 75.1                                    euNOG[57]       0Y65V@NOG,KOG1075@euNOG NA|NA|NA        S       Retrotransposon protein
jg6640.t1       13037.EHJ68562  1.3e-14 84.7                                    euNOG[57]       0Y65V@NOG,KOG1075@euNOG NA|NA|NA        S       Retrotransposon protein
jg26516.t1      13037.EHJ65450  4.1e-18 96.3                                    artNOG[6]       03HEH@artNOG,0B49A@biNOG,0IPXR@euNOG,0T3W3@inNOG,0WGRZ@meNOG,0ZN99@NOG,13CTA@opiNOG     NA|NA|NA        S       Endonuclease/Exonuclease/phosphatase family


# just need relationship table of the gene ID to gene name

cut -f1,3 Pararge_aegeria_v2.Braker_functional_annotations.tsv | head
# might want new annotation
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


# annotation file
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

awk 'FS="\t", OFS="\t" {print $1,$2";"$3}' ../Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.tsv | grep 'jg22.t1'
jg22.t1 ;Ribonuclease H protein
awk 'FS="\t", OFS="\t" {print $1,$2";"$3}' Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.tsv > Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.name_merged.tsv
head Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.name_merged.tsv
#query_name     Preferred_name;
jg25782.t1      ;piggyBac transposable element-derived protein 4-like
jg20693.t1      alpha-Cat;Vinculin family
jg26517.t1      ;Reverse transcriptase (RNA-dependent DNA polymerase)
jg27915.t1      ;BESS motif
jg17857.t1      dhs-24;oxidation-reduction process
jg24567.t1      ;Ribonuclease H protein
jg2682.t1       ;Biotin carboxylase C-terminal domain
jg22145.t1      ;Component of the MICOS complex, a large protein complex of the mitochondrial inner membrane that plays crucial roles in the maintenance of crista junctions, inner membrane architecture, and formation of contact sites to the outer membrane
jg27086.t1      dy;Zona pellucida (ZP) domain

more Pararge_aegeria_v2.Braker_predictions.gtf
contig_9728     AUGUSTUS        transcript      146     734     .       +       .       jg1.t1
contig_9728     AUGUSTUS        CDS     146     254     0.38    +       0       transcript_id "jg1.t1"; gene_id "jg1";
contig_9728     AUGUSTUS        CDS     679     734     0.73    +       2       transcript_id "jg1.t1"; gene_id "jg1";

# testing awk command
# testing awk commands
nano test_table.tsv
mRNA00001	m_scaff_3_0	MM04752_Noctua_fimbriata_Wgl
mRNA00002	m_scaff_5_0	NW_T106_Agrotis_segetum_GAPDH
mRNA00003	m_scaff_4_1	NW_T106_Agrotis_segetum_EF1a
mRNA00005	m_scaff_2_2	NW_T106_Agrotis_segetum_COI
nano test.fa
>mRNA00001 gene=m_scaff_3_0
>mRNA00003 gene=m_scaff_4_1
>mRNA00002 gene=m_scaff_5_0
>mRNA00004 gene=m_scaff_8_0
input1=test_table.tsv
input2=test.fa
awk 'FNR==NR { a[">"$1]=$3; next } $1 in a { sub(/>/,">"a[$1]"|",$1)}1' $input1 $input2
>MM04752_Noctua_fimbriata_Wgl|mRNA00001 gene=m_scaff_3_0
>NW_T106_Agrotis_segetum_EF1a|mRNA00003 gene=m_scaff_4_1
>NW_T106_Agrotis_segetum_GAPDH|mRNA00002 gene=m_scaff_5_0
>mRNA00004 gene=m_scaff_8_0
awk 'FNR==NR{map[">"$1]=$3;next}{print $1,map[$1],$2}' $input1 $input2
>mRNA00001 MM04752_Noctua_fimbriata_Wgl gene=m_scaff_3_0
>mRNA00003 NW_T106_Agrotis_segetum_EF1a gene=m_scaff_4_1
>mRNA00002 NW_T106_Agrotis_segetum_GAPDH gene=m_scaff_5_0
>mRNA00004  gene=m_scaff_8_0

awk 'FNR==NR{map[">"$1]=$2";"$3;next}{print $1,map[$1],$2}' $input1 $input2
>mRNA00001 m_scaff_3_0;MM04752_Noctua_fimbriata_Wgl gene=m_scaff_3_0
>mRNA00003 m_scaff_4_1;NW_T106_Agrotis_segetum_EF1a gene=m_scaff_4_1
>mRNA00002 m_scaff_5_0;NW_T106_Agrotis_segetum_GAPDH gene=m_scaff_5_0
>mRNA00004  gene=m_scaff_8_0

#
# input1=Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.tsv
# input2=Pararge_aegeria_v2.Braker_predictions.gtf
# awk 'BEGIN {FS=OFS="\t"} FNR==NR{map[$1]="gene_name="$2";gene_function="$3;next}{print $0,";",map[$9]}' ../$input1 ../$input2 | grep 'jg22.t1'

input1=Pararge_aegeria_v2.BRAKER_prot_IDs..gene_name.gene_function.eggNOG.tsv
input2=Pararge_aegeria_v2.Braker_predictions.gtf
awk 'BEGIN {FS="\t";OFS=""} FNR==NR{map[$1]="gene_name="$2";gene_function="$3;next}{print $0,";",map[$9]}' $input1 $input2 > Pararge_aegeria_v2.Braker_predictions.eggNOG_names_fxn.gtf

grep 'timeless' Pararge_aegeria_v2.Braker_predictions.eggNOG_names_fxn.gtf
m_scaff_442     AUGUSTUS        transcript      24723   44226   .       -       .       jg13261.t1;gene_name=tim;gene_function=timeless
#

# copy to github
cd /Users/chriswheat/Research/github/Pararge_aegeria/v2_genome_new_annotation/
scp chrwhe@duke.zoologi.su.se:/cerberus/projects/chrwhe/Paegeria_genome/v2_genome/Pararge_aegeria_v2.Braker_predictions.eggNOG_names_fxn.gtf .






#
