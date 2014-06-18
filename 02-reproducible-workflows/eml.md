# A complete example of downloading, documenting, and depositing data

```r
library(rfisheries)
library(plyr)
library(reshape2)
library(ggplot2)
```

### First we download fisheries data for 4 commercially important anchovy fisheries

```r
species <- of_species_codes()
who <- c("TUX", "COD", "VET", "NPA")
by_species <- lapply(who, function(x) of_landings(species = x))
names(by_species) <- who
dat <- melt(by_species, id = c("catch", "year"))[, -5]
```

###  A little bit of data cleanup

```r
dat <- dat[-3]
names(dat) <- c("catch", "year", "a3_code")
write.csv(dat, file = "dat.csv")
```

### Next we plot the data

```
ggplot(dat, aes(year, catch)) + 
geom_line() + 
facet_wrap( ~ a3_code, scales = "free_y") +
ggtitle("Fisheries trends for commercially important Anchovy fisheries")
```

![Fisheries collapse](eml.png)

### Now we manipulate the data into a useful format with variables typecast correctly
```r
library(dplyr)
code_names <- species[which(species$a3_code %in% who), ] %>% 
select(a3_code, scientific_name)
codes <- code_names$scientific_name
names(codes) <- code_names$a3_code
dat$year <- as.Date(as.character(dat$year), '%Y')
```


Now we write the `XML` for the data and deposit this to figshare.

### As a last step, we define the columns and the units.

```r
require(EML)
col.defs <- c(catch = "Global Landings of fish", 
              year = "the year for which data was reported", 
              a3_code = "3 digit country code")
```

```r
# We define the units
unit.defs <- list("tonne", "YYYY", codes)
```

```r
# Finally we create a container to upload
# We are in the process of streamlining this step
dats <- data.set(dat, col.defs = col.defs, unit.defs = unit.defs)
```

```r
# The overall description of the EML file is the abstract (Think of this as a "data publication") 

abstract <- "Landings data for several species by year, from the OpenFisheries database"
```

### Login into figshare and upload your data + metadata

```r
# Logging into figshare
# This will happen automatically for most of you.

# In this demo, we use the following sandbox credentials.
options(FigshareToken = "QsqBaOrTBI0wuotW7cTDwAgFvSV1bmNouEoqYdWoYbZAQsqBaOrTXI0wuotW7cTDwA")
options(FigsharePrivateToken = "2gz16wL1Tszh4TY2z6opcQ")
options(FigshareKey = "kCV1UF2V1Bjw01TybvzDCg")
options(FigsharePrivateKey = "dGLFrnXeBjXi6qdsO6vwAg")
```

### Now we are ready to write out the `EML`

```r
eml_write(dat = dats, 
	# Please change this title so your submission appears unique during this workshop
	title = "Fisheries Landings Data for cod", 
	abstract = abstract, 
    creator = "Karthik Ram <karthik@ropensci.org>", 
    file = "landings.xml")
 ```
 
##3  and upload the data to figshare 
 
 ```r
eml_publish("landings.xml", 
	description = abstract, 
	categories = "Ecology", 
    tags = "fisheries", 
    destination = "figshare", 
    visibility = "private")
```

