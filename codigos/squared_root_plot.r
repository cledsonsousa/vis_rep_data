#Codigo com escala em raiz quadrada
# Dados das áreas das cidades
cidades <- c("NY", "PA", "ME", "MA", "VT", "NH", "NJ", "CT", "RI")
areas <- c(50000, 45000, 35000, 10000, 9000, 8000, 7000, 5000, 1000)

# Criar um dataframe
dados <- data.frame(Cidade = cidades, Area = areas)

# Calcular a raiz quadrada das áreas
sqrt_areas <- sqrt(dados$Area)

# Definir os rótulos do eixo y baseados em valores transformados
pretty_labels <- pretty(dados$Area)
sqrt_pretty_labels <- sqrt(pretty_labels)

# Criar o gráfico de barras com escala raiz quadrada no eixo y
barplot(sqrt_areas, names.arg = dados$Cidade, col = "blue", 
        main = "Áreas das Cidades em Milhas Quadradas (Escala Raiz Quadrada)", 
        xlab = "Cidades", ylab = "Área (raiz quadrada das milhas quadradas)", 
        las = 2, cex.names = 0.8)

# Adicionar marcas de eixo y em valores transformados de volta para a escala original
axis(2, at = sqrt_pretty_labels, labels = pretty_labels, las = 2)

