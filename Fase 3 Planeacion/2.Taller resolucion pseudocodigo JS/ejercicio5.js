/*
QUINTO ENUNCIADO: desarrollar un algoritmo que permita calcular los siguientes
datos de una fiesta:
¿Cuántas personas asistieron a la fiesta?
¿Cuántos hombres y cuantas mujeres?
• Promedio de edades por sexo.
• La edad de la persona más joven que asistió.

Algoritmo quinto
	edad <- 1
	suma_edad_m <- 0
	suma_edad_F <- 0
	cantidad_M <- 0
	cantidad_F <- 0
	total_personas <- 0
	edad_menor <- 300
	Mientras edad<>0 Hacer
		Escribir 'ingrese nombre del participante'
		Leer nombre
		Escribir 'es hombre o mujer? escriba F para mujer M para hombre'
		Leer genero
		Escribir 'que edad tiene?'
		Leer edad
		Si edad<>0 Y edad>18 Entonces
			Si genero='m' Entonces
				suma_edad_m <- suma_edad_m+edad
				cantidad_M <- cantidad_M+1
			SiNo
				Si genero='f' Entonces
					suma_edad_F <- suma_edad_F+1
					cantidad_F <- cantidad_F+1
				FinSi
			FinSi
			Si edad<edad_menor Entonces
				edad_menor <- edad
				persona_menor <- nombre
			FinSi
			total_personas <- total_personas+1
		FinSi
	FinMientras
	Escribir 'la persona menor es', persona_menor, ' con ', edad_menor, ' años'
	promedio_f <- suma_edad_F/total_personas
	promedio_m <- suma_edad_m/total_personas
	Escribir 'el promedio de edades femeninas es:', promedio_f, 'la cantidad de mujeres fueron: ', cantidad_F
	Escribir 'el promedio de edades masculinas es:', promedio_m, 'la cantidad de hombres fueron: ', cantidad_M
FinAlgoritmo
*/

let edad,suma_edad_m,suma_edad_F,cantidad_M, cantidad_F, total_personas, edad_menor;
edad = 1;
suma_edad_m = 0;
suma_edad_F = 0;
cantidad_M = 0;
cantidad_F = 0;
total_personas = 0;
edad_menor = 300;

while(edad != 0){
	nombre=prompt("ingrese nombre del participante");
	genero=prompt("es hombre o mujer? escriba F para mujer M para hombre");
	edad=parseInt(prompt("Que edad tiene? ingrese 0 para terminar"));
	if (edad!=0 && edad>18){
		if(genero='m'){
			suma_edad_m=suma_edad_m+edad;
			cantidad_M=cantidad_M+1;
		}else if(genero='f'){
			suma_edad_F=suma_edad_F+edad;
			cantidad_F=cantidad_F+1;
		}
		if (edad<edad_menor){
			edad_menor=edad;
			persona_menor=nombre;
		}
		total_personas=total_personas+1;
	}

}
document.write('<br>la persona menor es '+ persona_menor+ ' con '+ edad_menor+ ' años')
promedio_f =suma_edad_F/total_personas
promedio_m =suma_edad_m/total_personas
document.write('<br>el promedio de edades femeninas es: '+promedio_f+' la cantidad de mujeres fueron: '+cantidad_F)
document.write('<br>el promedio de edades masculinas es: '+promedio_m+' la cantidad de hombres fueron: '+cantidad_M)


