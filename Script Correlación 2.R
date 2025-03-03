#FILTRO CORRELACIÓN EDAD - PROBABILIDAD STEAM
suppressMessages(library(dplyr))  # Cargar dplyr sin mostrar advertencias

# Crear una nueva tabla copiando los datos originales
DatosCorrelacionLimpios <- dataset %>%
  select(`Edad`, `¿Cuál es la probabilidad de que selecciones una carrera relacionada con Ciencia, Tecnología, Ingeniería, Arte o Matemáticas (STEAM)? (Escala de Likert: 1 = Nada, 5 = Mucho)`) %>% 
  rename(
    `Edad` = `Edad`,
    `Probabilidad STEAM` = `¿Cuál es la probabilidad de que selecciones una carrera relacionada con Ciencia, Tecnología, Ingeniería, Arte o Matemáticas (STEAM)? (Escala de Likert: 1 = Nada, 5 = Mucho)`
  ) 

# Filtrar los datos eliminando los valores no deseados
DatosCorrelacionLimpios <- DatosCorrelacionLimpios %>%
  filter(`Edad` != "Sin especificar" & `Probabilidad STEAM` != "Sin especificar")  