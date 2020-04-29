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
pertussis <- dplyr::full_join(yr_2008_2012, yr_2013_2017, by = "Jurisdiction")

# Alter names so that there is no whitespace
names(pertussis) <- gsub("[^[:alnum:]]", "_", names(pertussis))

# Change name of CALIFORNIA cell to TOTALS to be clearer
pertussis$Jurisdiction[pertussis$Jurisdiction == "CALIFORNIA"] = "TOTALS"

# Make all county names lowercase
pertussis$Jurisdiction <- tolower(pertussis$Jurisdiction)

# Convert data to long format, and remove 2014 data. We first gather the
# "year" and the associated "number" (of cases). At this point, "year" and "number"
# contain both Cases and Rates of disease incidence. Therefore, we split year
# into "Year" and "Type", the year and whether the data point is cases or rates
# respectively. We then split the "Type" variable depending on whether the data
# point is Cases or Rates. Finally, we exclude the year 2014, due to issues in
# collecting vaccination data for 2014
pertussis <- pertussis %>%
  tidyr::gather(Year, Number, -Jurisdiction) %>%
  tidyr::separate(Year, c("Year", "Type")) %>%
  tidyr::spread(Type, Number)

# Convert pertussis to a dataframe and convert year into a factor
pertussis <- as.data.frame(pertussis)
pertussis$Year <- as.factor(pertussis$Year)

# Save pertussis data in data/ folder
usethis::use_data(pertussis, overwrite = TRUE)
