library(ggplot2)
library(dplyr)

# Assume 'nes' is your data frame and 'pid7' is the variable of interest.
# First, calculate the counts and arrange the data
nes_sorted <- nes %>%
  count(pid7) %>%  # Count occurrences of each 'pid7' category
  arrange(desc(n)) %>%  # Arrange by count in descending order
  mutate(pid7 = factor(pid7, levels = rev(pid7)))  # Reorder factor levels based on count

# Now create the plot
ggplot(nes_sorted, aes(x = pid7, y = n)) + 
  geom_bar(stat = "identity", fill = "#0000bf") +  # Use identity to use 'n' for the bar heights
  theme_minimal() + 
  ggtitle("Strong Democrats supera Strong Republicans") + 
  xlab("Identificação Partidária") + 
  ylab("Número de Entrevistados") + 
  coord_flip() +  # Flip coordinates to have horizontal bars
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))
