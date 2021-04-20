# Description  ------------------------------------------------------------
#### ### ### ## #### ### ### ## #### ### ### ## 
# Install all packages in the Ornithometrics.ctv
# Created by Marc-Olivier Beausoleil
# Tuesday, April 6, 2021
# Why: 
# Requires: ctv package and the downloaded Ornithometrics.ctv file in a known location 
# NOTES: 
#### ### ### ## #### ### ### ## #### ### ### ## 

# Preparation -------------------------------------------------------------
install.packages("ctv")

# Load libraries ----------------------------------------------------------
library(ctv)

# Install packages v1 --------------------------------------------------------
# Add the path from where the Ornithometrics.ctv is found. 
ornitho.metrics.ctv <- read.ctv("scripts/Ornithometrics.ctv")
ornitho.metrics.ctv$repository <- "https://CRAN.R-project.org" ## or another mirror
# Install from the "install.views" function
install.views(ornitho.metrics.ctv)

# Install packages v2 --------------------------------------------------------
# Alernatively, you can load the CTV and 
ornitho.metrics.ctv <- read.ctv("scripts/Ornithometrics.ctv")
install.packages(ornitho.metrics.ctv$packagelist$name)
