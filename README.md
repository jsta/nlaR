
<!-- README.md is generated from README.Rmd. Please edit that file -->
nlaR
====

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

The goal of nlaR is to provide an R interface to the National Lakes Assessment data. At this point it serves either the 2007 or 2012 data (see examples below).

Installation
------------

You can install nlaR from Github with:

``` r
# install.packages("devtools")
devtools::install_github("jsta/nlaR")
```

Load package
------------

``` r
library(nlaR)
```

Retrieve data from EPA Website
------------------------------

Data is stored in the location returned by `rappdirs::user_data_dir()`

``` r
nla_get(2012)
```

Compile to `rds` object
-----------------------

``` r
nla_compile(2012)
```

Load data from local machine
----------------------------

``` r
dt <- nla_load(2012)
```

View NLA tables
---------------

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

Compare 2007 and 2012 NLA lakes
-------------------------------

``` r
library(sp)
library(maps)

par(mfrow = c(1, 2))

dt <- nla_load(2007)
sp::coordinates(dt$SampledLakeInformation) <- ~ LON_DD + LAT_DD
map("usa")
title("NLA 2007")
points(dt$SampledLakeInformation,
       col = factor(dt$SampledLakeInformation$URBAN), cex = 0.5)
axis(1); axis(2)


dt <- nla_load(2012)
sp::coordinates(dt$wide_siteinfo) <- ~ LON_DD83 + LAT_DD83
map("usa")
title("NLA 2012")
points(dt$wide_siteinfo,
       col = factor(dt$wide_siteinfo$URBAN), cex = 0.5)
axis(1); axis(2)
```

![](images/map%20lakes-1.png)
