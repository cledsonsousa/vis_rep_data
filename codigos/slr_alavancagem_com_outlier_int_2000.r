# Instalar e carregar os pacotes necessários
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(broom)) install.packages("broom")
if (!require(dplyr)) install.packages("dplyr")

library(ggplot2)
library(broom)
library(dplyr)

# Ajustando o modelo de regressão linear
int00.lm <- lm(perf ~ clock, data = int00.dat)

# Extraindo os dados de alavancagem, resíduos padronizados e valores de Cook
model_data <- augment(int00.lm) %>%
  mutate(cooksd = cooks.distance(int00.lm),
         outlier = .std.resid > 2 | .std.resid < -2 | .hat > 3*mean(.hat))

# Criando o gráfico de alavancagem vs resíduos padronizados
ggplot(model_data, aes(x = .hat, y = .std.resid)) +
  geom_point(aes(color = outlier), size = 2) +
  geom_text(aes(label = ifelse(outlier, rownames(model_data), "")), 
            hjust = 1.5, vjust = 1.5) +
  geom_smooth(se = FALSE, method = "loess") +
  labs(title = "Gráfico de Alavancagem vs Resíduos Padronizados",
       x = "Alavancagem",
       y = "Resíduos Padronizados") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10)) +
  scale_color_manual(values = c("black", "red"))+
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10))
# Instalar e carregar os pacotes necessários
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(broom)) install.packages("broom")
if (!require(dplyr)) install.packages("dplyr")

library(ggplot2)
library(broom)
library(dplyr)

# Ajustando o modelo de regressão linear
int00.lm <- lm(perf ~ clock, data = int00.dat)

# Extraindo os dados de alavancagem, resíduos padronizados e valores de Cook
model_data <- augment(int00.lm) %>%
  mutate(cooksd = cooks.distance(int00.lm),
         outlier = .std.resid > 2 | .std.resid < -2 | .hat > 3*mean(.hat))

# Criando o gráfico de alavancagem vs resíduos padronizados
ggplot(model_data, aes(x = .hat, y = .std.resid)) +
  geom_point(aes(color = outlier), size = 2) +
  geom_text(aes(label = ifelse(outlier, rownames(model_data), "")), 
            hjust = 1.5, vjust = 1.5) +
  geom_smooth(se = FALSE, method = "loess") +
  labs(title = "Gráfico de Alavancagem vs Resíduos Padronizados",
       x = "Alavancagem",
       y = "Resíduos Padronizados",
       color = "Outlier") +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10)) +
  scale_color_manual(values = c("black", "red"),
                     labels = c("Falso", "Verdadeiro"))

