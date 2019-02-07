# ================================================================== #
#   Program: get_cra
#   Author:  A.C. Forrester 
#   Descrip: Get the Community Reinvestment Act (CRA) data files
#            from the FFIEC website
#            
# ================================================================== #

rm(list=ls())

# Set directories
zip <- "F:/banking_data/build/input/cra/zip/"
raw <- "F:/banking_data/build/input/cra/raw/"
out <- "F:/banking_data/build/input/cra/out/"

# Set directory
setwd(zip)

# Years to get
get.years <- 2000:2017

# Files to get (universe is `aggr', `trans', and `disc')
get.files <- c("aggr","trans","discl")

# FFIEC URL
root <- "https://www.ffiec.gov/cra/xls/"

# Function to go get the files
get.cra <- function(x) {
  yr <- sprintf('%02d',x %% 100)
  lapply(get.files, function(y) download.file(paste0(root,yr,"exp_",y,".zip"),paste0(y,"/",y,x,".zip"))) 
}

# Get the files
lapply(get.years,get.cra)

# ================================================================== #

#   END OF FILE
