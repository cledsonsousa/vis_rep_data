# Carregar o dataframe int00.dat
# Exemplo: int00.dat <- read.csv("caminho/para/seu/arquivo.csv")

# Calcular os valores preditos de nperf
int00.dat$pred_nperf <- -58.22 +
  0.02482 * int00.dat$clock +
  2.397 * int00.dat$cores -
  23.58 * int00.dat$voltage +
  139.9 * int00.dat$channel +
  87.03 * int00.dat$L1icache -
  576.8 * sqrt(int00.dat$L1icache) -
  89.03 * int00.dat$L1dcache +
  598 * sqrt(int00.dat$L1dcache) -
  0.008621 * int00.dat$L2cache +
  1.085 * sqrt(int00.dat$L2cache)

# Instalar e carregar o pacote ggplot2, se ainda não estiver instalado
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Criar o gráfico de nperf vs valores preditos de nperf
ggplot(int00.dat, aes(x = nperf, y = pred_nperf)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  labs(title = "Valores Observados vs Preditos de nperf",
       x = "Valores Observados de nperf",
       y = "Valores Preditos de nperf") +
theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))