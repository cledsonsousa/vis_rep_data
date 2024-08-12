# Carregar pacotes necessários
library(car)
library(ggplot2)

# Encontrando distâncias
distances <- mahalanobis(x = air , center = air.center , cov = air.cov)

# Valor de corte para distâncias da distribuição qui-quadrado 
# com p = 0.95 df = 2, que é ncol(air)
cutoff <- qchisq(p = 0.95 , df = ncol(air))

## Exibir observações cujas distâncias são maiores que o valor de corte
air[distances > cutoff ,]
## Retorna: observações 30, 62, 99, 117

# Criar o data frame com os valores fornecidos
air         = airquality[c("Ozone" , "Temp")]
air         = na.omit(air)

# Calcular o ponto central (média de Ozone e Temp)
air_center <- colMeans(air)

# Calcular a matriz de covariância
cov_matrix <- cov(air)

# Verificar se há valores ausentes na matriz de covariância
if (any(is.na(cov_matrix))) {
  stop("A matriz de covariância contém valores ausentes (NA). Verifique seus dados.")
}

# Forçar a simetria da matriz de covariância
cov_matrix <- (cov_matrix + t(cov_matrix)) / 2

# Verifique novamente se a matriz de covariância é simétrica
if (max(abs(cov_matrix - t(cov_matrix))) > 1e-10) {
  stop("A matriz de covariância não é simétrica.")
}

# Gerar a elipse com base no centro e na matriz de covariância
ellipse_coords <- ellipse(center = air_center, shape = cov_matrix, radius = sqrt(qchisq(0.95, df = 2)), draw = FALSE)

# Converter as coordenadas da elipse para um data frame
ellipse_df <- as.data.frame(ellipse_coords)

# Criar o gráfico de dispersão com a elipse
figure <- ggplot(air, aes(x = Ozone, y = Temp)) +
  geom_point(size = 2) +
  geom_polygon(data = ellipse_df, aes(x = x, y = y), fill = "orange", color = "orange", alpha = 0.5) +
  geom_point(aes(x = air_center[1], y = air_center[2]), size = 5, color = "blue") +
  geom_text(aes(label = row.names(air)), hjust = 1, vjust = -1.5, size = 2.5) +
  ylab("Temperatura") + xlab("Ozônio") +
  ggtitle("Elipse Envolvendo Dados sem Outliers") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Exibir o gráfico
print(figure)
