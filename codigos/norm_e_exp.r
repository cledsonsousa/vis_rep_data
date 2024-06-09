library(ggplot2)

ggplot(data, aes(x = value)) + 
  geom_density(aes(group = variable, col = variable)) + 
  scale_colour_manual(values = 
    c("normal" = "#0000ff", "skewed" = "#bf0000")) + 
  labs(color = 'Type of Distribution') + 
  theme(legend.position = c(.7, .5)) + 
  ggtitle("Ditribição Normal e Exponencial") + 
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))
