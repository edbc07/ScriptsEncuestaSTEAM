#Script de Limpieza de datos
suppressMessages(library(dplyr))  # Cargar dplyr sin mostrar advertencias

DatosLimpios <- dataset %>% 
  filter(!is.na(`Edad`) & !is.na(`Género`) & !is.na(`Institución educativa`) & !is.na(`Área de residencia`))  # Filtra filas con NA en "Edad:" o "Género:"

# Paso 2: Reemplazar los NA en el resto de las columnas por "Sin especificar"
DatosLimpios <- DatosLimpios %>% 
  mutate_all(~ifelse(is.na(.) | . == "", "Sin especificar", .))


DatosLimpios$`Edad` <- ifelse(DatosLimpios$`Edad` %in% c("15","16", "17", "18","Sin especificar"), 
                                           DatosLimpios$`Edad`, 
                                           "Otro")

DatosLimpios$`Institución educativa` <- ifelse(DatosLimpios$`Institución educativa` %in% c("Pública", "Privada", "Sin especificar"), 
                                           DatosLimpios$`Institución educativa`, 
                                           "Pública")

DatosLimpios$`¿Qué idiomas hablas? (Selecciona todos los que apliquen)` <- ifelse(DatosLimpios$`¿Qué idiomas hablas? (Selecciona todos los que apliquen)` %in% c("Español", "Inglés", "Sin especificar"), 
                                 DatosLimpios$`¿Qué idiomas hablas? (Selecciona todos los que apliquen)`, 
                                 "Otro")

DatosLimpios$`¿Cuál de las siguientes carreras te parece más atractiva?` <- ifelse(DatosLimpios$`¿Cuál de las siguientes carreras te parece más atractiva?` %in% c("Investigador/a científico/a", 
                                                              "Desarrollador/a de software", 
                                                              "Ingeniero/a civil", 
                                                              "Artista digital", 
                                                              "Matemático/a o estadístico/a",  "Sin especificar"), 
                                 DatosLimpios$`¿Cuál de las siguientes carreras te parece más atractiva?`, 
                                 "Otro")

DatosLimpios$`¿Qué obstáculos sientes que podrías enfrentar al seguir una de estas carreras (Ciencia, tecnología, ingeniería, Arte y Matemáticas)? (Selecciona todas las que apliquen)` <- ifelse(DatosLimpios$`¿Qué obstáculos sientes que podrías enfrentar al seguir una de estas carreras (Ciencia, tecnología, ingeniería, Arte y Matemáticas)? (Selecciona todas las que apliquen)` %in% c("Falta de recursos educativos", 
                                                                 "Falta de apoyo familiar", 
                                                                 "Dificultad en las materias", 
                                                                 "Falta de motivación",  "Sin especificar"), 
                                    DatosLimpios$`¿Qué obstáculos sientes que podrías enfrentar al seguir una de estas carreras (Ciencia, tecnología, ingeniería, Arte y Matemáticas)? (Selecciona todas las que apliquen)`, 
                                    "Otro")

DatosLimpios$ID <- seq_along(DatosLimpios$ID)