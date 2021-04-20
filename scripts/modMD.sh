#!/bin/sh

FILE=$1
sed -E '/CRAN Task View:/s~\(([^)]+)\)~(http://cran.rstudio.com/web/views/\1)~' $FILE > $2