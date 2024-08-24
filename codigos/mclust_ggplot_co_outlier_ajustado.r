library(mclust)
library(ggplot2)
library(data.table)

# Executa o Mclust com 3 clusters
res <- Mclust(data_example[, .(x, y)], G = 3, modelNames = "VVV", verbose = FALSE)

# Adiciona as classificações ao data_example
data_example[, cluster := as.factor(res$classification)]

# Calcular o centro e desvios padrão de cada cluster
centers <- data_example[, .(center_x = mean(x), center_y = mean(y), 
                            sd_x = sd(x), sd_y = sd(y)), by = cluster]

# Identificar os outliers (mais de 2 desvios padrão)
data_example <- merge(data_example, centers, by = "cluster")
data_example[, outlier := (abs(x - center_x) > 2 * sd_x | abs(y - center_y) > 2 * sd_y)]

# Plota a classificação usando ggplot2 com elipses e centros
p <- ggplot(data_example, aes(x = x, y = y, color = cluster, shape = cluster)) +
  geom_point(size = 3, aes(color = ifelse(outlier, "Outlier", cluster))) +
  geom_point(data = centers, aes(x = center_x, y = center_y), color = "black", size = 4, shape = 8) + # Adiciona os centros
  stat_ellipse(level = 0.95) +  # Desenha as elipses com um nível de confiança de 95%
  scale_color_manual(values = c("red", "blue", "green", "purple", "orange")) +  # Defina cores apropriadas, incluindo para outliers
  labs(title = "Classificação com Mclust, Centros dos Clusters e Outliers",
       x = "Variável X",
       y = "Variável Y") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10),
        legend.title = element_blank(), # Remove o título da legenda
        legend.position = "right")  # Ajuste a posição da legenda conforme necessário

# Remover a legenda de forma (shape)
p + guides(shape = "none")
