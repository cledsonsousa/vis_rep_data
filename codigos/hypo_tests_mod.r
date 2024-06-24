# Carregar a biblioteca necessária
library(ggplot2)

# Definir as funções de densidade para as duas distribuições
densidade_H0 <- function(x) {
  dnorm(x, mean = 0, sd = 1)
}

densidade_H1 <- function(x) {
  dnorm(x, mean = 6, sd = 1)
}

# Criar um vetor de valores x
x <- seq(-4, 6, length = 1000)

# Calcular as densidades
y_H0 <- densidade_H0(x)
y_H1 <- densidade_H1(x)

# Definir o nível de significância alfa
alpha <- 0.05

# Determinar o valor crítico para a rejeição de H0
z_critico <- qnorm(1 - alpha, mean = 0, sd = 1)

# Criar o data frame para o ggplot
dados <- data.frame(x = c(x, x),
                    y = c(y_H0, y_H1),
                    Distribuicao = rep(c("H0", "H1"), each = length(x)))

# Criar o gráfico
ggplot(dados, aes(x = x, y = y, color = Distribuicao)) +
  geom_line(size = 1) +
  geom_vline(xintercept = z_critico, linetype = "dashed", color = "black") +
  annotate("text", x = z_critico, y = 0.3, label = "Valor Crítico", vjust = -0.5) +
  geom_ribbon(data = subset(dados, x >= z_critico & Distribuicao == "H0"), aes(ymax = y), ymin = 0, fill = "red", alpha = 0.2) +
  geom_ribbon(data = subset(dados, x < z_critico & Distribuicao == "H1"), aes(ymax = y), ymin = 0, fill = "blue", alpha = 0.2) +
  annotate("text", x = 4, y = 1, label = "Hipótese Nula H0", color = "red", hjust = 0, size = 4) +
  annotate("text", x = -1, y = 1, label = "Hipótese alternativa H1", color = "blue", hjust = 0, size = 4) +
  labs(title = "Curvas de Distribuição e Erros Tipo I e Tipo II",
       x = "Valores",
       y = "Densidade") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))+
  scale_color_manual(values = c("H0" = "blue", "H1" = "green"))
