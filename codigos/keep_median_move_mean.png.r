# Carregar a biblioteca ggplot2 para visualização
library(ggplot2)
library(gridExtra) # Para organizar os plots lado a lado

# Configurar a semente para reprodutibilidade
set.seed(123)

# Criar o conjunto de dados original
data1 <- c(rnorm(100, mean = 50, sd = 10))

# Calcular a média e a mediana original
original_mean <- mean(data1)
original_median <- median(data1)

# Criar o conjunto de dados com outliers
data2 <- c(data1, 150, 150, 150)  # Adicionar outliers

# Preparar data frames para plotagem
df1 <- data.frame(value = data1)
df2 <- data.frame(value = data2)

# Criar plots para data1
p1_hist <- ggplot(df1, aes(x = value)) + 
  geom_histogram(bins = 30, fill = "blue", color = "black") + 
  geom_vline(aes(xintercept = original_mean), color = "red", size=1, linetype = "dashed") +
  geom_vline(aes(xintercept = original_median), color = "green", size=1, linetype = "dashed") +
  annotate("text", x = 60, y = 8, label = sprintf("%.2f", original_mean), color = "red", vjust = -0.5) +
  annotate("text", x = 45, y = 8, label = sprintf("%.2f", original_median), color = "green", vjust = -0.5) +
  labs(title = "Histogram for Data1", x = "Values", y = "Frequency") +
  theme_minimal()

p1_box <- ggplot(df1, aes(x = "", y = value)) + 
  geom_boxplot(fill = "blue") +
  geom_hline(aes(yintercept = original_mean), color = "red", linetype = "dashed") +
  geom_hline(aes(yintercept = original_median), color = "green", linetype = "dashed") +
  labs(title = "Boxplot for Data1") +
  theme_minimal()

# Criar plots para data2
p2_hist <- ggplot(df2, aes(x = value)) + 
  geom_histogram(bins = 30, fill = "blue", color = "black") + 
  geom_vline(aes(xintercept = mean(data2)), color = "red", size=1, linetype = "dashed") +
  geom_vline(aes(xintercept = median(data2)), color = "green", size=1, linetype = "dashed") +
  annotate("text", x = 70, y = 12, label = sprintf("%.2f", mean(data2)), color = "red", vjust = -0.5) +
  annotate("text", x = 30, y = 12, label = sprintf("%.2f", median(data2)), color = "green", vjust = -0.5) +
  labs(title = "Histogram for Data2", x = "Values", y = "Frequency") +
  theme_minimal()

p2_box <- ggplot(df2, aes(x = "", y = value)) + 
  geom_boxplot(fill = "blue") +
  geom_hline(aes(yintercept = mean(data2)), color = "red", linetype = "dashed") +
  geom_hline(aes(yintercept = median(data2)), color = "green", linetype = "dashed") +
  labs(title = "Boxplot for Data2") +
  theme_minimal()

# Organizar os gráficos lado a lado
grid.arrange(p1_hist, p1_box, p2_hist, p2_box, ncol = 2)
