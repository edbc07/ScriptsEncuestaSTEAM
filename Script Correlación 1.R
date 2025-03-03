#FILTRO CORRELACIÓN GÉNERO - SECTOR DE INTERÉS
suppressMessages(library(dplyr))  # Cargar dplyr sin mostrar advertencias

# Crear una nueva tabla copiando los datos originales
DatosCorrelacionLimpios <- dataset %>%
  select(`Género`, `¿Qué sectores te interesan más para trabajar en el futuro?`) %>% 
  rename(
    `Correlacion 1: Genero` = `Género`,
    `Correlacion 1: Sectores de Interes` = `¿Qué sectores te interesan más para trabajar en el futuro?`
  ) 

# Filtrar los datos eliminando los valores no deseados
DatosCorrelacionLimpios <- DatosCorrelacionLimpios %>%
  filter(`Correlacion 1: Genero` %in% c("Masculino", "Femenino"),
         `Correlacion 1: Sectores de Interes` != "Sin especificar")