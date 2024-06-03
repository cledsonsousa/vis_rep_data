set.seed(123)  # Para reprodutibilidade

# Dados para R^2 próximo de 0,3
x1 <- runif(100, min = 0, max = 100)  # Variável independente
y1 <- 0.3 * x1 + rnorm(100, mean = 0, sd = 30)  # Variável dependente com ruído significativo

# Dados para R^2 próximo de 0,9
x2 <- runif(100, min = 0, max = 100)  # Variável independente
y2 <- 0.9 * x2 + rnorm(100, mean = 0, sd = 10)  # Variável dependente com pouco ruído

# Ajustando os modelos de regressão linear
model1 <- lm(y1 ~ x1)
model2 <- lm(y2 ~ x2)

# Calculando R^2
r2_model1 <- summary(model1)$r.squared
r2_model2 <- summary(model2)$r.squared

# Gráfico para R^2 próximo de 0,3
plot1 <- ggplot(data.frame(x1, y1), aes(x = x1, y = y1)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Dispersão com R^2 ≈", round(r2_model1, 2)),
       x = "X",
       y = "Y") +
theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))


# Gráfico para R^2 próximo de 0,9
plot2 <- ggplot(data.frame(x2, y2), aes(x = x2, y = y2)) +
  geom_point(color = "green") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Dispersão com R^2 ≈", round(r2_model2, 2)),
       x = "X",
       y = "Y") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))

# Mostrar os gráficos lado a lado
library(gridExtra)
grid.arrange(plot1, plot2, ncol = 2)
