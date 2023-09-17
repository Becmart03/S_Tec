Algoritmo calculo_de_areas
	Escribir 'que operacion quiere hacer? presione 1 para areas, 2 para volumenes'
	Leer op1
	Según op1 Hacer
		1:
			Escribir 'que tipo de area quiere calcular? 1 trinagulos, 2 cuadrados, 3 rectangulos, 4 circulos'
			Leer op2
			Según op2 Hacer
				1:
					Escribir 'ingrese la base del triangulo'
					Leer base
					Escribir 'ingrese la altura del triangulo'
					Leer altura
					areat <- base*altura/2
					Escribir 'el area del triangulo es:', areat
				2:
					Escribir 'ingrese la base del cuadrado'
					Leer base
					areac <- base*base
					Escribir 'el area del cuadrado es:', areac
				3:
					Escribir 'ingrese la base del rectangulo'
					Leer base
					Escribir 'ingrese la altura del rectangulo'
					Leer altura
					arear <- base*altura
					Escribir 'el area del rectangulo es:', arear
				4:
					Escribir 'ingrese el radio del circulo'
					Leer radio
					areacir <- 3.14*radio*radio
					Escribir 'el area del circulo es:', areacir
				De Otro Modo:
					Escribir 'opcion incorrecta, saliendo del programa'
			FinSegún
		2:
			Escribir 'a que figura desea calcularle el volumen? 1 esfera 2 cubo 3 cilindro 4 piramide'
			Leer op3
			Según op3 Hacer
				1:
					Escribir 'ingrese el radio de la esfera'
					Leer radioesfera
					areaesfera <- (radioesfera*radioesfera*radioesfera)*3.14*(4/3)
					Escribir 'el volumen de la esfera es:', areaesfera
				2:
					Escribir 'por favor ingrese el tamaño de la base'
					Leer basecubo
					areacubo <- basecubo*basecubo*basecubo
					Escribir 'el volumen del cubo es:', basecubo
				3:
					Escribir 'por favor ingrese el radio del cilindro'
					Leer radiocil
					Escribir 'por favor ingrese la altura del cilindro'
					Leer alturacil
					areacil <- (radiocil*radiocil)*3.14*alturacil
					Escribir 'el volumen del cilindro es:', areacil
				4:
					Escribir 'por favor ingrese el tamaño de la base de la piramide'
					Leer basepir
					Escribir 'por favor ingrese el tamaño de la altura de la piramide'
					Leer alturapir
					areapir <- (basepir*basepir)*alturapir*(1/3)
					Escribir 'el volumen de la piramide cuadrangular es:', areapir
				De Otro Modo:
					Escribir 'opcion incorrecta'
			FinSegún
	FinSegún
FinAlgoritmo
