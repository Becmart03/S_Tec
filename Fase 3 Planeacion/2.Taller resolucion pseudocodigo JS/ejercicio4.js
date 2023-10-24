/*

CUARTO ENUNCIADO: hacer un algoritmo que imprima los primeros 20 términos de la siguiente serie:
1, 3, 6, 10, 15, 21, 28, [...]

Algoritmo cuarto
	num <- 1
	x <- 1
	Mientras x<21 Hacer
		num2 <- num2+num
		num <- num+1
		Escribir num2
		x <- x+1
	FinMientras
FinAlgoritmo

*/

let num, x, num2;
num=1
x=1
num2=0
while(x<21){
	num2=num2+num;
	num=num+1;
	document.write("<br>"+num2)
	x=x+1
}