## rvertnet use case - Plot species occurrence data

### Load libraries


```coffee
library(rvertnet)
library(ggplot2)
library(doMC)
```


### Define a species list


```coffee
splist <- splist <- c("Accipiter erythronemius", "Junco hyemalis", "Aix sponsa", 
    "Haliaeetus leucocephalus", "Corvus corone", "Threskiornis molucca", "Merops malimbicus")
```


### Search for occurrences in VertNet


```coffee
registerDoMC(cores = 4)
out <- llply(splist, function(x) vertoccurrence(t = x, grp = "bird", num = 500), 
    .parallel = TRUE)
```


### Plot data


```coffee
vertmap(out)
```

```
## Warning: invalid factor level, NA generated
## Warning: invalid factor level, NA generated
## Warning: NAs introduced by coercion
## Warning: NAs introduced by coercion
```

```
## Rendering map...plotting 363264 points
```

![plot of chunk splist3](figure/splist3.png) 

