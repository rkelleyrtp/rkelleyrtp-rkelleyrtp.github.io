#!/bin/bash

SOURCE_DIR="$HOME/nc.rkelleyrtp.com/RKelleyRTP_Web_Site/hugo-rkelleyrtp"
  DEST_DIR="$HOME/nc.rkelleyrtp.com/RKelleyRTP_Web_Site/rkelleyrtp-website/docs"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
RES=$(cd $SOURCE_DIR &&  hugo -d $DEST_DIR)
if [ $? -eq 0 ];  then
  cd ../rkelleyrtp-website 

  git add docs
  [[ $? -ne 0 ]] && echo "Unable to add docs to git ; exiting " && exit 1

   git commit -m "$(echo "rebuilding site `date`")"
   [[ $? -ne 0 ]] && echo "Unable to commit docs to git ; exiting " && exit 1

   git push 
   [[ $? -ne 0 ]] && echo "Unable to push docs to git ; exiting " && exit 1

else
  echo "Unable to build hugo site; exiting" && exit 1

fi
