#' CAvaccines: A package for analyzing the relationship between vaccination
#' rates and infectious disease occurrence in California schools
#'
#' Project was undertaken as the final project for BIOL 1600.
#'
#' @docType package
#' @name CAvaccines
#'
#' @import ggplot2
#'
NULL

#' Pertussis Data
#'
#' Pertussis data from the California Department of Public Health.
#' The dataset includes the number of cases and the rate per 100,000
#' individuals from the years of 2008 till 2017.
#'
#' @format A data frame with variables:
#'   \describe{
#'     \item{Jurisdiction}{Jurisdiction of California}
#'     \item{2008Cases}{Number of pertussis cases in 2008}
#'     \item{2008Rates}{Incidence rate per 100,000 in 2008}
#'     \item{2009Cases}{Number of pertussis cases in 2009}
#'     \item{2009Rates}{Incidence rate per 100,000 in 2009}
#'     \item{2010Cases}{Number of pertussis cases in 2010}
#'     \item{2010Rates}{Incidence rate per 100,000 in 2010}
#'     \item{2011Cases}{Number of pertussis cases in 2011}
#'     \item{2011Rates}{Incidence rate per 100,000 in 2011}
#'     \item{2012Cases}{Number of pertussis cases in 2012}
#'     \item{2012Rates}{Incidence rate per 100,000 in 2012}
#'     \item{2013Cases}{Number of pertussis cases in 2013}
#'     \item{2013Rates}{Incidence rate per 100,000 in 2013}
#'     \item{2014Cases}{Number of pertussis cases in 2014}
#'     \item{2014Rates}{Incidence rate per 100,000 in 2014}
#'     \item{2015Cases}{Number of pertussis cases in 2015}
#'     \item{2015Rates}{Incidence rate per 100,000 in 2015}
#'     \item{2016Cases}{Number of pertussis cases in 2016}
#'     \item{2016Rates}{Incidence rate per 100,000 in 2016}
#'     \item{2017Cases}{Number of pertussis cases in 2017}
#'     \item{2017Rates}{Incidence rate per 100,000 in 2017}
#'   }
#'
#' @docType data
#' @keywords datasets
#' @name pertussis
#' @source \url{https://www.cdph.ca.gov/Programs/CID/DCDC/Pages/Immunization/disease.aspx#}
NULL

#' School Level Vaccination Data
#'
#' Vaccination data from the California Department of Public Health.
#' The data found online include the vaccination information reported by
#' schools for each school year. This dataset is from the 2017-2018
#' school year. Dataset contains information for each school that
#' reported numbers in CA.
#'
#' @format A data frame with variables:
#'   \describe{
#'     \item{School_Code}{School code specific to each school.}
#'     \item{Jurisdiction}{Jurisdiction of California.}
#'     \item{School_Type}{Indicates whether school is a public or private school.}
#'     \item{School_Name}{Name of the school.}
#'     \item{Enrollment}{Number of students enrolled.}
#'     \item{Up_to_Date}{Percent of up to date students. Up to date students
#'     must have four doses of polio vaccine (three doses are acceptable if at
#'     least one dose was received on or after the fourth birthday), five
#'     DTaP/DTP/DT vaccine doses (four doses are acceptable if at least one dose
#'     was received on or after the fourth birthday), and two doses of
#'     measles-containing vaccine, at least one of which must be measles, mumps,
#'     and rubella combined. Both doses must have been received on or after the
#'     first birthday. In addition, student must have three doses of hepatitis
#'     B vaccine and one dose of varicella vaccine or physician-documented
#'     varicella disease.}
#'     \item{Conditional}{Percent of students that do not meet all
#'     requirements. This may because the student lacks but is
#'     not yet due for a required dose, has a physician affidavit of Temporary
#'     Medical Exemption for one or more doses, or is a transfer student who
#'     has no record yet.}
#'     \item{PME}{Percent of students with a Permanent Medical Exemption (PME).
#'     Indicates that the physical condition of the student or medical
#'     circumstances relating to the student are such that immunization
#'     is permanently not indicated.}
#'     \item{PBE}{Percent of students with a Personal Belief Exemption (PBE),
#'     whereby a parent requests exemption from the immunization requirements
#'     for school entry because all or some immunizations are contrary to the
#'     parent's beliefs.}
#'     \item{Others}{Percent of students reported as attending independent
#'     study who do not receive classroom-based instruction or home-based
#'     private schools or receiving IEP services.}
#'     \item{Overdue}{Percent of students overdue for one or more immunizations.}
#'     \item{DTP}{Percent of students with full DTP vaccination course. Full
#'     course defined as 4 or more doses of any diphtheria and tetanus toxoids
#'     and pertussis vaccines including diphtheria and tetanus toxoids, and any
#'     acellular pertussis vaccine (DTaP/DTP/DT).}
#'     \item{Polio}{Percent of students with full Polio vaccination course.
#'     Full course defined as 3 or more doses of polio vaccine; oral polio
#'     vaccine (OPV) or inactivated polio vaccine (IPV) or any combination
#'     of these.}
#'     \item{MMR}{Percent of students with full MMR vaccination course.
#'     Full course defined as 2 doses of measles-mumps-rubella vaccine.}
#'     \item{HepB}{Percent of students with full HepB vaccination course.
#'     Full course defined as 3 or more doses of Hepatitis B vaccine.}
#'     \item{Var}{Percent of students with full Varicella vaccination course.
#'     Full course defined as 1 or more doses of varicella at or after child's
#'    first birthday, unadjusted for history of varicella illness.}
#'     \item{Reported}{A binary variable indicating whether the school reported
#'     vaccination rates or not.}
#'   }
#'
#' @docType data
#' @keywords datasets
#' @name school_vaccination
#' @source \url{https://www.shotsforschool.org/k-12/reporting-data/}
NULL

#' County Level Vaccination Data
#'
#' Vaccination data from the California Department of Public Health.
#' The data found online include the vaccination information reported by
#' schools for each school year. This dataset is from the 2017-2018
#' school year. Dataset contains information for each county in CA.
#' To compile county level data, numbers for all schools in each county
#' are averaged.
#'
#' @format A data frame with variables:
#'   \describe{
#'     \item{Jurisdiction}{Jurisdiction of California.}
#'     \item{avg_Enrollment}{Average number of students enrolled.}
#'     \item{avg_Up_to_Date}{Average percent of up to date students. Up to date
#'     students must have four doses of polio vaccine (three doses are acceptable
#'     if at least one dose was received on or after the fourth birthday), five
#'     DTaP/DTP/DT vaccine doses (four doses are acceptable if at least one dose
#'     was received on or after the fourth birthday), and two doses of
#'     measles-containing vaccine, at least one of which must be measles, mumps,
#'     and rubella combined. Both doses must have been received on or after the
#'     first birthday. In addition, student must have three doses of hepatitis
#'     B vaccine and one dose of varicella vaccine or physician-documented
#'     varicella disease.}
#'     \item{avg_Conditional}{Average percent of students that do not meet all
#'     requirements. This may because the student lacks but is
#'     not yet due for a required dose, has a physician affidavit of Temporary
#'     Medical Exemption for one or more doses, or is a transfer student who
#'     has no record yet.}
#'     \item{avg_PME}{Average percent of students with a Permanent Medical Exemption (PME).
#'     Indicates that the physical condition of the student or medical
#'     circumstances relating to the student are such that immunization
#'     is permanently not indicated.}
#'     \item{avg_PBE}{Average percent of students with a Personal Belief Exemption (PBE),
#'     whereby a parent requests exemption from the immunization requirements
#'     for school entry because all or some immunizations are contrary to the
#'     parent's beliefs.}
#'     \item{avg_Others}{Average percent of students reported as attending independent
#'     study who do not receive classroom-based instruction or home-based
#'     private schools or receiving IEP services.}
#'     \item{avg_Overdue}{Average percent of students overdue for one or more immunizations.}
#'     \item{avg_DTP}{Average percent of students with full DTP vaccination course. Full
#'     course defined as 4 or more doses of any diphtheria and tetanus toxoids
#'     and pertussis vaccines including diphtheria and tetanus toxoids, and any
#'     acellular pertussis vaccine (DTaP/DTP/DT).}
#'     \item{avg_Polio}{Percent of students with full Polio vaccination course.
#'     Full course defined as 3 or more doses of polio vaccine; oral polio
#'     vaccine (OPV) or inactivated polio vaccine (IPV) or any combination
#'     of these.}
#'     \item{avg_MMR}{Average percent of students with full MMR vaccination course.
#'     Full course defined as 2 doses of measles-mumps-rubella vaccine.}
#'     \item{avg_HepB}{Average percent of students with full HepB vaccination course.
#'     Full course defined as 3 or more doses of Hepatitis B vaccine.}
#'     \item{avg_Var}{Average percent of students with full Varicella vaccination course.
#'     Full course defined as 1 or more doses of varicella at or after child's
#'    first birthday, unadjusted for history of varicella illness.}
#'   }
#'
#' @docType data
#' @keywords datasets
#' @name county_vaccination
#' @source \url{https://www.shotsforschool.org/k-12/reporting-data/}
NULL
