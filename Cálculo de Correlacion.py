import scipy.stats as stats
import numpy as np
import math
# Autor Edison Barragán
# Ingreso de datos
filas = int(input("¿Cuántas categorías tiene la primera variable? "))
columnas = int(input("¿Cuántas categorías tiene la segunda variable? "))

# Nombres de las categorías
nombres_filas = [input(f"Nombre de la categoría {i+1} (fila): ") for i in range(filas)]
nombres_columnas = [input(f"Nombre de la categoría {j+1} (columna): ") for j in range(columnas)]

# Ingreso de la tabla de contingencia
print("\nIngresa las frecuencias observadas para cada combinación:")
tabla = []
for i in range(filas):
    fila = []
    for j in range(columnas):
        valor = int(input(f"Frecuencia para {nombres_filas[i]} - {nombres_columnas[j]}: "))
        fila.append(valor)
    tabla.append(fila)

tabla = np.array(tabla)

# Prueba de Chi-cuadrado utilizando las librerias
chi2, p, dof, expected = stats.chi2_contingency(tabla)

# Muestra los Resultados
print("\nResultados de la prueba de Chi-cuadrado:")
print(f"Chi-cuadrado: {chi2:.4f}")
print(f"P-valor: {p:.8f}")
print(f"Grados de libertad: {dof}")
print("Frecuencias esperadas:")
print(expected)

if p < 0.05:
    print("Existe una relación significativa entre las variables.")
else:
    print("No se encontró una relación significativa entre las variables.")

# Cálculo del V de Cramer
N = np.sum(tabla)
min_dim = min(tabla.shape) - 1
V_cramer = math.sqrt(chi2 / (N * min_dim)) if min_dim > 0 else 0

print(f"V de Cramer: {V_cramer:.4f}")