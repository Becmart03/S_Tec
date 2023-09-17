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
