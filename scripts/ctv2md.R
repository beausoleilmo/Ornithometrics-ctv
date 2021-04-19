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

# Make sure that there is NO "&" sign. 
tx  <- readLines(ctvfile)
pattern = '&'
replace = 'and'
tx2  <- gsub(pattern = pattern, replace = replace, x = tx)
writeLines(tx2, con=ctvfile)

check_ctv_packages(ctvfile)             # run the check

## create html file from ctv file
x = read.ctv(ctvfile)

ctv2html(x = read.ctv(ctvfile), file = htmlfile, css = "../CRAN_web.css", packageURL = "../packages/", reposname = "CRAN")

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
# output a markdown file 
system(cmd)                             # run the conversion

unlink(htmlfile)                        # remove temporary html file

# Correct the "Related links" sections... 
system("scripts/modMD.sh ~/Github_proj/Ornithometrics-ctv/CTVmd.md ~/Github_proj/Ornithometrics-ctv/CTVmdmod.md ")

cat("Done.\n")

mdfilemod   <- "CTVmdmod.md"
rmarkdown::render(input = mdfilemod, 
                  output_format = "html_document", output_dir = "docs",
                  output_file = "Ornithometrics",
                  output_options = list(pandoc_args = c("--metadata=title:Ornithometrics")))

