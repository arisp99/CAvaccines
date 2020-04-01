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

# Change name of dataset and turn Jurisdiction into a factor
school_vaccination <- as.data.frame(yr_2017_2018)
school_vaccination$Jurisdiction <- as.factor(school_vaccination$Jurisdiction)

# Save school level vaccination data in data/ folder
usethis::use_data(school_vaccination, overwrite = TRUE)

# We now take the school level vaccination and create county level vaccination
county_vaccination <- school_vaccination %>%
  dplyr::group_by(Jurisdiction) %>%
  dplyr::summarize(
    avg_Enrollment  = mean(Enrollment),
    avg_Up_to_Date  = mean(Up_to_Date),
    avg_Conditional = mean(Conditional),
    avg_PME         = mean(PME),
    avg_PBE         = mean(PBE),
    avg_Others      = mean(Others),
    avg_Overdue     = mean(Overdue),
    avg_DTP         = mean(DTP),
    avg_Polio       = mean(Polio),
    avg_MMR         = mean(MMR),
    avg_HepB        = mean(HepB),
    avg_Var         = mean(Var))

# Save as dataframe
county_vaccination <- as.data.frame(county_vaccination)

# Save county level vaccination data in data/ folder
usethis::use_data(county_vaccination, overwrite = TRUE)
