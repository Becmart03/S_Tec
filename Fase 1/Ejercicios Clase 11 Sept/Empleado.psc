Proceso Empleado
	
	//Crear un programa que pida el nombre del empleado teniendo en cuenta que gana $15000 por hora
	//averiguar las horas trabajadas durante los 20 días y decir cuánto fue su salario del mes.
	//Condicional: Si gana más de 2smlv recibe subsidio de transporte y alimentación
	//Dar el salario Final.
		
	Definir nombre Como Caracter;
	Definir vlrHora,hrTrab,salario,trans, alim, salfinal Como Entero;
	
	Escribir "Digite su nombre";
	Leer nombre;
	vlrHora=15000;
	Escribir "¿Cuántas horas trabajó en el día?";
	Leer hrTrab;
	salario=hrTrab*vlrHora*20;
	Escribir "Señor(a): ",nombre;
	Escribir "Su salario este mes es de $",salario;
	
FinProceso
