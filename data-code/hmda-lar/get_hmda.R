gethmda <- function(x, y) {
# LAR function ---------------------------------------------------------------
#
# Downloads the Home Mortgage Disclosure Act (HMDA) Loan 
# Application Registry (LAR) data from the Consumer 
# Financial Protection Bureau (CFPB).
#
# Args:
#
#   x:  State postal code to get. `nationwide' downloads the
#       entire HMDA file.
#   y:  Year to download.  This can be in 2007 to 2017.
#
# Returns:
#   
#   Zip and CSV files in specified directory containing the HMDA 
#   LAR files for specified years.
#
# Changelog:
#
#   05-02-2019    Created
#   05-07-2019    Updated to download from CFPB instead of
#                 FFIEC.  CFPB files are more harmonious
#                 over time relative to FFIEC.
#   05-08-2019    Updated to allow queries by individual
#                 state.
#
# ----------------------------------------------------------------------------
  
  # checks
  if( x > 2017 || x < 2007) {
    print( "year not available from CFPB!" )
    return(NA)
  }

  # make the file url
  lar <- paste0( "hmda_" , x , "_" , y , "_all-records_codes.zip" )
  
  # check if the files already exist in directory
  if( !file.exists( paste0( zip , "/" , lar ) ) ) {
    
    # if not download the LAR file
    download.file( url = paste0( "https://files.consumerfinance.gov/hmda-historic-loan-data/" , lar ),
                   destfile = paste0( zip , "/" , lar )  )
    
    # unzip into specified directory
    unzip( paste0( zip , "/" , lar ) )
    
  }


}

getpnl <- function(x) {
# Reporter panel function ----------------------------------------------------
#
# Downloads the Home Mortgage Disclosure Act (HMDA) reporter 
# panel from the Consumer Financial Protection Bureau (CFPB).
#
# Args:
#
#   x  Year to download.  This can be in 2007 to 2017.
#
# Returns:
#   
#   Zip and CSV files in specified directory containing the HMDA 
#   LAR files for specified years.
#
# ----------------------------------------------------------------------------
  
  # checks
  if( x > 2017 || x < 2007) {
    print( "year not available from CFPB!" )
    return(NA)
  }
  
  # make the file url
  pnl <- paste0( "hmda_" , x , "_panel.zip" )
  
  # get the zip files if they don't exist
  if( !file.exists( paste0( zip , "/" , pnl ) ) ) {
    
    # download the LAR file
    download.file( url = paste0( "https://files.consumerfinance.gov/hmda-historic-institution-data/" , pnl ),
                   destfile = paste0( zip , "/" , pnl )  )
    
    # unzip into specified directory
    unzip( paste0( zip , "/" , pnl ) )
    
  }

}
