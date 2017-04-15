#!/bin/bash

cat $1 | while read line;
do {
country=$(curl -s ipinfo.io/$line/country)
echo $line,$country >> AprovadosComPais.txt
}
done
