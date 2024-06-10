library(ggplot2)
library(gridExtra)  # Carrega o pacote para organizar os gráficos lado a lado

# Suponha que 'world' seja seu dataframe e 'homicide' o campo com dados
# Calcular a média de homicídios
media_homicide <- mean(world$homicide, na.rm = TRUE)

# Criar o histograma
histograma <- ggplot(world, aes(x = homicide)) +
  geom_histogram(bins = 20, fill = "#0000ff") +
  geom_vline(xintercept = 8.45, col = "#bf0000", size = 1) +
  #annotate("segment", x = 0, y = 0, xend=0, yend=inf color = "#bf0000", size = 3) 
  annotate("text", x = 15, y = -7, label = "8.45", color = "#bf0000", size = 3) +
  labs(title = "Taxa de homicídios mundial",
       x = "Número de homicídios por 100.000 habitantes") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Criar o boxplot
boxplot <- ggplot(world, aes(x = "", y = homicide)) +
  geom_boxplot() +
  geom_point(aes(x = "", y = media_homicide), color = "red", size = 3) +
  labs(title = "Box-plot da taxa de homicídios",
       y = "Número de homicídios por 100.000 habitantes") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Organizar os gráficos lado a lado
grid.arrange(histograma, boxplot, ncol = 2)
