#! /usr/bin/env bash
#
# desc: Compter le nombre de lignes et le nombre de mot dans un répertoire et ses sous-répertoires


shopt -s globstar #nullglob dotglob

fname="stats.md"   #fichier output
echo "" > $fname    #initialise le fichier

n_lignes=0
n_mots=0
n_fichiers=0


for f in **/*
  do
    if [ ! -d "$f" ]; then
      #echo $f;
      n_fichiers=$((n_fichiers+1))
      tmp=`wc -l $f | cut -d ' ' -f1`
      n_lignes=$((n_lignes + tmp))
      tmp=`wc -w $f | cut -d " " -f1`
      n_mots=$((n_mots + tmp))
    fi
  done

echo "# Rapport à ce jour `date +%Y-%m-%d`" >> $fname
echo "">>$fname
echo "| fichiers | lignes | mots |" >> $fname
echo "|---|---|---|">>$fname
echo "| $n_fichiers | $n_lignes | $n_mots |" >>$fname
