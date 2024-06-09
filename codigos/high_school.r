library(ggplot2)

ggplot(states, aes(x = hsdiploma)) + 
  geom_histogram(aes(y = ..ncount..), fill = "#0000ff") + 
  geom_density(aes(y = ..scaled..)) + 
  ylab("Densidade e Frequência") + 
  xlab("Porcentagem da População com Diploma de Ensino Médio") + 
  ggtitle("Pouca Diferença Entre os Estados") + 
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))


