#' @title Extract county level vaccination data
#'
#' @description Extract county level vaccination data.
#'
#' @param file The file that contains the data to be extracted
#' @param year The year that the data was collected
#' @param rows The minimum and maximum rows to be extracted
#' @return Returns the county level vaccination dataframe
#'
#' @export
extract_vaccination <- function(file, year, rows){
  yr <- system.file("extdata", file, package = "CAvaccines")

  # Extract relevant data from each file
  yr <- suppressMessages(
    readxl::read_excel(yr,
                       sheet = "Enrollment 20 or More",
                       range = readxl::cell_rows(rows),
                       na = ".",
                       col_names = FALSE))

  # Select a subset of variables and remove all schools that did not report
  yr <- yr %>%
    stats::setNames(1:30) %>%
    dplyr::select(.data$`1`:.data$`3`, .data$`6`:.data$`7`, .data$`9`,
                  .data$`11`, .data$`13`, .data$`15`, .data$`17`,
                  .data$`19`, .data$`21`, .data$`23`, .data$`25`,
                  .data$`27`, .data$`29`, .data$`30`) %>%
    dplyr::filter(.data$`30` != "N")

  # Remove less than or equal, greater than or equal, and percent from data
  yr[, 6:16] <- as.data.frame(gsub("[^[:alnum:]]", "", as.matrix(yr[, 6:16])))
  for (i in 6:16){
    yr[,i] = as.numeric(unlist(yr[,i]))
  }

  # Label the columns of the dataset
  colnames(yr) <-
    c("School_Code", "Jurisdiction", "School_Type", "School_Name", "Enrollment",
      "Up_to_Date", "Conditional", "PME", "PBE", "Others", "Overdue",
      "DTP", "Polio", "MMR", "HepB", "Var", "Reported")

  # Change name of dataset and turn Jurisdiction into a factor, turn into lowercase
  school_yr <- as.data.frame(yr)
  school_yr$Jurisdiction <- tolower(school_yr$Jurisdiction)
  school_yr$Jurisdiction <- as.factor(school_yr$Jurisdiction)

  # We now take the school level vaccination data and create county level
  # vaccination data. For each measurment, we find the total number of kids per
  # school for that measurment, and then sum those numbers to get county level
  # data.
  county_yr <- school_yr %>%
    dplyr::group_by(.data$Jurisdiction) %>%
    dplyr::summarize(
      total_Enrollment  = sum(.data$Enrollment),
      total_Up_to_Date  = sum(.data$Up_to_Date/100*.data$Enrollment),
      total_Conditional = sum(.data$Conditional/100*.data$Enrollment),
      total_PME         = sum(.data$PME/100*.data$Enrollment),
      total_PBE         = sum(.data$PBE/100*.data$Enrollment),
      total_Others      = sum(.data$Others/100*.data$Enrollment),
      total_Overdue     = sum(.data$Overdue/100*.data$Enrollment),
      total_DTP         = sum(.data$DTP/100*.data$Enrollment),
      total_Polio       = sum(.data$Polio/100*.data$Enrollment),
      total_MMR         = sum(.data$MMR/100*.data$Enrollment),
      total_HepB        = sum(.data$HepB/100*.data$Enrollment),
      total_Var         = sum(.data$Var/100*.data$Enrollment))

  # Save as dataframe, turn Jurisdiction into a factor, add year
  county_yr <- as.data.frame(county_yr)
  county_yr$Jurisdiction <- as.factor(county_yr$Jurisdiction)
  county_yr$Year <- rep(year, nrow(county_yr))

  return(county_yr)
}
