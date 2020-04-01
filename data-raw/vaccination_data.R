# Get data files
yr_2017_2018 <- system.file(
  "extdata",
  "2017-18CA_KindergartenDataLetter.xlsx",
  package = "CAvaccines"
)

# Extract relevant data from each file
yr_2017_2018 <- read_excel(yr_2017_2018,
                           sheet = "Enrollment 20 or More",
                           range = cell_rows(5:6735),
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
  c("School Code", "Jurisdiction", "School Type", "School Name", "Enrollment",
    "% Up to Date", "% Conditional", "% PME", "% PBE", "% Others", "% Overdue",
    "% DTP", "% Polio", "% MMR", "% HepB", "% Var", "Reported")

# Change name of dataset
vaccination <- as.data.frame(yr_2017_2018)

# Save vaccination data in data/ folder
usethis::use_data(vaccination, overwrite = TRUE)
