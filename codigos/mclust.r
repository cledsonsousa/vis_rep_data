library(mclust)
res <- Mclust(data_example[, .(x, y)], G = 3, modelNames = "VVV", verbose = FALSE)
 
plot(res, what = "classification")