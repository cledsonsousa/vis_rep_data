# Instalar e carregar os pacotes necessários
install.packages("factoextra")
install.packages("ggplot2")

library(factoextra)
library(ggplot2)

# Carregar o conjunto de dados multishapes
data("multishapes", package = "factoextra")

# Plotar o gráfico usando ggplot2
p <- ggplot(multishapes, aes(x = x, y = y)) +
  geom_point(color = "black") +
  labs(x = "X", y = "Y") +
  labs(title = "5 agrupamentos não convexos e outliers")+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))