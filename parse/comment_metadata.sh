#! /usr/bin/env bash
#
# desc: Get comments in all files of a repository and generate a valid markdowm document
# refs: 
#   - http://www.grymoire.com/Unix/Awk.html
#   - https://www.cyberciti.biz/faq/bash-scripting-using-awk/
#

# il manquerait:
#   - sous-section en fonction du niveau
#   - ou bien, cherche juste dans une liste de répertoire précis
#   - commentaire dépend du type de fichier
#   - lit seulement un type de fichier
#   - liste d'exceptions (fichiers à ne pas lire) 

 
shopt -s globstar #nullglob dotglob

fname="readme.md"   #fichier output 
echo "" > $fname    #initialise le fichier 


for f in **/*
  do
    if [ ! -d "$f" ]; then
      echo "# $f" >> $fname
      echo "" >>$fname
      gawk '{ if ($2=="desc:") print  $0}' $f | cut -d\  -f3-  >> $fname
      echo "" >> $fname
    fi
  done


