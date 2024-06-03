# Ajustando o modelo de regressão linear
int00.lm <- lm(perf ~ clock, data = int00.dat)

# Simulando um novo conjunto de dados com um modelo 90% preciso
set.seed(123)  # Para reprodutibilidade
fitted_values <- fitted(int00.lm)
residuals <- resid(int00.lm)

# Assumindo que um modelo 90% preciso tem 10% de erro
new_residuals <- rnorm(length(residuals), mean = 0, sd = 0.1 * sd(residuals))
new_fitted_values <- fitted_values + new_residuals
new_data <- data.frame(Fitted = new_fitted_values, Residuals = new_residuals)

# Criando o gráfico com ggplot2
library(ggplot2)

ggplot(new_data, aes(x = Fitted, y = Residuals)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Resíduos vs Valores Ajustados (Modelo 90% Preciso)",
       x = "Valores Ajustados",
       y = "Resíduos") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))