library(ggplot2)

# Criando um data frame com os valores ajustados e os resíduos
dados <- data.frame(
  Fitted = fitted(int00.lm),
  Residuals = resid(int00.lm)
)

# Criando o gráfico com ggplot2
ggplot(dados, aes(x = Fitted, y = Residuals)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Resíduos vs Valores Ajustados",
       x = "Valores Ajustados",
       y = "Resíduos") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))