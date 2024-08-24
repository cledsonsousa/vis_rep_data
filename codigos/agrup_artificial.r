# Carregar pacotes necessários
library(data.table) # data handling
library(ggplot2) # visualisations
library(gridExtra) # visualisations
library(grid) # visualisations
library(cluster) # PAM - K-medoids

set.seed(54321)
# Aqui tres distribuição gaussianas e 3 outliers foram adicionados para evidenciar o agrupamento
data_example <- data.table(x = c(rnorm(10, 3.5, 0.1), rnorm(10, 2, 0.1),
                                 rnorm(10, 4.5, 0.1), c(5, 1.9, 3.95)),
                           y = c(rnorm(10, 3.5, 0.1), rnorm(10, 2, 0.1),
                                 rnorm(10, 4.5, 0.1), c(1.65, 2.9, 4.2)))

gg1 <- ggplot(data_example, aes(x, y)) +
  geom_point(alpha = 0.75, size = 8) +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

kmed_res <- pam(data_example, 3)$clustering

data_example[, class := as.factor(kmed_res)]

gg2 <- ggplot(data_example, aes(x, y, color = class, shape = class)) +
  geom_point(alpha = 0.75, size = 8) +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10))

# Definir a função define_region antes de usá-la
define_region <- function(row, col){
  viewport(layout.pos.row = row, layout.pos.col = col)
}

grid.newpage()
# Create layout : nrow = 2, ncol = 2
pushViewport(viewport(layout = grid.layout(1, 2)))
# Arrange the plots
print(gg1, vp = define_region(1, 1))
print(gg2, vp = define_region(1, 2))
