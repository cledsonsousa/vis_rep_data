#library(ggplot2)
set.seed(657289)                    # Create data frame in R
x <- 1:100
y <- rnorm(100) + x / 10
low <- y + rnorm(100, - 2, 0.1)
high <- y + rnorm(100, + 2, 0.1)
data <- data.frame(x, y, low, high)
head(data)                          # First six rows of example data
install.packages("ggplot2")         # Install & load ggplot2 package
library("ggplot2")
ggp <- ggplot(data, aes(x, y)) +    # ggplot2 plot without confidence band
  geom_point()
ggp +                               # Add confidence intervals
  geom_ribbon(aes(ymin = low, ymax = high), alpha = 0.2)+
  labs(title = "Exemplo de Gráfico de Dispersão com Banda de Confiança", x = "x", y = "y") +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 14)
  )
 # Instalar e carregar o pacote vioplot
#install.packages("vioplot")
#library(vioplot)

# Definir os dados para o gráfico de violino
df <- data.frame(
  weight = c(rnorm(100, mean = 60, sd = 10), rnorm(100, mean = 65, sd = 12)),
  feed = factor(rep(c("Tipo A", "Tipo B"), each = 100))
)

`
# install.packages("vioplot")
library("vioplot")

vioplot(weight ~ feed, data = df,
        col = c("#bef7ff", "#a6e2ff", "#8eccff",
                "#75b7ff", "#5da1ff", "#458cff"))
title(main = "Exemplo de Gráfico Violino Completo", xlab = "Tipo de Alimentação", ylab = "Peso")

# Criar o gráfico de meio-violino
vioplot(df$weight ~ df$feed, side = "right", col = "lightblue", names = c("Tipo A", "Tipo B"))
title(main = "Exemplo de Gráfico de Meio-Violino", xlab = "Tipo de Alimentação", ylab = "Peso")