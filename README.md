# Ornithometrics (ctv) R Task View <a href='https://github.com/beausoleilmo/Ornithometrics-ctv'><img src='images/ornitho_logo.png' align="right" height="131.5" /></a>

The **Ornithometrics task view** was available from [https://beausoleilmo.github.io/Ornithometrics-ctv/Ornithometrics.html](https://beausoleilmo.github.io/Ornithometrics-ctv/Ornithometrics.html). Now, you can consult the .ctv file and output html page directly. I welcome anyone who want to host the page again. 

The Comprehensive R Archive Network (CRAN)'s [website](https://cran.r-project.org/web/views/) provides *task views* for a variety of topics, guiding the users to a diversity of packages that could be useful to that topic. Here we provide a collection of relevant packages in ornithology that covers a wide variety of topics in avian studies. 

A package is missing? Please, feel free to get in touch and share your ideas! 

```
# Install and load libraries ----------------------------------------------------------
install.packages("ctv")
library(ctv)

# Download the CTV to a know location -------------------------------------

# On Github, the ".ctv" is in "scripts" folder
ornitho.metrics.ctv <- read.ctv("scripts/Ornithometrics.ctv")

# Use the install.packages() function to install the packages
install.packages(ornitho.metrics.ctv$packagelist$name)
```

## References

The references of the packages in the CTV can be found in the `bib` [folder here](https://github.com/beausoleilmo/Ornithometrics-ctv/tree/main/docs/assets/bib/OrnithoBiblio.bib).
