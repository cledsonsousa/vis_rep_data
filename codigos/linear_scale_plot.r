# gráfico de barras no R  com cidades s suas áreas em milhas quadradas com eixo y em escala linear.

# Dados das áreas das cidades
cidades <- c("NY", "PA", "ME", "MA", "VT", "NH", "NJ", "CT", "RI")
areas <- c(50000, 45000, 35000, 10000, 9000, 8000, 7000, 5000, 1000)

# Criar um dataframe
dados <- data.frame(Cidade = cidades, Area = areas)

# Criar o gráfico de barras
barplot(dados$Area, names.arg = dados$Cidade, col = "blue", 
        main = "Áreas das Cidades em Milhas Quadradas", 
        xlab = "Cidades", ylab = "Área (milhas quadradas)", 
        las = 2, cex.names = 0.8)

# Adicionar escala linear ao eixo y
axis(2, at = pretty(dados$Area), las = 2)
