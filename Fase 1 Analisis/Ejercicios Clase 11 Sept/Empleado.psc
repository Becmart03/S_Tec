Proceso Empleado
	
	//Crear un programa que pida el nombre del empleado teniendo en cuenta que gana $15000 por hora
	//averiguar las horas trabajadas durante los 20 d�as y decir cu�nto fue su salario del mes.
	//Condicional: Si gana m�s de 2smlv recibe subsidio de transporte y alimentaci�n
	//Dar el salario Final.
		
	Definir nombre Como Caracter;
	Definir vlrHora,hrTrab,salario,trans, alim, salfinal Como Entero;
	
	Escribir "Digite su nombre";
	Leer nombre;
	vlrHora=15000;
	Escribir "�Cu�ntas horas trabaj� en el d�a?";
	Leer hrTrab;
	salario=hrTrab*vlrHora*20;
	Escribir "Se�or(a): ",nombre;
	Escribir "Su salario este mes es de $",salario;
	
FinProceso
