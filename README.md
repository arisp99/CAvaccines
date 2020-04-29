
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CAvaccines

<!-- badges: start -->

[![Build
Status](https://travis-ci.com/arisp99/CAvaccines.svg?branch=master)](https://travis-ci.com/arisp99/CAvaccines)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]()
<!-- badges: end -->

The goal of CAvaccines is to analyze the relationship between
vaccination rates and infectious disease incidence in California
counties.

## Installation

To install the package, please run the code below. In order to install,
devtools must be installed and loaded.

``` r
# install.packages("devtools")
devtools::install_github("arisp99/CAvaccines")
```

## Usage

In order to run the main script, please refer to the vignettes folder.
More specifically, the script that is entitled: `vaccine_disease.Rmd`.

## Details

#### Motivation

With the recent COVID-19 pandemic, a large number of scientists and
companies have rushed to help the world. On the forefront of everyone’s
mind is how can a vaccine be developed to combat the pandemic. Vaccines
play a huge role in the world and are essential to the fight against
infectious diseases. It has been seen, time and time again, that vaccine
protect against deadly pathogens and save lives. However, disease
outbreaks still occur. The reasons for these outbreaks are not fully
understood.

#### Aims

The aim of this package, therefore, was to provide a system for
understanding the relationship between vaccination rates and disease
incidence. The package focuses on the state of California, USA and
provides two main datasets, one for vaccination rates, and one for
disease incidence of pertussis in California counties from the years of
2008 till 2017.

#### Data

The data is detailed in full in the associated help pages, but we
summarize the datasets below.

  - `county_vaccination` is a dataset containing information about
    vaccination rates of K-12 students for each CA county for the years
    of 2008-2017. The dataset contains the total number of students
    enrolled in K-12 schools in each county and various vaccination
    rates. These include, but are not limited to, the number and percent
    of students that are up to data on vaccinations, the number of
    percent of students with a personal medical exemption, the number
    and percent of students with a personal belief exemption, and the
    number and percent of students with an up to data DTP vaccination.
  - `pertussis` is a dataset containing all pertussis cases, arranged by
    county, from the years of 2008-2017 in the state of California. The
    dataset contains the number of cases and the number of cases per
    100,000 people for every county and every year.

## Development

Please note that this package is still under development and therefore
there may be missing features. This `README` will be updated as the
package is developed accordingly.
