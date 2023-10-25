/*
Una emisora con presencia en diferentes ciudades desea conocer el rating de canciones y cantantes más
escuchados (sonados) en este semestre del año. Por lo tanto, se ha pedido a estudiantes del SENA del
programa de tecnólogo en análisis y desarrollo de software desarrollar una solución que permita conocer la
respuesta de 6 personas con relación a sus gustos musicales. Con fines administrativos y realizar una rifa
entre las personas encuestadas, la emisora desea poder registrar de las personas entrevistadas su nombre,
número de identificación (cédula), fecha de nacimiento, correo electrónico, ciudad de residencia, ciudad de
origen. Además, se deberá poder almacenar el artista y título de hasta 3 canciones favoritas encada una de
las personas que se ingrese, teniendo en cuenta lo anterior, se sugiere que la solución deberá mostrar un
menú que permite las siguientes opciones:
a. Agregar una persona con los datos que se listan anteriormente.
b. Mostrar la información personal de una persona particular por medio de su posición en el vector.
*/

let personas=[];
//nombre, id , fn,corre, ciudadR
let stop=6;

function capturarData(){
    if(personas.length<6){
        let nombre=document.getElementById("nombre").value;
        let id=document.getElementById("id").value;
        let fn=document.getElementById("fn").value;
        let correo=document.getElementById("correo").value;
        let CiudadR=document.getElementById("CiudadR").value;

        let Artista=document.getElementById("Artista") .value;
        let c1=document.getElementById("c1") .value;
        let c2=document.getElementById("c2") .value;
        let c3=document.getElementById("c3") .value;

        
        let art=[Artista,[c1,c2,c3]];
        let p1=[nombre,id,fn,correo,CiudadR,art];
        personas.push(p1);
        console.log(personas);
}else {
    console.log("no se puede mas")
}
}