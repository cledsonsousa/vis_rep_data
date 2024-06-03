# Ajustando o modelo de regressão linear
int00.lm <- lm(perf ~ clock, data = int00.dat)

# Extraindo os resíduos do modelo
residuos <- resid(int00.lm)

# Usando ggplot2 para criar o gráfico Q-Q
library(ggplot2)

# Crie um data frame para os resíduos
dados_residuos <- data.frame(Residuos = residuos)

# Adicione os quantis teóricos e os quantis amostrais
dados_residuos$Quantis_Teoricos <- qqnorm(dados_residuos$Residuos, plot.it = FALSE)$x
dados_residuos$Quantis_Observados <- qqnorm(dados_residuos$Residuos, plot.it = FALSE)$y

# Crie o gráfico Q-Q com ggplot2
ggplot(dados_residuos, aes(sample = Residuos)) +
  stat_qq() +
  stat_qq_line() +
  labs(title = "Gráfico Q-Q dos Resíduos",
       x = "Quantis Teóricos",
       y = "Quantis Observados") +
theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))