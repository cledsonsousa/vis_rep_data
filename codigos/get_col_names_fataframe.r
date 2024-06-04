library(knitr)
library(kableExtra)
# Obtendo os nomes das colunas
col_names <- colnames(int00.dat)

# Dividindo os nomes das colunas em duas colunas
col_names_matrix <- matrix(col_names, ncol = 2, byrow = TRUE)
col_names_df <- as.data.frame(col_names_matrix, stringsAsFactors = FALSE)
colnames(col_names_df) <- c("Coluna 1", "Coluna 2")

# Criando um relatório com kable e kableExtra
col_names_df %>%
  kbl(caption = "Nomes das Colunas do Data Frame") %>%
  kable_styling(full_width = FALSE, position = "left") %>%
  row_spec(0, bold = TRUE, color = "white", background = "#D7261E") %>%
  column_spec(1, bold = TRUE, border_left = TRUE, border_right = TRUE, width = "20em") %>%
  column_spec(2, bold = TRUE, border_left = TRUE, border_right = TRUE, width = "20em") %>%
  kable_classic(html_font = "Cambria")