# Calcula clusters usando k-means para k variando de 2 a 6
km_res_k <- lapply(2:6, function(i) kmeans(data_example[, .(x, y)], i)$cluster)

# Calcula o índice Davies-Bouldin para cada solução de clustering
db_km <- lapply(km_res_k, function(j) intCriteria(data.matrix(data_example[, .(x, y)]),
                                                  j,
                                                  "Davies_bouldin")$davies_bouldin)

# Converte os resultados em um data.table e plota o índice Davies-Bouldin para cada k
ggplot(data.table(K = 2:6, Dav_Boul = unlist(db_km)), aes(K, Dav_Boul)) +
theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
axis.title = element_text(size = 12, face = "bold"),
axis.text = element_text(size = 10))
