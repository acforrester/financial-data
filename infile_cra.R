# ================================================================== #
#   Program: get_sdi
#   Author:  A.C. Forrester 
#   Descrip: Get the Statistics on Depository institutions (SDI)
#            
# ================================================================== #

rm(list=ls())

# Set directories
zip <- "F:/banking_data/build/input/cra/zip/"
raw <- "F:/banking_data/build/input/cra/raw/"
out <- "F:/banking_data/build/input/cra/out/"

# Set directory
setwd(zip)


pos.2005 <- c(5,4,1,1,
              2,3,5,7,
              1,1,3,3,
              10,10,10,10,10,10,10,10,29)

name.2005 <- c("table.id",
               "year",
               "loan.type",
               "action",
               "st.fips",
               "ct.fips",
               "msa",
               "census.tract",
               "split.county",
               "pop.classif",
               "inc.grp",
               "rept.lvl",
               "num.l100",
               "amt.l100",
               "num.l250",
               "amt.l250",
               "num.l1mil",
               "amt.l1mil",
               "num.rev1mil",
               "amt.rev1mil",
               "filler")

dat.2005 <- read.fwf(paste0("05exp_aggr.dat"), 
                     widths = pos.2005,
                     col.names=name.2005)
