## NOAA climate data: Plot sea ice data

### Map sea ice for 12 years, for April only, for the North pole


```r
library(rnoaa)
library(scales)
library(ggplot2)
library(plyr)
```


### Get URLs for data


```r
urls <- seaiceeurls(mo = "Apr", pole = "N")[1:12]
```


### Download sea ice data


```r
out <- llply(urls, noaa_seaice, storepath = "~/")
names(out) <- seq(1979, 1990, 1)
df <- ldply(out)
```


### Plot data


```r
ggplot(df, aes(long, lat, group = group)) + geom_polygon(fill = "steelblue") + 
    theme_ice() + facet_wrap(~.id)
```

![plot of chunk plot](figure/plot.png) 

