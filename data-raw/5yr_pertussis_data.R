# Get data files
yr_2008_2012 <- system.file(
  "extdata",
  "VPD-AnnualReportTables2012.xlsx",
  package = "CAvaccines"
)

yr_2013_2017 <- system.file(
  "extdata",
  "VPD-AnnualReportTables2017.xlsx",
  package = "CAvaccines"
)

# Extract relevant data from each file
yr_2008_2012 <- read_excel(yr_2008_2012, sheet = "5Yr Pertussis", range = cell_rows(2:61))
yr_2013_2017 <- read_excel(yr_2013_2017, sheet = "5Yr Pertussis", range = cell_rows(2:64))

# Combine the files together to get data from 2008-2017
pertussis    <- merge(yr_2008_2012, yr_2013_2017, by = "Jurisdiction")

# Change name of CALIFORNIA cell to TOTALS to be clearer
pertussis[6, 1] = "TOTALS"

# Save pertussis data in data/ folder
usethis::use_data(pertussis, overwrite = TRUE)
