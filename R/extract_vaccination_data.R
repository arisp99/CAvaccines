#' @title Extract county level vaccination data
#'
#' @description Extract county level vaccination data.
#'
#' @param file The file that contains the data to be extracted
#' @param year The year that the data was collected
#' @param rows The minimum and maximum rows to be extracted
#' @param sheet The sheet that contains the data in the excel file
#' @return Returns the county level vaccination dataframe
#'
#' @export
extract_vaccination <- function(file, year, rows, sheet){
  yr <- system.file("extdata", file, package = "CAvaccines")

  # Extract relevant data from each file
  yr <- suppressMessages(
    readxl::read_excel(yr,
                       sheet = sheet,
                       range = readxl::cell_rows(rows),
                       na = ".",
                       col_names = FALSE))

  # Select a subset of variables and remove all schools that did not report
  if (year %in% c("2008", "2009", "2010", "2011")){
    # Here we do not need to filter
    selection <- c("a", "b", "c", "e", "f", "h", "j", "l", "n", "p", "r", "v", "x", "z")

    colnames(yr) <- make.unique(rep(letters, length.out = ncol(yr)), sep='')
    yr <- dplyr::select(yr, selection)

  } else{
    # Here we need to filter
    if (year == "2012"){
      selection <- c("a", "b", "c", "f", "g", "i", "k", "m", "o", "q", "s", "w", "y", "a1", "b1")
    } else if (year %in% c("2013", "2014")){
      selection <- c("a", "b", "c", "f", "g", "i", "k", "m", "o", "q", "s", "u", "w", "y", "z")
    } else if (year %in% c("2015", "2016")){
      selection <- c("a", "b", "c", "f", "g", "i", "k", "m", "o", "w", "y", "a1", "c1", "e1", "f1")
    } else if (year %in% c("2017", "2018")){
      selection <- c("a", "b", "c", "f", "g", "i", "k", "m", "o", "u", "w", "y", "a1", "c1", "d1")
    } else{print("Wrong year was inputed!")}

    colnames(yr) <- make.unique(rep(letters, length.out = ncol(yr)), sep='')
    yr <- dplyr::select(yr, selection)
    yr <- dplyr::filter(yr, yr[ncol(yr)] != "N")
    yr[ncol(yr)] <- NULL
  }

  # Remove less than or equal, greater than or equal, and percent from data.
  # Note that we only do this for a subset of the data as the other datasets
  # had problems here
  if (year %in% c("2017", "2018")){
    for (i in 5:14){
      yr[, i] <- gsub("[[:punct:]]", "", as.matrix(yr[, i]))
      yr[, i] = as.numeric(unlist(yr[, i]))
    }
  }

  # Convert year 2013 columns into numbers because otherwise, was having issues with
  # parsing data file
  if (year == "2013"){
    for (i in 5:14){
      yr[, i] = as.numeric(unlist(yr[, i]))
    }
  }

  # Label the columns of the dataset
  colnames(yr) <-
    c("School_Code", "Jurisdiction", "School_Type", "School_Name", "Enrollment",
      "Up_to_Date", "Conditional", "PME", "PBE",
      "DTP", "Polio", "MMR", "HepB", "Var")

  # Change name of dataset and turn Jurisdiction into lowercase
  school_yr <- as.data.frame(yr)
  school_yr$Jurisdiction <- tolower(school_yr$Jurisdiction)

  # Make sure Enrollment is numeric
  school_yr$Enrollment <- as.numeric(school_yr$Enrollment)

  # We now take the school level vaccination data and create county level
  # vaccination data. For each measurment, we find the total number of kids per
  # school for that measurment, and then sum those numbers to get county level
  # data. We then divide the total columns by the total enrollment in order to
  # get percent of students. Lastly, we rename these percent columns into a
  # more clear form.
  county_yr <- school_yr %>%
    dplyr::group_by(.data$Jurisdiction) %>%
    dplyr::summarize(
      total_Enrollment  = sum(.data$Enrollment),
      total_Up_to_Date  = sum(.data$Up_to_Date/100*.data$Enrollment),
      total_Conditional = sum(.data$Conditional/100*.data$Enrollment),
      total_PME         = sum(.data$PME/100*.data$Enrollment),
      total_PBE         = sum(.data$PBE/100*.data$Enrollment),
      total_DTP         = sum(.data$DTP/100*.data$Enrollment),
      total_Polio       = sum(.data$Polio/100*.data$Enrollment),
      total_MMR         = sum(.data$MMR/100*.data$Enrollment),
      total_HepB        = sum(.data$HepB/100*.data$Enrollment),
      total_Var         = sum(.data$Var/100*.data$Enrollment)) %>%
    dplyr::mutate_at(dplyr::vars(-.data$Jurisdiction, -.data$total_Enrollment), list(avg = ~./total_Enrollment)) %>%
    dplyr::rename_at(dplyr::vars(dplyr::contains("_avg")), list(~paste("percent", gsub("total_|_avg", "", .), sep="_")))

  # Save as dataframe and add year
  county_yr <- as.data.frame(county_yr)
  county_yr$Year <- rep(year, nrow(county_yr))

  return(county_yr)
}
