################ Parte 1 #####################
ggplot(int00.dat, aes(x = clock, y = perf)) +
  geom_point() +
  labs(title = "Int2000", x = "Clock", y = "Performance")
################ Parte 2 #####################
# Supondo que int00.lm é o modelo linear ajustado usando lm()
int00.lm <- lm(perf ~ clock, data = int00.dat)

# Criar o gráfico com ggplot2
ggplot(int00.dat, aes(x = clock, y = perf)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Int2000", x = "Clock", y = "Performance")+
theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))