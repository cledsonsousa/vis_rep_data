# Se ainda não estiver instalado
install.packages("ggplot2")

# Carregar o pacote
library(ggplot2)


delta <- predicted.dat - test.dat$nperf

# Criar um data frame com delta
delta_df <- data.frame(Index = 1:length(delta), Delta = delta)

# Criar o gráfico com ggplot2
ggplot(delta_df, aes(x = Index, y = Delta)) +
  geom_point() +
  labs(title = "Dispersão", x = "Index", y = "Delta") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10)) +
  scale_color_manual(values = c("black", "red"),
                     labels = c("Falso", "Verdadeiro"))

