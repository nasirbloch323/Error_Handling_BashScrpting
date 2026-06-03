#!/bin/bash
set -e 
baloch_folder=$1 
 #read -p "enter ur folder name" baloch_folder
# -z is used for empty checking 
if [ -z $baloch_folder ]; then
 echo " folder is not provided  $baloch_folder "
  exit 1
fi
  
  # now we used for check folder is exit or not
  if [ -d $baloch_folder ]; then
    echo " folder is alredy  exit "
else 
      mkdir $baloch_folder 
      echo " ur folder is created is now  $baloch_folder: "
fi