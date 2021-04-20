#!/bin/sh

FILE=$1
FILE2=$2
# FILE="~/Github_proj/Ornithometrics-ctv/docs/Ornithometrics.html"
# FILE2="~/Github_proj/Ornithometrics-ctv/docs/Ornithometrics1.html"

sed -e "/\<head\>/a\\
\<link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"assets/favicon/favicon.ico\"\>" < $FILE > $FILE2

mv $FILE2 $FILE
