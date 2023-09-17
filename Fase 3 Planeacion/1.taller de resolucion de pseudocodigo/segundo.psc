Algoritmo segundoenunciado
	Escribir 'por favor ingrese la cantidad de kilos de manzana a comprar'
	Leer kilos
	precioneto <- kilos*4200
	descuento <- 0
	Si kilos<=2; Entonces
		descuento <- 0
		totaldescuento <- 0
	SiNo
		Si kilos>2 Y kilos<=5; Entonces
			descuento <- 10
			totaldescuento <- precioneto*descuento/100
		SiNo
			Si kilos>5 Entonces
				descuento <- 15
				totaldescuento <- precioneto*descuento/100
			FinSi
		FinSi
	FinSi
	total <- precioneto-totaldescuento
	Escribir 'La compra de ', kilos, ' kilos tiene un valor de ', precioneto, ' , pero tiene un descuento por valor de ', totaldescuento, ', por lo tanto, el valor a pagar es:', total
FinAlgoritmo
