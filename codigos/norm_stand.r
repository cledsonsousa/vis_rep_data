# Pacotes necessários
library(ggplot2)
library(gridExtra)

# Criando o dataframe original
df <- data.frame(
  Pais = c("França", "Espanha", "Alemanha", "Espanha", "Alemanha", "França", "Espanha", "França", "Alemanha", "França"),
  Idade = c(44, 27, 30, 38, 40, 35, 30, 48, 50, 37),
  Salario = c(72000, 48000, 54000, 61000, 63730, 58000, 52000, 79000, 83000, 67000),
  Compra_aprovada = c("Não", "Sim", "Não", "Não", NA, "Sim", "Não", "Sim", "Não", "Sim")
)

# Padronizando as colunas "Idade" e "Salario"
df$Idade_padronizada <- scale(df$Idade)
df$Salario_padronizado <- scale(df$Salario)

# Normalizando as colunas "Idade" e "Salario" usando a técnica de máximos e mínimos
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
df$Idade_normalizada <- normalize(df$Idade)
df$Salario_normalizado <- normalize(df$Salario)

# Criando histogramas para "Idade"
hist_idade_original <- ggplot(df, aes(x = Idade)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.4) +
  geom_density(color = "blue") +
  ggtitle(paste("Idade Original\nDesvio Padrão =", round(sd(df$Idade), 2)))

hist_idade_padronizada <- ggplot(df, aes(x = Idade_padronizada)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "red", alpha = 0.4) +
  geom_density(color = "red") +
  ggtitle(paste("Idade Padronizada\nDesvio Padrão =", round(sd(df$Idade_padronizada), 2)))

hist_idade_normalizada <- ggplot(df, aes(x = Idade_normalizada)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.4) +
  geom_density(color = "green") +
  ggtitle(paste("Idade Normalizada\nDesvio Padrão =", round(sd(df$Idade_normalizada), 2)))

# Criando histogramas para "Salario"
hist_salario_original <- ggplot(df, aes(x = Salario)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.4) +
  geom_density(color = "blue") +
  ggtitle(paste("Salário Original\nDesvio Padrão =", round(sd(df$Salario), 2)))

hist_salario_padronizado <- ggplot(df, aes(x = Salario_padronizado)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "red", alpha = 0.4) +
  geom_density(color = "red") +
  ggtitle(paste("Salário Padronizado\nDesvio Padrão =", round(sd(df$Salario_padronizado), 2)))

hist_salario_normalizado <- ggplot(df, aes(x = Salario_normalizado)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.4) +
  geom_density(color = "green") +
  ggtitle(paste("Salário Normalizado\nDesvio Padrão =", round(sd(df$Salario_normalizado), 2)))# Pacotes necessários
library(ggplot2)
library(gridExtra)

# Criando o dataframe original
df <- data.frame(
  Pais = c("França", "Espanha", "Alemanha", "Espanha", "Alemanha", "França", "Espanha", "França", "Alemanha", "França"),
  Idade = c(44, 27, 30, 38, 40, 35, 30, 48, 50, 37),
  Salario = c(72000, 48000, 54000, 61000, 63730, 58000, 52000, 79000, 83000, 67000),
  Compra_aprovada = c("Não", "Sim", "Não", "Não", NA, "Sim", "Não", "Sim", "Não", "Sim")
)

# Padronizando as colunas "Idade" e "Salario"
df$Idade_padronizada <- scale(df$Idade)
df$Salario_padronizado <- scale(df$Salario)

# Normalizando as colunas "Idade" e "Salario" usando a técnica de máximos e mínimos
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
df$Idade_normalizada <- normalize(df$Idade)
df$Salario_normalizado <- normalize(df$Salario)

# Criando histogramas para "Idade"
hist_idade_original <- ggplot(df, aes(x = Idade)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.4) +
  geom_density(color = "blue") +
  ggtitle(paste("Idade Original\nDesvio Padrão =", round(sd(df$Idade), 2)))

hist_idade_padronizada <- ggplot(df, aes(x = Idade_padronizada)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "red", alpha = 0.4) +
  geom_density(color = "red") +
  ggtitle(paste("Idade Padronizada\nDesvio Padrão =", round(sd(df$Idade_padronizada), 2)))

hist_idade_normalizada <- ggplot(df, aes(x = Idade_normalizada)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.4) +
  geom_density(color = "#034603") +
  ggtitle(paste("Idade Normalizada\nDesvio Padrão =", round(sd(df$Idade_normalizada), 2)))

# Criando histogramas para "Salario"
hist_salario_original <- ggplot(df, aes(x = Salario)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.4) +
  geom_density(color = "blue") +
  ggtitle(paste("Salário Original\nDesvio Padrão =", round(sd(df$Salario), 2)))+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

hist_salario_padronizado <- ggplot(df, aes(x = Salario_padronizado)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "red", alpha = 0.4) +
  geom_density(color = "red") +
  ggtitle(paste("Salário Padronizado\nDesvio Padrão =", round(sd(df$Salario_padronizado), 2)))
+# Pacotes necessários
library(ggplot2)
library(gridExtra)

# Criando o dataframe original
df <- data.frame(
  Pais = c("França", "Espanha", "Alemanha", "Espanha", "Alemanha", "França", "Espanha", "França", "Alemanha", "França"),
  Idade = c(44, 27, 30, 38, 40, 35, 30, 48, 50, 37),
  Salario = c(72000, 48000, 54000, 61000, 63730, 58000, 52000, 79000, 83000, 67000),
  Compra_aprovada = c("Não", "Sim", "Não", "Não", NA, "Sim", "Não", "Sim", "Não", "Sim")
)

# Padronizando as colunas "Idade" e "Salario"
df$Idade_padronizada <- scale(df$Idade)
df$Salario_padronizado <- scale(df$Salario)

# Normalizando as colunas "Idade" e "Salario" usando a técnica de máximos e mínimos
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
df$Idade_normalizada <- normalize(df$Idade)
df$Salario_normalizado <- normalize(df$Salario)

# Criando histogramas para "Idade"
hist_idade_original <- ggplot(df, aes(x = Idade)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.4) +
  geom_density(color = "blue") +
  ggtitle(paste("Idade Original\nDesvio Padrão =", round(sd(df$Idade), 2)))

hist_idade_padronizada <- ggplot(df, aes(x = Idade_padronizada)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "red", alpha = 0.4) +
  geom_density(color = "red") +
  ggtitle(paste("Idade Padronizada\nDesvio Padrão =", round(sd(df$Idade_padronizada), 2)))

hist_idade_normalizada <- ggplot(df, aes(x = Idade_normalizada)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.4) +
  geom_density(color = "#016501") +
  ggtitle(paste("Idade Normalizada\nDesvio Padrão =", round(sd(df$Idade_normalizada), 2)))

# Criando histogramas para "Salario"
hist_salario_original <- ggplot(df, aes(x = Salario)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.4) +
  geom_density(color = "blue") +
  ggtitle(paste("Salário Original\nDesvio Padrão =", round(sd(df$Salario), 2)))+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

hist_salario_padronizado <- ggplot(df, aes(x = Salario_padronizado)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "red", alpha = 0.4) +
  geom_density(color = "red") +
  ggtitle(paste("Salário Padronizado\nDesvio Padrão =", round(sd(df$Salario_padronizado), 2)))+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))
hist_salario_normalizado <- ggplot(df, aes(x = Salario_normalizado)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.4) +
  geom_density(color = "#034a03") +
  ggtitle(paste("Salário Normalizado\nDesvio Padrão =", round(sd(df$Salario_normalizado), 2)))+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Exibindo os histogramas para "Idade"
grid.arrange(hist_idade_original, hist_idade_padronizada, hist_idade_normalizada, ncol = 3)

# Exibindo os histogramas para "Salario"
grid.arrange(hist_salario_original, hist_salario_padronizado, hist_salario_normalizado, ncol = 3)

  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))
hist_salario_normalizado <- ggplot(df, aes(x = Salario_normalizado)) + 
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.4) +
  geom_density(color = "#034803") +
  ggtitle(paste("Salário Normalizado\nDesvio Padrão =", round(sd(df$Salario_normalizado), 2)))+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Exibindo os histogramas para "Idade"
grid.arrange(hist_idade_original, hist_idade_padronizada, hist_idade_normalizada, ncol = 3)

# Exibindo os histogramas para "Salario"
grid.arrange(hist_salario_original, hist_salario_padronizado, hist_salario_normalizado, ncol = 3)


# Exibindo os histogramas para "Idade"
grid.arrange(hist_idade_original, hist_idade_padronizada, hist_idade_normalizada, ncol = 3)

# Exibindo os histogramas para "Salario"
grid.arrange(hist_salario_original, hist_salario_padronizado, hist_salario_normalizado, ncol = 3)
