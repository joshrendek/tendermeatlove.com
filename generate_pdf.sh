#!/bin/bash
export TARGET_SITE="localhost:1313"
rm -rf url-list.txt
rm -rf tmp
mkdir tmp
wget --spider --force-html -r -l2 $TARGET_SITE 2>&1 | grep '^--' | awk '{ print $3 }' | grep -v '\.\(css\|js\|png\|gif\|jpg\)$' |  grep  "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" > url-list.txt
while read i; do wkhtmltopdf --print-media-type "$i" tmp/"$(echo "$i" | sed -e 's/https\?:\/\///' -e 's/\//-/g' ).pdf"; done < url-list.txt
/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o book.pdf tmp/*
