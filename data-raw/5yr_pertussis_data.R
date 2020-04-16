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
yr_2008_2012 <- readxl::read_excel(yr_2008_2012, sheet = "5Yr Pertussis", range = readxl::cell_rows(2:61))
yr_2013_2017 <- readxl::read_excel(yr_2013_2017, sheet = "5Yr Pertussis", range = readxl::cell_rows(2:64))

# Combine the files together to get data from 2008-2017
pertussis <- merge(yr_2008_2012, yr_2013_2017, by = "Jurisdiction")

# Alter names so that there is no whitespace
names(pertussis) <- gsub("[^[:alnum:]]", "_", names(pertussis))

# Change name of CALIFORNIA cell to TOTALS to be clearer
pertussis[6, 1] = "TOTALS"

# Make all county names lowercase and convert to a factor
pertussis$Jurisdiction <- tolower(pertussis$Jurisdiction)
pertussis$Jurisdiction <- as.factor(pertussis$Jurisdiction)

# Remove rates as the data, convert data to long format, and remove 2014 data
# as the vaccination data for 2014 does not work
pertussis <- pertussis %>%
  dplyr::select(-contains("Rates")) %>%
  tidyr::gather(Year, Cases, -Jurisdiction) %>%
  dplyr::filter(Year != "2014_Cases")

# Change the Year variable to have only the years
pertussis$Year <- as.factor(gsub("[\\_[:alpha:]*]", "", pertussis$Year))

# Save pertussis data in data/ folder
usethis::use_data(pertussis, overwrite = TRUE)
