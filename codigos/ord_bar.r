# Carregar o pacote ggplot2
library(ggplot2)
library(gridExtra)


# Criar os dados
data_unordered<- data.frame(
  Tipo = c("Ditadura Real", "Democracia Presidencial", "Democracia Parlamentar", 
           "Democracia Mista", "Ditadura Militar", "Ditadura Civil"),
  Valores = c(2.5, 3.5, 6.0, 5.0, 4.0, 3.0)
)
data_ordered<- data.frame(
  Tipo = c("Ditadura Real", "Ditadura Civil", "Ditadura Militar", "Democracia Presidencial",  "Democracia Mista", "Democracia Parlamentar"   ),
  Valores = c(2.5, 3.0, 3.5, 4.0, 5.0, 6.0)
)



# Gráfico não ordenado
p1 <- ggplot(data_unordered, aes(x = Valores, y = Tipo)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Não Ordenado", x = "Valores", y = "") +
  theme_minimal()

# Gráfico ordenado
p2 <- ggplot(data_ordered, aes(x = reorder(Tipo, -Valores), y = Valores)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Ordenado", x = "Tipos", y = "Valores")+
  theme_minimal()


# Mostrar os gráficos lado a lado
grid.arrange(p1, p2, ncol = 2)
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10)) +
  scale_color_manual(values = c("black", "red"),
                     labels = c("Falso", "Verdadeiro"))

