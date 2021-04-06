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
orni.me.ctv <- read.ctv("scripts/Ornithometrics.ctv")
orni.me.ctv$repository <- "https://CRAN.R-project.org" ## or another mirror
# Install from the "install.views" function
install.views(orni.me.ctv)

# Install packages v2 --------------------------------------------------------
# Alernatively, you can load the CTV and 
orni.me.ctv <- read.ctv("scripts/Ornithometrics.ctv")
install.packages(orni.me.ctv$packagelist$name)
