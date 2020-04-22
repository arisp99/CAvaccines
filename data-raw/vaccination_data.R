# Run function to get county level vaccination data
county_2008 <- extract_vaccination("2007-08CAKindergartenData.xls", "2008",  c(6, 7314), "KA0708")
county_2009 <- extract_vaccination("2008-09CAKindergartenData.xls", "2009",  c(6, 7179), "KA0809")
county_2010 <- extract_vaccination("2009-10CAKindergartenData.xls", "2010",  c(6, 7130), "KA0910")
county_2011 <- extract_vaccination("2010-11CAKindergartenData.xls", "2011",  c(6, 7170), "KA1011")
county_2012 <- extract_vaccination("2011-12CAKindergartenData.xls", "2012",  c(6, 7332), "Sheet1")
county_2013 <- extract_vaccination("2012-13CAKindergartenData.xls", "2013",  c(6, 7642), "KA1213")

# 2014 is experiencing problems for an unknown reason. Exclude it for simplicity.
# county_2014 <- extract_vaccination("2013-14CAKindergartenData.xlsx", "2014",  c(7, 7386), "KA1314")

county_2015 <- extract_vaccination("2014-15CAKindergartenData.xlsx", "2015",  c(6, 7470), "Sheet1")
county_2016 <- extract_vaccination("2015-16CAKindergartenData.xls", "2016",  c(6, 7427), "KA1516")
county_2017 <- extract_vaccination("2016-17KindergartenData.xlsx", "2017",  c(5, 6919), "Enrollment 20 or More")

# We do not have data on 2018 cases
# county_2018 <- extract_vaccination("2017-18CA_KindergartenDataLetter.xlsx", "2018",  c(5, 6735), "Enrollment 20 or More")

# Combine all the datasets together
county_vaccination <-
  dplyr::bind_rows(county_2008, county_2009, county_2010,
                   county_2011, county_2012, county_2013,
                   county_2015, county_2016, county_2017)

# Convert year into a factor
county_vaccination$Year <- as.factor(county_vaccination$Year)

# Save county level vaccination data in data/ folder
usethis::use_data(county_vaccination, overwrite = TRUE)
