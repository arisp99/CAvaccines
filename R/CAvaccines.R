#' CAvaccines: A package for analyzing the relationship between vaccination
#' rates and infectious disease occurrence in California counties
#'
#' Project was undertaken as the final project for BIOL 1600.
#'
#' @docType package
#' @name CAvaccines
#'
#' @import ggplot2
#' @importFrom rlang .data
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
#'     \item{2008_Cases}{Number of pertussis cases in 2008}
#'     \item{2008_Rates}{Incidence rate per 100,000 in 2008}
#'     \item{2009_Cases}{Number of pertussis cases in 2009}
#'     \item{2009_Rates}{Incidence rate per 100,000 in 2009}
#'     \item{2010_Cases}{Number of pertussis cases in 2010}
#'     \item{2010_Rates}{Incidence rate per 100,000 in 2010}
#'     \item{2011_Cases}{Number of pertussis cases in 2011}
#'     \item{2011_Rates}{Incidence rate per 100,000 in 2011}
#'     \item{2012_Cases}{Number of pertussis cases in 2012}
#'     \item{2012_Rates}{Incidence rate per 100,000 in 2012}
#'     \item{2013_Cases}{Number of pertussis cases in 2013}
#'     \item{2013_Rates}{Incidence rate per 100,000 in 2013}
#'     \item{2014_Cases}{Number of pertussis cases in 2014}
#'     \item{2014_Rates}{Incidence rate per 100,000 in 2014}
#'     \item{2015_Cases}{Number of pertussis cases in 2015}
#'     \item{2015_Rates}{Incidence rate per 100,000 in 2015}
#'     \item{2016_Cases}{Number of pertussis cases in 2016}
#'     \item{2016_Rates}{Incidence rate per 100,000 in 2016}
#'     \item{2017_Cases}{Number of pertussis cases in 2017}
#'     \item{2017_Rates}{Incidence rate per 100,000 in 2017}
#'   }
#'
#' @docType data
#' @keywords datasets
#' @name pertussis
#' @source \url{https://www.cdph.ca.gov/Programs/CID/DCDC/Pages/Immunization/disease.aspx#}
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
#'     \item{total_Enrollment}{Total number of students enrolled.}
#'     \item{total_Up_to_Date}{Total number of up to date students. Up to date
#'     students must have four doses of polio vaccine (three doses are acceptable
#'     if at least one dose was received on or after the fourth birthday), five
#'     DTaP/DTP/DT vaccine doses (four doses are acceptable if at least one dose
#'     was received on or after the fourth birthday), and two doses of
#'     measles-containing vaccine, at least one of which must be measles, mumps,
#'     and rubella combined. Both doses must have been received on or after the
#'     first birthday. In addition, student must have three doses of hepatitis
#'     B vaccine and one dose of varicella vaccine or physician-documented
#'     varicella disease.}
#'     \item{total_Conditional}{Total number of students that do not meet all
#'     requirements. This may because the student lacks but is
#'     not yet due for a required dose, has a physician affidavit of Temporary
#'     Medical Exemption for one or more doses, or is a transfer student who
#'     has no record yet.}
#'     \item{total_PME}{Total number of students with a Permanent Medical Exemption (PME).
#'     Indicates that the physical condition of the student or medical
#'     circumstances relating to the student are such that immunization
#'     is permanently not indicated.}
#'     \item{total_PBE}{Total number of students with a Personal Belief Exemption (PBE),
#'     whereby a parent requests exemption from the immunization requirements
#'     for school entry because all or some immunizations are contrary to the
#'     parent's beliefs.}
#'     \item{total_DTP}{Total number of students with full DTP vaccination course. Full
#'     course defined as 4 or more doses of any diphtheria and tetanus toxoids
#'     and pertussis vaccines including diphtheria and tetanus toxoids, and any
#'     acellular pertussis vaccine (DTaP/DTP/DT).}
#'     \item{total_Polio}{Percent of students with full Polio vaccination course.
#'     Full course defined as 3 or more doses of polio vaccine; oral polio
#'     vaccine (OPV) or inactivated polio vaccine (IPV) or any combination
#'     of these.}
#'     \item{total_MMR}{Total number of students with full MMR vaccination course.
#'     Full course defined as 2 doses of measles-mumps-rubella vaccine.}
#'     \item{total_HepB}{Total number of students with full HepB vaccination course.
#'     Full course defined as 3 or more doses of Hepatitis B vaccine.}
#'     \item{total_Var}{Total number of students with full Varicella vaccination course.
#'     Full course defined as 1 or more doses of varicella at or after child's
#'     first birthday, unadjusted for history of varicella illness.}
#'     \item{Year}{The year that the data was collected. School years represented as
#'     \code{XXXX-YYYY} are coded as being collected in year \code{YYYY}.}
#'   }
#'
#' @docType data
#' @keywords datasets
#' @name county_vaccination
#' @source \url{https://www.shotsforschool.org/k-12/reporting-data/}
NULL
