
# Biodiversity suite at rOpenSci

1. Gbif, Bison, Vertnet, taxize
    * rGBIF
    * Taxize
    * Vernet
2. rWBClimate, rNOAA
    * NOAA precipitation data as sparklines
    * NOAA sea ice data
    * Climate predictions for Europe

Acquiring various types of data from web repositories:

* [Global biodiversity data](https://github.com/ropensci/workshops-sheffield-2013-09/blob/master/01-biodiversity-climate/rgbif_usecase1.md)

*  [Resolving taxonomic data](https://github.com/ropensci/workshops-sheffield-2013-09/blob/master/01-biodiversity-climate/taxize_usecase2.md)

---

## Install these packages locally

```coffee
install.packages("taxize")
install.packages("rgbif")
install.packages("vertnet")
# Packages not currently on CRAN
install_github("rnoaa", "ropensci")
install_github("rWBclimate", "ropensci")
```
