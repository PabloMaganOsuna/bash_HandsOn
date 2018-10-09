# Task 1:
echo "Ejecutando Task1"
pwd # Defino el directorio de trabajo
mkdir bash_HandsOn #Creo la carpeta donde guardar los elementos del Bash HandsOn
cd  bash_HandsOn #Accedo de mi directorio a la carpeta de trabajo 
mkdir bin       #Creo las diferentes carptes dónde guardar los archivos
mkdir input
mkdir output
mkdir logs
mkdir trash
ls -l #Miro el contenido detallado de mi directorio 
cp -r trash trash2 #Copy the trash directory to trash2
mv trash trash1 #Cambio de nombre de la carpeta a trash1
rm -rf trash2 #Borro el directorio trash2

# Task 2:
echo "Ejecutando Task2"
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv #Descargar el archivo de trabajo
mv sample-groups.tsv input/input.tsv #Cambio de nombre del archivo y cambio su destino al directorio input
ln -s ../input/input.tsv trash1/input_symlink #link
cp input/input.tsv trash1/input_copy 
touch trash1/IAmLearnSomeBash #creo un archivo vacío
rm  -rf trash1 #borro el directorio trash1 y su contenido

# Task3:
echo "Ejecutando Task3"
mkdir output/task_3 #creo un nuevo directorio
head -n 100 input/input.tsv > output/task_3/top100.tsv #obtengo las 100 primeras lineas del archivo y lo guardo bajo otro nombre
tail -n 50 input/input.tsv > output/task_3/last50.tsv # obtengo las últimas 50 y guardo sobre otro nombre
wc output/task_3/* #compruebo las lineas
paste output/task_3/top100.tsv output/task_3/last50.tsv > ouput/task_3/150together.tsv #junto los dos archivos y los guardo en un archivo 150togehter.tsv

# Task4:
echo "Ejecutando Task4"
mkdir output/task_4 #Creo un directorio nuevo
cut -f2 input/input.tsv | sort -r | grep -v "Adipose" | grep -v "Artery" | uniq > output/task_4/unique.tissues2.txt #obtengo la columna 2 eliminando las lineas que contienen Adipose y Artery y lo guardo en un archivo nuevo
cut -f3 input/input.tsv | sort -r | grep -v "Adipose" | grep -v "Artery" | uniq > output/task_4/unique.tissues3.txt

# Task5:
echo "Ejecutando Task5"
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz #descargar archivo
gzip scripts.tar.gz  #Descomresión del archivo 
tar -xf scripts.tar.gz #Extracció del archivo
mv usage.sh bin
PATH= /home/uvic/bash_HandsOn/ #creo un path
chmod +x bin/usage.sh #Permiso
bin/usage.sh hfhf
# Task6:
echo "Ejecutando Task6"
wget https://raw.githubusercontent.com/dgarrimar/teaching/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv
sort -k1,1 unknown.samples.tsv > unknown.samples2.tsv
mv unknown.samples2.tsv unknown.samples.tsv
join -t $'\t' -1 1 -2 1 input/input.tsv unknown.samples.tsv > joint.tsv
awk '{print$4,$3,$2,$1}' joint.tsv |sed 's/_/ /g' | sort -nr > joint2.tsv
mv joint2.tsv joint.tsv

# Task7:
echo "Ejecutando Task7"
bash bin/usage.sh

# Ejercicio 1:
#mkdir exercises #directorio nuevo 
#cd exercises #accedo al directorio recientemente creado exercises
#nano exercise1.sh #creo un archivo dónde irá mi script
#wget https://raw.githubusercontent.com/dgarrimar/teaching/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed #Descargo el archivo TAIR9_mRNA.bed
#less TAIR9_mRNA.bed #Visualización del archivo y las columnas que contiene
#gzip TAIR9_mRNA.bed #Descompresion 
#grep chr1 TAIR9_mRNA.bed | grep + | cut -f 4 | sort | uniq | wc -l #obtengo el número de transcripts del chr1 en la cadena +
#cut -f11 TAIR9_mRNA.bed | sed 's/,/\t/g' | head | awk '{print$NF}' | uniq | sort -nr #sigo el patro chr1 con el GREP, elimino las comas por tabulador, obtengo las 10 primeras
#grep chr1 TAIR9_mRNA.bed | cut -f 11 | sed 's/,/\n/g'| sort -nr | head #obtengo los 1 exones más largos del chr 1
#grep chr1 TAIR9_mRNA.bed | cut -f 4,10 | sort -k2,2nr | uniq | head #obtengo las columnas 4 y 10 del chr1, ordeno la segunda columna correspondiente a los exones y obtengo las 10 primeas posteriormente ordenadas de mayor a menos.

