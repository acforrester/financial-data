# ================================================================== #
#   Program: get_sdi
#   Author:  A.C. Forrester 
#   Descrip: Get the Statistics on Depository institutions (SDI)
#            
# ================================================================== #

rm(list=ls())

# Set directories
zip <- "F:/banking_paper/build/input/cra/zip/"
raw <- "F:/banking_paper/build/input/cra/raw/"
out <- "F:/banking_paper/build/input/cra/out/"

# Set directory
setwd(zip)

# Years to get
get.years <- 2000:2017

# Extract files
extract.cra <- function(x) {
  
  # Unzip
  unzip(paste0(zip,"aggr/","aggr",x,".zip"))
  
  # Some years have odd naming conventions
  if(file.exists("exp_aggr.dat")){
      yr <- sprintf('%02d',x %% 100)
      file.rename("exp_aggr.dat",paste0("aggr/",yr,"exp_aggr.dat"))
  }
}

lapply(get.years,extract.cra)





# ================================================================== #

#   END OF FILE