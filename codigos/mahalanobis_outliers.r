# Carregar pacotes necessários
library(car)
library(ggplot2)

# Selecionar as variáveis "Ozone" e "Temp" e remover valores ausentes
air <- airquality[c("Ozone", "Temp")]
air <- na.omit(air)

# Calcular o ponto central (média de Ozone e Temp)
air_center <- colMeans(air)

# Calcular a matriz de covariância
cov_matrix <- cov(air)

# Verificar se há valores ausentes na matriz de covariância
if (any(is.na(cov_matrix))) {
  stop("A matriz de covariância contém valores ausentes (NA). Verifique seus dados.")
}

# Calcular as distâncias de Mahalanobis para cada ponto
distances <- mahalanobis(x = air, center = air_center, cov = cov_matrix)

# Definir o valor de corte baseado na distribuição qui-quadrado com p = 0.95 e df = 2 (ncol(air))
cutoff <- qchisq(p = 0.95, df = ncol(air))

# Identificar os outliers (pontos com distância maior que o valor de corte)
outliers <- air[distances > cutoff, ]

# Imprimir os outliers
print(outliers)

# Gerar a elipse com base no centro e na matriz de covariância
ellipse_coords <- ellipse(center = air_center, shape = cov_matrix, radius = sqrt(qchisq(0.95, df = 2)), draw = FALSE)

# Converter as coordenadas da elipse para um data frame
ellipse_df <- as.data.frame(ellipse_coords)

# Criar o gráfico de dispersão com a elipse e destacar os outliers
figure <- ggplot(air, aes(x = Ozone, y = Temp)) +
  geom_point(size = 2) +
  geom_polygon(data = ellipse_df, aes(x = x, y = y), fill = "orange", color = "orange", alpha = 0.5) +
  geom_point(aes(x = air_center[1], y = air_center[2]), size = 5, color = "blue") +
  geom_point(data = outliers, aes(x = Ozone, y = Temp), color = "red", size = 3) +
  geom_text(aes(label = row.names(air)), hjust = 1, vjust = -1.5, size = 2.5) +
  ylab("Temperatura") + xlab("Ozônio") +
  ggtitle("Elipse Envolvendo Dados e Outliers Destacados") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Exibir o gráfico
print(figure)
