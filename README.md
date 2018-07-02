
<!-- README.md is generated from README.Rmd. Please edit that file -->
nlaR
====

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![CRAN status](http://www.r-pkg.org/badges/version/nlaR)](https://cran.r-project.org/package=nlaR) [![Travis-CI Build Status](https://travis-ci.org/jsta/nlaR.svg?branch=master)](https://travis-ci.org/jsta/nlaR)

The goal of nlaR is to provide an R interface to the National Lakes Assessment data. At this point it serves either the 2007 or 2012 data (see examples below).

Installation
------------

You can install nlaR from Github with:

``` r
# install.packages("devtools")
devtools::install_github("jsta/nlaR")
```

Usage
-----

### Load package

``` r
library(nlaR)
```

### Retrieve data from EPA Website

> Data is stored in the location returned by `rappdirs::user_data_dir()`

``` r
nla_get(2012)
```

### Compile to `rds` object

``` r
nla_compile(2012)
```

### Load data from local machine

``` r
dt <- nla_load(2012)
```

### View NLA tables

``` r
names(dt)
#>  [1] "algaltoxins"    "atrazine"       "bentcond"       "bentmet"       
#>  [5] "benttaxa_wide"  "chla_wide"      "phytocnt"       "phytotaxa_wide"
#>  [9] "secchi"         "topsedhg"       "waterchem_wide" "wide_benthic"  
#> [13] "wide_phab"      "wide_phabmet"   "wide_profile"   "wide_siteinfo" 
#> [17] "zoopcond"       "zoopmets"       "zooptaxa_wide"
head(dt$phytocnt)
#>   PUBLICATION_DATE  UID SAMPLE_TYPE TAXA_ID        PARAMETER   RESULT
#> 1        2/12/2014 6160        PHYL    4075        BIOVOLUME 219.9113
#> 2        2/12/2014 6160        PHYL    4075          DENSITY       25
#> 3        2/12/2014 6160        PHYL    4075   INITIAL_VOLUME     1080
#> 4        2/12/2014 6160        PHYL    4095 SUBSAMPLE_VOLUME      200
#> 5        2/12/2014 6160        PHYL    4095   VOLUME_COUNTED       10
#> 6        2/12/2014 6160        PHYL    4095       TOTAL_AREA 283.5287
```

More Examples
-------------

See [vignettes](https://jsta.github.io/nlaR/articles).

References
----------

-   [National Lakes Assessment EPA page](https://www.epa.gov/national-aquatic-resource-surveys/nla)

-   Water quality metadata
    -   [2012](https://www.epa.gov/sites/production/files/2016-12/nla2012_waterchem_meta.txt)
-   Stoddard, J.L., Van Sickle, J., Herlihy, A.T., Brahney, J., Paulsen, S., Peck, D.V., Mitchell, R. and Pollard, A.I., 2016. Continental-scale increase in lake and stream phosphorus: Are oligotrophic systems disappearing in the United States?. Environmental Science & Technology, 50(7), pp.3409-3415. [10.1021/acs.est.5b05950](https://doi.org/10.1021/acs.est.5b05950)
