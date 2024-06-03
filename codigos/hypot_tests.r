install.packages("easystats")
library(easystats)
library(datasets)
data("PlantGrowth")
ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 20, size = 3, color = "red", fill = "red") +
  theme_minimal() +
  labs(title = "Crescimento das Plantas por Grupo de Tratamento",
       x = "Grupo",
       y = "Peso")+
theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))