#install.packages("easystats")
library(easystats)
library(datasets)
data("PlantGrowth")
result <- t.test(weight ~ group, 
data = PlantGrowth, 
subset = group %in% c("ctrl", "trt1"))