#!/usr/bin/env bash
#=============================================================================#
# do all the make at once
#=============================================================================#
export PATH="$HOME/anaconda2/bin:$PATH" 
make clean
rm -r ./source/generated*
# mkdir ./source/generated
# mkdir ./source/generated/generated
# cp -r ./source/_templates ./source/generated/
# cp -r ./source/_templates ./source/generated/generated/
make html
# rsync -r build/html/ bs4doc/