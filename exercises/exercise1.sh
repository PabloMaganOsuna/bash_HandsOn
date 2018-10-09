#Ejercicio1:

## Analizar el archivo para saber qué contiene
#less TAIR9_mRNA.bed

## Take a look if it compress
#gzip TAIR9_mRNA.bed

echo "Find the transcripts that are lying on the + strand of chromosome 1. How many are them?"
grep chr1 TAIR9_mRNA.bed | grep + | cut -f 4 | sort | uniq | wc -l
  #4366

echo "Considering that the exon sizes [...] the repeated values:"
cut -f11 TAIR9_mRNA.bed | sed 's/,/\t/g' | head | awk '{print$NF}' | uniq | sort -nr
#	573
#	429
#	275
#	263
#	257
#	101

echo "ten longest exons in chromosome 1:"
grep chr1 TAIR9_mRNA.bed | cut -f 11 | sed 's/,/\n/g'| sort -nr | head
#	7713
#	5616
#	5239
#	4755
#	4154
#	4075
#	3897
#	3882
#	3875
#	3762

echo "Name of the transcript and the number of exons of the ten genes with more exons in chromosome 1:"
grep chr1 TAIR9_mRNA.bed | cut -f 4,10 | sort -k2,2nr | uniq | head
#	AT1G02080.1     49
#	AT1G08260.1     48
#	AT1G08260.2     49
#	AT1G48090.1     65
#	AT1G48090.2     55
#	AT1G50030.1     56
#	AT1G50030.2     56
#	AT1G64790.1     60
#	AT1G67120.1     73
#	AT1G67140.1     48
