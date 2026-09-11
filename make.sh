#!/bin/bash
#
# generate html slide show 

cat img/workflow.dot\
 | dot -Tpng\
 > img/workflow.png

pandoc\
 -t revealjs\
 -s\
 -o slides.html\
 README.md\
 -V revealjs-url=https://unpkg.com/reveal.js/\
 --include-in-header=slides.css\
 -V theme=serif

pandoc README.md\
 -o slides.pptx

pandoc\
 -t beamer\
 -o slides.pdf\
 README.md
