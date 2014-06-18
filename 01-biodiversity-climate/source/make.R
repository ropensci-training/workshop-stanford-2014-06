library(stringr)
if(str_detect(getwd(), "source")) {
files <- dir(pattern = ".Rmd")
l_ply(files, function(x) {
        knitr(x, output = paste0("../", substr(x, 1, nchar(x)-4), ".md"))
 }

} else {
	stop("Can't execute this code outside the source dir. Please set appropriate directory first")
} 
