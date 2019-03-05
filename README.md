| **Service** | **Master** | **Develop** |
|:-------------:|:------:|:-------:|
| CI Status | [![Travis build status](https://travis-ci.org/UW-GAC/phsparsr.svg?branch=master)](https://travis-ci.org/UW-GAC/phsparsr) | [![Travis-CI Build Status](https://travis-ci.org/UW-GAC/phsparsr.svg?branch=develop)](https://travis-ci.org/UW-GAC/phsparsr?branch=develop) |
| Test Coverage | [![Coverage Status](https://img.shields.io/codecov/c/github/UW-GAC/phsparsr/master.svg)](https://codecov.io/github/UW-GAC/phsparsr/branch/master) | [![Coverage Status](https://img.shields.io/codecov/c/github/UW-GAC/phsparsr/develop.svg)](https://codecov.io/github/UW-GAC/phsparsr/branch/develop) |

# phsparsr

Tools for downloaders/users/people getting data out of dbGaP.

## Installation

You can install the released version of phsparsr from [github](https://github.com/UW-GAC/phsparsr) with:

``` r
# install.packages("devtools") 
devtools::install_github("UW-GAC/phsparsr")
```

## Example
```r
html_path <-
    system.file("extdata", "example.html",
                package = "phsparsr", mustWork = TRUE)

parsed <- parse_phs(html_path)
```
