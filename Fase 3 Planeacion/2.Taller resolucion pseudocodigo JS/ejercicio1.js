/*
Algoritmo primero
	Escribir "por favor ingrese la cantidad a consignar"
	Leer deposito
	meses=5*12
	valor_futuro=deposito*(1+0.08)^meses 
	Escribir "el valor final que le pertenece es:" valor_futuro
FinAlgoritmo
*/

var deposito=0, meses=0, valor_futuro=0;

deposito=parseInt(prompt("por favor ingrese la cantidad a consignar"));
meses=60;
valor_futuro=1.08**meses;
final=valor_futuro*deposito
document.write("el valor final que lepertenece es:" + parseFloat(final) + "vf" + valor_futuro )