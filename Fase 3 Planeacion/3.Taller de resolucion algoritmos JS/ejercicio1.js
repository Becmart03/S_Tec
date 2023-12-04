let personas=[];

//nombre, id , fn,corre, ciudadR
function capturarData(){
    let suma=0
    let menor=200;
    let mayor=0;
    let promedio=0
    let adultomayor=0
    let menores=0
    let mayores=0
    if(personas.length<10){
        let nombre=document.getElementById("nombre").value;
        let edad=parseInt(document.getElementById("edad").value);
        let datos=[nombre,edad];
        personas.push(datos);
        console.log(personas);
}else {for (let i=0; i<10;i++){

    if (mayor<personas[i][1]){
        mayor=personas[i][1];
    }
    if(menor>personas[i][1]){
        menor=personas[i][1];
    }
    suma=suma+personas[i][1];
    if (personas[i][1]<18){
        menores=menores+1;
    } else if (personas[i][1]>=18 && personas[i][1]<60){
        mayores=mayores+1;
    }
    else{
        adultomayor=adultomayor+1;
    }
    }
    promedio=suma/personas.length
    alert(" la cantidad de menores es: " + menores + " la cantidad de mayores es: " +mayores + " la cantidad de adultos mayores es: " + adultomayor );
    alert("la edad menor es: " + menor);
    alert(" la edad mayor es: "+ mayor);
    alert(" el promedio de edades es: "+promedio);
}


}
