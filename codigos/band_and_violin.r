# Instalar e carregar a biblioteca ggplot2, se já não estiver carregada
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Configurar o gerador de números aleatórios
set.seed(657289)

# Criar o conjunto de dados
x <- 1:100
y <- rnorm(100) + x / 10
low <- y + rnorm(100, - 2, 0.1)
high <- y + rnorm(100, + 2, 0.1)
data <- data.frame(x, y, low, high)

# Criar o gráfico de dispersão com banda de confiança
ggp <- ggplot(data, aes(x, y)) +
  geom_point(color = "blue") +  # Definir cor dos pontos
  geom_ribbon(aes(ymin = low, ymax = high), fill = "blue", alpha = 0.2) +  # Cor da banda de confiança
  labs(title = "Exemplo de Gráfico de Dispersão com Banda de Confiança",
       x = "X", y = "Y") +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 12)
  )

# Exibir o gráfico
print(ggp)

 # Instalar e carregar o pacote vioplot
#install.packages("vioplot")
#library(vioplot)

# Definir os dados para o gráfico meio  violino
df <- data.frame(
  weight = c(rnorm(100, mean = 60, sd = 10), rnorm(100, mean = 65, sd = 12)),
  feed = factor(rep(c("Tipo A", "Tipo B"), each = 100))
)


# install.packages("vioplot")
)
# Carregar a biblioteca necessária
library("vioprand violino plot")
library(ggplot2)

# Definir os dados
set.seed(20160229)
my_data = data.frame(
    y = c(rnorm(1000), rnorm(1000, 0.5), rnorm(1000, 1), rnorm(1000, 1.5)),
    x = c(rep('a', 2000), rep('b', 2000)),
    m = c(rep('i', 1000), rep('j', 2000), rep('i', 1000))
)

# Criar o gráfico de meio-violino
library(vioplot)
x1 <- c(rnorm(1000), rnorm(1000, 0.5))
x2 <- c(rnorm(1000, 1), rnorm(1000, 1.5))

# Usar vioplot para criar meio-violino
vioplot(x1, x2, side = "right", col = "lightblue", names = c("Tipo A", "Tipo B"))
title(main = "Exemplo de Gráfico de Meio-Violino", ylab = "Peso")



# Violinos Completos
GeomSplitViolin <- ggproto("GeomSplitViolin", GeomViolin, 
                           draw_group = function(self, data, ..., draw_quantiles = NULL) {
  data <- transform(data, xminv = x - violinwidth * (x - xmin), xmaxv = x + violinwidth * (xmax - x))
  grp <- data[1, "group"]
  newdata <- plyr::arrange(transform(data, x = if (grp %% 2 == 1) xminv else xmaxv), if (grp %% 2 == 1) y else -y)
  newdata <- rbind(newdata[1, ], newdata, newdata[nrow(newdata), ], newdata[1, ])
  newdata[c(1, nrow(newdata) - 1, nrow(newdata)), "x"] <- round(newdata[1, "x"])

  if (length(draw_quantiles) > 0 & !scales::zero_range(range(data$y))) {
    stopifnot(all(draw_quantiles >= 0), all(draw_quantiles <=
      1))
    quantiles <- ggplot2:::create_quantile_segment_frame(data, draw_quantiles)
    aesthetics <- data[rep(1, nrow(quantiles)), setdiff(names(data), c("x", "y")), drop = FALSE]
    aesthetics$alpha <- rep(1, nrow(quantiles))
    both <- cbind(quantiles, aesthetics)
    quantile_grob <- GeomPath$draw_panel(both, ...)
    ggplot2:::ggname("geom_split_violin", grid::grobTree(GeomPolygon$draw_panel(newdata, ...), quantile_grob))
  }
  else {
    ggplot2:::ggname("geom_split_violin", GeomPolygon$draw_panel(newdata, ...))
  }
})

geom_split_violin <- function(mapping = NULL, data = NULL, stat = "ydensity", position = "identity", ..., 
                              draw_quantiles = NULL, trim = TRUE, scale = "area", na.rm = FALSE, 
                              show.legend = NA, inherit.aes = TRUE) {
  layer(data = data, mapping = mapping, stat = stat, geom = GeomSplitViolin, 
        position = position, show.legend = show.legend, inherit.aes = inherit.aes, 
        params = list(trim = trim, scale = scale, draw_quantiles = draw_quantiles, na.rm = na.rm, ...))
}
ggplot(my_data, aes(x, y, fill = m)) + geom_split_violin()+
labs(title = "Violinos Assimétricos",
       x = "Tipos", y = "Y") +
theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 12)
  )
