# Get data files
yr_2017_2018 <- system.file(
  "extdata",
  "2017-18CA_KindergartenDataLetter.xlsx",
  package = "CAvaccines"
)

# Extract relevant data from each file
yr_2017_2018 <- readxl::read_excel(yr_2017_2018,
                           sheet = "Enrollment 20 or More",
                           range = readxl::cell_rows(5:6735),
                           na = ".",
                           col_names = FALSE)

# Select a subset of variables and remove all schools that did not report
yr_2017_2018 <-
  yr_2017_2018 %>%
  stats::setNames(1:30) %>%
  dplyr::select(`1`:`3`, `6`:`7`, `9`, `11`, `13`, `15`, `17`, `19`, `21`, `23`, `25`, `27`, `29`, `30`) %>%
  dplyr::filter(`30` != "N")

# Remove less than or equal, greater than or equal, and percent from data
yr_2017_2018[, 6:16] <- as.data.frame(gsub("[^[:alnum:]]", "", as.matrix(yr_2017_2018[, 6:16])))
for (i in 6:16){
  yr_2017_2018[,i] = as.numeric(unlist(yr_2017_2018[,i]))
}

# Label the columns of the dataset
colnames(yr_2017_2018) <-
  c("School_Code", "Jurisdiction", "School_Type", "School_Name", "Enrollment",
    "Up_to_Date", "Conditional", "PME", "PBE", "Others", "Overdue",
    "DTP", "Polio", "MMR", "HepB", "Var", "Reported")

# Change name of dataset and turn Jurisdiction into a factor, turn into lowercase
school_vaccination <- as.data.frame(yr_2017_2018)
school_vaccination$Jurisdiction <- tolower(school_vaccination$Jurisdiction)
school_vaccination$Jurisdiction <- as.factor(school_vaccination$Jurisdiction)

# Save school level vaccination data in data/ folder
usethis::use_data(school_vaccination, overwrite = TRUE)

# We now take the school level vaccination data and create county level
# vaccination data. For each measurment, we find the total number of kids per
# school for that measurment, and then sum those numbers to get county level
# data.
county_vaccination <- school_vaccination %>%
  dplyr::group_by(Jurisdiction) %>%
  dplyr::summarize(
    total_Enrollment  = sum(Enrollment),
    total_Up_to_Date  = sum(Up_to_Date/100*Enrollment),
    total_Conditional = sum(Conditional/100*Enrollment),
    total_PME         = sum(PME/100*Enrollment),
    total_PBE         = sum(PBE/100*Enrollment),
    total_Others      = sum(Others/100*Enrollment),
    total_Overdue     = sum(Overdue/100*Enrollment),
    total_DTP         = sum(DTP/100*Enrollment),
    total_Polio       = sum(Polio/100*Enrollment),
    total_MMR         = sum(MMR/100*Enrollment),
    total_HepB        = sum(HepB/100*Enrollment),
    total_Var         = sum(Var/100*Enrollment))

# Save as dataframe and turn Jurisdiction into a factor
county_vaccination <- as.data.frame(county_vaccination)
county_vaccination$Jurisdiction <- as.factor(county_vaccination$Jurisdiction)

# Save county level vaccination data in data/ folder
usethis::use_data(county_vaccination, overwrite = TRUE)
