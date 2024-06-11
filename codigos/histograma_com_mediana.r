library(ggplot2)
library(gridExtra)  # Carrega o pacote para organizar os gráficos lado a lado


# Calcular a média de homicídios
media_homicide <- mean(world$homicide, na.rm = TRUE)

# Criar o histograma
histograma <- ggplot(world, aes(x = homicide)) +
  geom_histogram(bins = 20, fill = "#0000ff") +
  geom_vline(xintercept = 3.3, col = "#bf0000", size = 1) +
  #annotate("segment", x = 0, y = 0, xend=0, yend=inf color = "#bf0000", size = 3) 
  annotate("text", x = 8, y = -7, label = "3,3", color = "#bf0000", size = 3) +
  labs(title = "Taxa de homicídios mundial",
       x = "Número de homicídios por 100.000 habitantes") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))
histograma

