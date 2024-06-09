library(ggplot2)

ggplot(world, aes(x = inf)) + 
  geom_histogram(aes(y = ..ncount..), fill = "#0000ff") + 
  geom_density(aes(y = ..scaled..)) + 
  theme_minimal() + 
  ylab("Scaled Density and Observation Count") + 
  xlab("Infant Mortality Rate") + 
  ggtitle("Figure 3-6: Infant Mortality Is Not Normally Distributed") + 
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))
