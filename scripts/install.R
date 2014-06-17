# These instructions will get you all the packages that we used on the RStudio server today.

# Commands till line 6 are only required on bare ubuntu boxes
sudo su 
sudo apt-get update
sudo apt-get install default-jdk
sudo apt-get install pandoc

# From here on till the end of the script should suffice for your local machine

install.packages(c("devtools",
"dplyr",
"ggplot2",
"AntWeb", 
"ecoengine", 
"rebird",
"rfisheries", 
"rWBclimate", 
"rfishbase", 
"spocc", 
"gender",
"geonames", 
"rplos", 
"rfigshare", 
"rAltmetric", 
"rdryad",
"taxize", 
"dvn", 
"dismo", 
"maptools", 
"rnoaa",
"rJava",
"pander"))


# Devtools packages

library(devtools)
install_github("ropensci/plotly")
install_github("rstudio/rmarkdown")
install_github("ropensci/git2r")
install_github("hadley/tidyr")

# Dependencies for EML
install.packages("ROOXML", repos="http://www.omegahat.org/R", type="source")
install.packages("Rcompression", repos="http://www.omegahat.org/R", type="source")

install_github("RWordXML", "duncantl") 
install.packages("Sxslt", repos="http://www.omegahat.org/R", type="source")
install.packages("RHTMLForms", repos="http://www.omegahat.org/R", type="source")
install.packages("XMLSchema", repos="http://www.omegahat.org/R", type="source")

# Finally install EML

install_github("ropensci/EML")
