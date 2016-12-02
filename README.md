
<!-- README.md is generated from README.Rmd. Please edit that file -->
nlaR
====

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

The goal of nlaR is to provide an R interface to the National Lakes Assessment data. At this point it only serves the 2007 data.

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
nla_get()
```

Compile to `rds` object
-----------------------

``` r
nla_compile()
```

Load data from local machine
----------------------------

``` r
dt <- nla_load()
```

View NLA tables
---------------

``` r
names(dt)
#>  [1] "Basin_Landuse_Metrics"                           
#>  [2] "Buffer_Landuse_Metrics"                          
#>  [3] "Chemical_ConditionEstimates"                     
#>  [4] "MeanDO_ConditionEstimate"                        
#>  [5] "MeanDO_Data"                                     
#>  [6] "PHab_CondtionEstimates"                          
#>  [7] "PHab"                                            
#>  [8] "PHab_Metrics"                                    
#>  [9] "PHab_Metrics"                                    
#> [10] "Phytoplankton_DiatomCount"                       
#> [11] "Phytoplankton_SampleInfo"                        
#> [12] "Phytoplankton_SoftAlgaeCount"                    
#> [13] "Plankton_OEModel_AnalysisData"                   
#> [14] "Plankton_OEModel_ConditionEstimates"             
#> [15] "Plankton_OEModel_ValidSitesUsed"                 
#> [16] "Profile"                                         
#> [17] "Recreational_ConditionEstimates"                 
#> [18] "SampledLakeInformation"                          
#> [19] "Secchi"                                          
#> [20] "SedimentDiatoms_Count_Bottom"                    
#> [21] "SedimentDiatoms_Count_Top"                       
#> [22] "SedimentDiatoms_IBI_ConditionEstimate"           
#> [23] "SedimentDiatoms_Index_Data"                      
#> [24] "SedimentDiatoms_InferenceModel"                  
#> [25] "SedimentDiatoms_InferenceModel_ConditionEstimate"
#> [26] "SedimentDiatoms_SampleInformation"               
#> [27] "SedimentDiatoms_Top&Bottom_InferenceModel_Data"  
#> [28] "Trophic_ConditionEstimate"                       
#> [29] "VisualAssessment"                                
#> [30] "WaterQuality"                                    
#> [31] "Zooplankton_Count"                               
#> [32] "Zooplankton_SampleInformation"
head(dt$MeanDO_Data)
#>         SITE_ID VISIT_NO   DO2_2M
#> 1 NLA06608-0001        1 8.233333
#> 2 NLA06608-0002        1       NA
#> 3 NLA06608-0002        2       NA
#> 4 NLA06608-0003        1 8.100000
#> 5 NLA06608-0003        2 9.000000
#> 6 NLA06608-0004        1 6.666667
```

Map NLA lakes
-------------

``` r
library(sp)
library(maps)

sp::coordinates(dt$SampledLakeInformation) <- ~ LON_DD + LAT_DD
map("usa")
points(dt$SampledLakeInformation,
       col = factor(dt$SampledLakeInformation$URBAN))
axis(1); axis(2)
```

![](images/map%20lakes-1.png)
