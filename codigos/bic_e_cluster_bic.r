
outliers <- data_example[outlier == TRUE]
res <- Mclust(data_example[, .(x, y)], G = 2:6, modelNames = c("VVV", "EEE", "VII", "EII"), verbose = FALSE)
res
plot(res, what = "BIC")
plot(res, what = "classification")