#! /bin/bash

rm -rf webapp

mkdir webapp

cd webapp

mkdir css
mkdir js
mkdir docs

mkdir img

cd docs

mkdir text
mkdir python

cd ..

for file in index.html style.css app.js main.py
do
    touch ./"${file}"
done

curl -o meme.jpg "https://pm1.aminoapps.com/7021/417429318f6b29b6bc737fb95ba1ddafc9ba2decr1-720-642v2_hq.jpg"

read -p "Introduce la cantidad de archivos a crear:" numfiles
for x in $( seq 1 $numfiles )
do
    echo "Archivo ${x}" > "file${x}.txt"
done

mv style.css css/

mv file1.txt docs/text/
mv file2.txt docs/text/
mv file3.txt docs/text/
mv file4.txt docs/text/
mv file5.txt docs/text/

mv main.py docs/python

mv app.js js/

mv meme.jpg img/