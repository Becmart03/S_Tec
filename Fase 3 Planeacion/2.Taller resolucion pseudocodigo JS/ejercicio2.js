/*
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
*/ 

let kilos, precioneto, descuento, totaldescuentos,total;
kilos=parseInt(prompt("por favor ingrese la cantidad de kilos de manzana a comprar"));
precioneto=kilos*4200;
descuento=0;

if(kilos<=2){
	descuento=0;
	totaldescuentos=0;
} else if(kilos>2 && kilos<=5){
	descuento=15;
	totaldescuentos=precioneto*descuento/100;
} else if(kilos>5){
	totaldescuentos=precioneto*descuento/100;
}
total=precioneto-totaldescuentos
document.write("La compra de" +kilos +"kilos tiene un valor de, " +precioneto +", pero tiene un descuento por valor de, "+parseFloat(totaldescuentos) +",por lo tanto, el valor a pagar es:" + total );