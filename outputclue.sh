#!/bin/bash
if [ -z $1 ]; then 
  echo "well, someone didn't want to run the script with a file...";
  exit;
fi

file=$1
bug=7c85d987a917c2a555d1391426978f05
mesg="Linus has been here...\nI love messing with these amateur programmers!!\nIf you want some real fun, then you should try resolving a conflict between this branch (tree) and code4life.\nI introduced a little bug that you should fix in the conflict. >:)\nAfter you merge these 2 files you should run the shell script again!!\n\nGood Luck!!!"
merges=$(git log --format=%h --merges | head -1)

if [ "$file" = "nextclue_input.cpp" ];then 
  if [ ${merges} ]; then 
    while read p; do 
      for w in $p;do 
        if [ `echo $w | md5sum | awk '{print $1}'` = $bug ];then 
          echo -e $mesg; 
          exit; 
        fi; 
      done;
    done < $file ;
    echo -e "Well, congratulations!! You fixed my conflict!!\nIf you would like to continue, then you should checkout to the $(echo bW91c2UK | base64 -d) branch!!\n" ;
   else 
     echo -e $mesg; 
     exit;
   fi; 
else 
  echo "Looks like you passed in the wrong file";
fi