# Carregar os pacotes necessários
library(ggplot2)
library(dplyr)
library(tidyr)

# Criar o data frame inicial
h <- data.frame(1:500)
set.seed(42) 
h$p1 <- rnorm(500, 0, 1)
h$p2 <- rnorm(500, 0, 2)
h$p3 <- rnorm(500, 0, 3)

# Converter de formato wide para long
data_long <- gather(h, condition, measurement, p1:p3, factor_key = TRUE)

# Transformar a coluna 'condition' em fatores com rótulos específicos
data_long$condition <- factor(data_long$condition, levels = c("p1", "p2", "p3"), labels = c("Std=1", "Std=2", "Std=3"))

library(ggplot2)
ggplot(data_long, aes(x = measurement)) + 
  geom_histogram(fill = "#0000ff", bins = 30) +  # Definir número de bins para controlar a granularidade do histograma
  facet_grid(. ~ condition) +  # Organizar os gráficos lado a lado com base na condição
  labs(
    title = "Aumento contínuo do desvio padrão em uma variável aleatória",
    x = ""  # Removendo texto do eixo x
  ) +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))