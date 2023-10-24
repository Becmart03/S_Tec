/*
TERCER ENUNCIADO: desarrollar un algoritmo que calcule el salario neto que debe recibir un vendedor de un almacén. Se debe tener en cuenta si tiene derecho o no al auxilio de transporte. Para el desarrollo del ejercicio tenga en cuenta las siguientes formulas:
Sueldo devengado = salario básico * días laborados / 30.
Días laborados = debe ser entre 1 y 30.
Auxilio de Transporte: Lo reciben los empleados cuyo salario básico sea menor o igual a 2 salarios mínimos legales vigentes.
Salario Mínimo Legal Vigente (2017): 737.717
Auxilio de Transporte = 83.140 * días laborados / 30 (año 2017 en Colombia).
Comisión de Ventas: En la empresa se tiene estipulado dar una comisión de ventas del 2% sobre las ventas del mes de cada vendedor.
Total, devengado = sueldo devengado + comisión de ventas.
Total, deducciones = descuentos por préstamos.
Salario Neto = Total devengado – Total deducciones
Como resultado del ejercicio se debe imprimir en pantalla lo siguiente:
Cedula empleado: XXXXXX
Nombre Empleado: XXXXXXX
Salario Básico: XXXXXX
Auxilio de Transporte: XXXXXX
Comisión de Ventas: XXXXXX
Préstamos: XXXXXX
Salario Neto Por Recibir: XXXXX

Algoritmo tercero
	Escribir 'escriba su nombre'
	Leer nombre
	Escribir 'escriba su cedula'
	Leer cedula
	Escribir 'por favor ingrese su sueldo'
	Leer salario_propio
	Escribir 'por favor ingrese los dias laborados'
	Leer dia_lab
	Si dia_lab>30 O dia_lab<1; Entonces
		Escribir 'error, escriba correctamente los dias laborados'
	FinSi
	Mientras dia_lab>30 O dia_lab<1 Hacer
		Escribir 'error, escriba correctamente los dias laborados'
		Leer dia_lab
	FinMientras
	Escribir 'por favor ingrese el valor total de sus ventas'
	Leer ventas_mensuales
	Escribir 'ha realizado prestamos? escriba el total, sino solo escriba 0'
	Leer prestamos
	salario_minimo <- 737717
	Si salario_propio<salario_minimo*2 Entonces
		auxilio_transporte <- 83140*dia_lab/30
	SiNo
		auxilio_transporte <- 0
	FinSi
	sueldo_devengado <- salario_propio*dia_lab/30
	comision <- 0.02*ventas_mensuales
	total_salario <- comision+auxilio_transporte+sueldo_devengado-prestamos
	Escribir 'Cedula del empleado: ', cedula
	Escribir 'Nombre empleado: ', nombre
	Escribir 'Salario basico: ', salario_propio
	Escribir 'Auxilio de tansporte: ', auxilio_transporte
	Escribir 'Comision de ventas: ', comision
	Escribir 'Prestamos: ', prestamos
	Escribir 'Salario neto por recibir: ', total_salario
FinAlgoritmo
*/
let nombre, cedula, salario_propio, dia_lab, ventas_mensuales, salario_minimo, auxilio_transporte;

nombre=(prompt("por favor ingrese su nombre"));
cedula=parseInt(prompt("por favor ingrese su cedula"));
salario_propio=parseInt(prompt("por favor ingrese su salario"));
dia_lab=(prompt("por favor ingrese los dias laborados"));
while (dia_lab>30 || dia_lab<1){
	dia_lab=parseInt(prompt("por favor escriba correctamente los dias laborados"))
}
ventas_mensuales=prompt("Por favor ingrese el total de sus ventas")
prestamos=prompt('ha realizado prestamos? escriba el total, sino solo escriba 0')
salario_minimo=737717
if (salario_propio<salario_minimo*2){
auxilio_transporte=83140*dia_lab/30
}	 else{
	auxilio_transporte=0
}
	sueldo_devengado=salario_propio*dia_lab/30
	comision=0.2*ventas_mensuales
	total_salario=comision+auxilio_transporte+sueldo_devengado-prestamos
	document.write('Cedula del empleado: ', +cedula +'<br> Nombre empleado: ' +nombre +'<br> Salario basico: ', +parseFloat(salario_propio) +'<br> Auxilio de tansporte: ', +parseFloat(auxilio_transporte) +'<br> Comision de ventas: ', +parseFloat(comision) +'<br> Prestamos: ', +parseFloat(prestamos) +'<br> Salario neto por recibir: '+ parseFloat(total_salario))
