# ================================================================== #
#   Program: get_mda
#   Author:  A.C. Forrester 
#   Descrip: Get the MHDA flat files from the Nat'l Archives.
#            
# ================================================================== #


rm(list=ls())

# Set directories
zip <- "F:/banking_data/build/input/hmda/zip/"
raw <- "F:/banking_data/build/input/hmda/raw/"
out <- "F:/banking_data/build/input/hmda/out/"

# Set directory
setwd(zip)

# Years to get
get.years <- 2014:2016

# Root link
url <- "https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/"

get.hmda <- function(x) {
  
    # Links change a bit over the years
    if (x<2004) {
      link <- paste0(url,"HMS.F",x,".LARS.zip?download=true")
    }
    else if (x==2004) {
      link <- paste0(url,"ULAR04/u",x,"lar.public.dat.zip?download=true")
    }
    else if (x>2004 & x<2007) {
      link <- paste0(url,"FLAR0506/LARS.FINAL.",x,".DAT.zip?download=true")
    }
    else if (x>2006 & x<2009) {
      link <- paste0(url,"FLAR0708/lars.final.",x,".dat.zip?download=true")
    }
    else if (x==2009) {
      link <- paste0(url,"FLAR09/",x,"_Final_PUBLIC_LAR.dat.zip?download=true")
    }
    else if (x>2009 & x<2012) {
      yr <- sprintf('%02d',x %% 100)
      link <- paste0(url,"FTL",yr,"/Lars.final.",x,".dat.zip?download=true")
    }
    else if (x>=2012 & x<2014) {
      link <- paste0(url,x,"/Lars.final.",x,".dat.zip?download=true")  
    }
    else if (x>=2014) {
      link <-  paste0("https://www.ffiec.gov/hmdarawdata/LAR/National/",x,"HMDALAR%20-%20National.zip")
    }

    # Now get the file
    download.file(link,paste0("hmda_",x,".zip"))
}

# GO and get the files
lapply(get.years,get.hmda)

# ================================================================== #

#   END OF FILE