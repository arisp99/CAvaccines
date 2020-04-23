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
#' The dataset includes the number of cases from the years of 2008 till 2017.
#'
#' @format A data frame with variables:
#'   \describe{
#'     \item{Jurisdiction}{Jurisdiction of California}
#'     \item{Year}{The year the data was recorded}
#'     \item{Cases}{The number of cases}
#'     \item{Rates}{The number of cases per 100,000 people}
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
#'     \item{percent_Up_to_Date}{The percent of up to date students. See \code{total_Up_to_Date}.}
#'     \item{percent_Conditional}{The percent of students that are conditional. See \code{total_Conditional}.}
#'     \item{percent_PME}{The percent of students with PME. See \code{total_PME}.}
#'     \item{percent_PBE}{The percent of students with PBE. See \code{total_PBE}.}
#'     \item{percent_DTP}{The percent of students vaccinated with DTP. See \code{total_DTP}.}
#'     \item{percent_Polio}{The percent of students vaccinated against polio. See \code{total_Polio}.}
#'     \item{percent_MMR}{The percent of students vaccinated with MMR. See \code{total_MMR}.}
#'     \item{percent_HepB}{The percent of students vaccinated against HepB. See \code{total_HepB}.}
#'     \item{percent_Var}{The percent of students vaccinated against varicella. See \code{total_Var}.}
#'     \item{Year}{The year that the data was collected. School years represented as
#'     \code{XXXX-YYYY} are coded as being collected in year \code{YYYY}.}
#'   }
#'
#' @docType data
#' @keywords datasets
#' @name county_vaccination
#' @source \url{https://www.shotsforschool.org/k-12/reporting-data/}
NULL
