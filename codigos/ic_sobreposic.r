# Carregar pacotes necessários
library(ggplot2)
library(dplyr)

# Gerar dados simulados
set.seed(123)
grupo_A <- rnorm(50, mean = 5, sd = 2)
grupo_B <- rnorm(50, mean = 6, sd = 2)

# Calcular médias e ICs
calc_ic <- function(data, conf.level = 0.95) {
  n <- length(data)
  mean <- mean(data)
  stderr <- sd(data) / sqrt(n)
  error <- qt(conf.level / 2 + 0.5, df = n - 1) * stderr
  c(mean = mean, lower = mean - error, upper = mean + error)
}

ic_A <- calc_ic(grupo_A)
ic_B <- calc_ic(grupo_B)

# Criar dataframe para plotagem
data_ic <- data.frame(
  grupo = c("A", "B"),
  media = c(ic_A["mean"], ic_B["mean"]),
  lower = c(ic_A["lower"], ic_B["lower"]),
  upper = c(ic_A["upper"], ic_B["upper"])
)

# Plotar os ICs
ggplot(data_ic, aes(x = grupo, y = media)) +
  geom_point(size = 4) +
  geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
  labs(title = "Intervalos de Confiança de 95% para Médias dos Grupos",
       x = "Grupo", y = "Média") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))
