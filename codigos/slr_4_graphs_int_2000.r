library(ggplot2)
library(patchwork)

# Gráfico de resíduos vs valores ajustados
plot1 <- ggplot(int00.lm, aes(.fitted, .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Resíduos vs Valores Ajustados",
       x = "Valores Ajustados",
       y = "Resíduos") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))

# Gráfico Q-Q dos resíduos
plot2 <- ggplot(int00.lm, aes(sample = .stdresid)) +
  stat_qq() +
  stat_qq_line() +
  labs(title = "Gráfico Q-Q dos Resíduos",
       x = "Quantis Teóricos",
       y = "Quantis Observados") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))

# Gráfico de escala-local
plot3 <- ggplot(int00.lm, aes(.fitted, sqrt(abs(.stdresid)))) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(title = "Scale-location (Homocedasticidade)",
       x = "Valores Ajustados",
       y = "Raiz da |Resíduos Padronizados|") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))

# Gráfico de alavancagem
plot4 <- ggplot(int00.lm, aes(.hat, .stdresid)) +
  geom_point(aes(size = .cooksd)) +
  geom_smooth(se = FALSE) +
  labs(title = "Alavancagem vs Resíduos Padronizados",
       x = "Alavancagem",
       y = "Resíduos Padronizados") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10)) +
  theme(legend.position = "none")

# Combina todos os gráficos em um layout 2x2
(plot1 + plot2) / (plot3 + plot4)
