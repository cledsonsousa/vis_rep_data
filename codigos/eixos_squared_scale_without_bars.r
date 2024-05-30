#Gráfico apenas com os eixos, sem as barras.
# Dados das áreas das cidades
cidades <- c("NY", "PA", "ME", "MA", "VT", "NH", "NJ", "CT", "RI")
areas <- c(50000, 45000, 35000, 10000, 9000, 8000, 7000, 5000, 1000)

# Criar um dataframe
dados <- data.frame(Cidade = cidades, Area = areas)

# Calcular a raiz quadrada das áreas
sqrt_areas <- sqrt(dados$Area)

# Definir os rótulos do eixo y baseados nos valores originais e remover valores indesejados
pretty_labels <- pretty(dados$Area)
filtered_pretty_labels <- pretty_labels[!pretty_labels %in% c(100, 150, 200, 250)]
sqrt_filtered_pretty_labels <- sqrt(filtered_pretty_labels)

# Configurar a janela gráfica
plot(1, type = "n", xlab = "Cidades", ylab = "", 
     xlim = c(1, length(cidades)), ylim = c(0, max(sqrt_areas) * 1.2), 
     xaxt = "n", yaxt = "n")

# Adicionar eixos com escala raiz quadrada
axis(1, at = 1:length(cidades), labels = cidades, las = 2)
axis(2, at = sqrt_filtered_pretty_labels, labels = filtered_pretty_labels, las = 2)

# Adicionar grid para melhorar a visualização
abline(h = sqrt_filtered_pretty_labels, col = "lightgray", lty = "dotted")
abline(v = 1:length(cidades), col = "lightgray", lty = "dotted")
