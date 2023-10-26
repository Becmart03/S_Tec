
let triangulo=[];
let circulo=[];
let cuadrado=[];
let rectangulo=[];
//nombre, id , fn,corre, ciudadR
function capturarTriangulo(){
        let trianguloa=parseInt(document.getElementById("trianguloa").value);
        let triangulob=parseInt(document.getElementById("triangulob").value);
        let trianguloc=parseInt(document.getElementById("trianguloc").value);
        let trianguloh=parseInt(document.getElementById("trianguloh").value);
        let perimt="El perimetro es: "+(trianguloa+triangulob+trianguloc)
        let tria="el area es: "+((triangulob*trianguloh)/2)
        let p1=[trianguloa, triangulob, trianguloc, trianguloh, tria, perimt];
        triangulo.push(p1);
        console.log(triangulo);
}

function capturarCuadrado(){
        let cuadradoa=parseInt(document.getElementById("cuadradoa").value);
        let perimcua="El perimetro es: "+(cuadradoa*4)
        let areacua="el area es: "+ (cuadradoa*cuadradoa)
        let cua=[cuadradoa, areacua, perimcua];
        cuadrado.push(cua);
        console.log(cuadrado);
}
function capturarCirculo(){
        let circuloa=parseInt(document.getElementById("circuloa").value);
        let perimt="El perimetro es: "+(circuloa*3.14*2);
        let circa="el area es: "+(circuloa*circuloa*3.14);
        let p3=[circuloa, perimt, circa];
        circulo.push(p3);
        console.log(circulo);
}
function capturarRectangulo(){
    let rectanguloa=parseInt(document.getElementById("rectanguloa").value);
    let rectangulob=parseInt(document.getElementById("rectangulob").value);
    let perirecta="El perimetro es: "+((rectanguloa+rectangulob)*2);
    let arearecta="el area es: "+(rectanguloa*rectangulob);
    let recta=[rectanguloa,rectangulob,perirecta,arearecta];
    rectangulo.push(recta);
    console.log(rectangulo);
}