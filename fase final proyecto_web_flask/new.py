valores = [{0: "T"}, 
           {1: "A"}, 
           {2: "M"}, 
           {3: "H"}, 
           {4: "E"}, 
           {5: "G"}, 
           {6: "R"}, 
           {7: "I"}, 
           {8: "M"}, 
           {9: "S"}]

# Definición de la palabra a modificar
palabra = "v96zAkfYplU"

# Convertir la palabra en una lista para facilitar la modificación
lista_palabra = list(palabra)

# Iterar sobre el rango de la longitud de la palabra
for i in range(len(lista_palabra)):
    letra_actual = lista_palabra[i]
    # Iterar sobre cada diccionario en valores
    for diccionario in valores:
        # Verificar si la letra actual está en las claves del diccionario
        for clave, valor in diccionario.items():
            if letra_actual == str(clave):  # Comparar como string para las claves
                # Reemplazar la letra con el valor correspondiente
                lista_palabra[i] = valor

# Convertir la lista de vuelta a una cadena
palabra_modificada = ''.join(lista_palabra)

# Imprimir el resultado
print("Palabra modificada:", palabra_modificada)