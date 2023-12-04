
//nombre, id , fn,corre, ciudadR
function capturarTriangulo(){
        let trianguloa=parseInt(document.getElementById("trianguloa").value);
        let triangulob=parseInt(document.getElementById("triangulob").value);
        let trianguloc=parseInt(document.getElementById("trianguloc").value);
        let trianguloh=parseInt(document.getElementById("trianguloh").value);
        let perimt="El perimetro del triangulo es: "+(trianguloa+triangulob+trianguloc)
        let tria="el area es: "+((triangulob*trianguloh)/2)
        let triangulo=[trianguloa, triangulob, trianguloc, trianguloh, tria, perimt];
        alert(triangulo[4]+" "+triangulo[5])
       
}

function capturarCuadrado(){
        let cuadradoa=parseInt(document.getElementById("cuadradoa").value);
        let perimcua="El perimetro del cuadrado es: "+(cuadradoa*4)
        let areacua="el area es: "+ (cuadradoa*cuadradoa)
        let cuadrado=[cuadradoa, perimcua,areacua];
        alert(cuadrado[1]+" "+cuadrado[2])
        
        
}
function capturarCirculo(){
        let circuloa=parseInt(document.getElementById("circuloa").value);
        let perimt="El perimetro del circulo es: "+(circuloa*3.14*2);
        let circa="el area es: "+(circuloa*circuloa*3.14);
        let circulo=[circuloa, perimt, circa];
        alert(circulo[1]+" "+circulo[2])
      
}
function capturarRectangulo(){
    let rectanguloa=parseInt(document.getElementById("rectanguloa").value);
    let rectangulob=parseInt(document.getElementById("rectangulob").value);
    let perirecta="El perimetro del rectangulo es: "+((rectanguloa+rectangulob)*2);
    let arearecta="y su area es: "+(rectanguloa*rectangulob);
    let rectangulo=[rectanguloa,rectangulob,perirecta,arearecta];
    alert(rectangulo[2] +" "+ rectangulo[3]);
}




