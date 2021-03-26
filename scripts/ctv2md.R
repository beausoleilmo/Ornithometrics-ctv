#!/usr/bin/r
## if you do not have /usr/bin/r from littler, just use Rscript

# Modified from https://github.com/terrytangyuan/ctv-databases/blob/master/ctv2md.R 
#  macOS requirement:  brew install pandoc
title = "Ornithometrics"
ctv <- paste0("scripts/",title)

ctvfile  <- paste0(ctv, ".ctv")
htmlfile <- paste0(ctv, ".html")
#mdfile   <- paste0(ctv, ".md") 
mdfile   <- "CTVmd.md"

## load packages
suppressMessages(library(XML))          # called by ctv
suppressMessages(library(ctv))

r <- getOption("repos")                 # set CRAN mirror
r["CRAN"] <- "http://cran.rstudio.com"
options(repos=r)

check_ctv_packages(ctvfile)             # run the check

## create html file from ctv file
ctv2html(read.ctv(ctvfile), htmlfile)

### these look atrocious, but are pretty straight forward. read them one by one
###  - start from the htmlfile
cmd <- paste0("cat ", htmlfile,
              ###  - in lines of the form  ^<a href="Word">Word.html</a>
              ###  - capture the 'Word' and insert it into a larger URL containing an absolute reference to task view 'Word'
              " | sed -e 's|^<a href=\"\\([a-zA-Z]*\\)\\.html|<a href=\"http://cran.rstudio.com/web/views/\\1.html\"|' | ",
              ###  - call pandoc, specifying html as input and github-flavoured markdown as output
              "pandoc -s -r html -w gfm | ",
              ###  - deal with the header by removing extra ||, replacing |** with ** and **| with **:              
              "sed -e's/||//g' -e's/|\\*\\*/\\*\\*/g' -e's/\\*\\*|/\\*\\* /g' -e's/|$/  /g' ",
              ###  - make the implicit URL to packages explicit
              "-e's|../packages/|http://cran.rstudio.com/web/packages/|g' ",
              ###  - write out mdfile
              "> ", mdfile)

system(cmd)                             # run the conversion

unlink(htmlfile)                        # remove temporary html file

cat("Done.\n")

rmarkdown::render(mdfile, "html_document", 
                  output_options = list(pandoc_args = c("--metadata=title:Ornithometrics")))

