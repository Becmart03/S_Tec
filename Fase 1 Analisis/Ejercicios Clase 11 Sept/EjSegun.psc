Proceso EjSegun
	Definir n1,n2,suma,resta,multi,divi,opc Como Real;
	//Definir opc Como Entero;
	
	Escribir "Digite un n�mero";
	Leer n1;
	Escribir "Digite otro n�mero";
	Leer n2;
	
	Escribir "Escoja qu� operaci�n desea:";
	Escribir "1. Sumar";
	Escribir "2. Restar";
	Escribir "3. Multiplicar";
	Escribir "4. Dividir";
	Leer opc;
	
	Segun opc Hacer
		1:
			suma=n1+n2:
			Escribir "La suma es: ",suma;
		2:
			resta=n1-n2:
			Escribir "La resta es: ",resta;
		3:
			multi=n1*n2:
			Escribir "La multiplicaci�n es: ",multi;
				
		4: 	divi=n1/n2:
			Escribir "La divisi�n es: ",divi;
		De Otro Modo:
			Escribir "La opci�n escogida no existe, intente de nuevo";
	Fin Segun
	
	
FinProceso
