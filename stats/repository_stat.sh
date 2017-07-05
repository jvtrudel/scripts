#! /usr/bin/env bash
#
# desc: Récupérer les informations suivantes
#        1- la date du commit
#        2- le hash abbrégé du commit
#        1- le nombre de fichiers
#        2- le nombre de lignes
#        3- le nombre de mots
#       dans un répertoire et ses sous-répertoires.
#       Ajouter le résultat au fichier désigné par l'utilisateur


shopt -s globstar #nullglob dotglob

fname=$1   #fichier output

idate=`git log -1 --date=short --pretty=format:%cd`
commit=`git log -1 --pretty=format:%h`
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

# à faire: si l'utilisateur ne dit rien, echo...
echo "$idate $commit $n_fichiers $n_lignes $n_mots" >>$fname
