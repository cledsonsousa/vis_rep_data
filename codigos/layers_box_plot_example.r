# Carregar o pacote necessário
library(ggplot2)

# Gerar dados simulados
set.seed(123)
data <- data.frame(
  grupo = rep(c("A", "B"), each = 100),
  valor = c(rnorm(100, mean = 5, sd = 2), rnorm(100, mean = 7, sd = 2))
)

# Criar o gráfico de box plots
ggplot(data, aes(x = grupo, y = valor, fill = grupo)) +
  geom_boxplot() +
  labs(title = "Box Plots por Grupo", x = "Grupo", y = "Valor") +
  theme(
    plot.title = element_text(size = 24, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 20, face = "bold"),
    axis.text = element_text(size = 16)
  )
