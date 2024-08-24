	km_res <- kmeans(data_example, 3)$cluster
		
		data_example[, class := as.factor(km_res)]
		
		centroids <- data_example[, .(x = mean(x), y = mean(y)), by = class]
		
		ggplot(data_example, aes(x, y, color = class, shape = class)) +
		geom_point(alpha = 0.75, size = 8) +
		geom_point(data = centroids, aes(x, y), color = "black", shape = "+", size = 18) +
		theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
		axis.title = element_text(size = 12, face = "bold"),
		axis.text = element_text(size = 10))