library(mclust)
library(ggplot2)
library(data.table)

# Executa o Mclust com 3 clusters
res <- Mclust(data_example[, .(x, y)], G = 3, modelNames = "VVV", verbose = FALSE)

# Adiciona as classificações ao data_example
data_example[, cluster := as.factor(res$classification)]

# Plota a classificação usando ggplot2 com elipses
ggplot(data_example, aes(x = x, y = y, color = cluster, shape = cluster)) +
  geom_point(size = 3) +
  stat_ellipse(level = 0.95) +  # Desenha as elipses com um nível de confiança de 95%
  labs(title = "Classificação com Mclust ",
       x = "Variável X",
       y = "Variável Y",
       color = "Cluster", shape = "Cluster") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
axis.title = element_text(size = 12, face = "bold"),
axis.text = element_text(size = 10))
