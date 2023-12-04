function leerVector(ordenado = true) {
    const vector = [];
    for (let i = 0; i < 5; i++) {
      let numero;
      while (true) {
        numero = parseInt(prompt(`Ingrese un número ${ordenado ? 'ascendente' : ''}:`));
        if (!isNaN(numero)) {
          if (ordenado && vector.length > 0 && numero < vector[vector.length - 1]) {
            alert("El número ingresado no es mayor que el último número del vector.");
          } else {
            vector.push(numero);
            break;
          }
        } else {
          alert("Ingrese un número entero válido.");
        }
      }
    }
    return vector;
  }
 function mezclarVectores(vector1, vector2) {
    const vectorMezclado = [];
    let i = 0, j = 0;
  
    while (i < vector1.length && j < vector2.length) {
      if (vector1[i] < vector2[j]) {
        vectorMezclado.push(vector1[i]);
        i++;
      } else if (vector1[i] > vector2[j]) {
        vectorMezclado.push(vector2[j]);
        j++;
      } else {
        vectorMezclado.push(vector1[i]);
        i++;
        j++;
      }
    }
  
    while (i < vector1.length) {
      vectorMezclado.push(vector1[i]);
      i++;
    }
  
    while (j < vector2.length) {
      vectorMezclado.push(vector2[j]);
      j++;
    }
  
    return vectorMezclado;
  }
  
  alert("Ingrese el primer vector ascendente:");
const vector1 = leerVector(true);

alert("Ingrese el segundo vector ascendente:");
const vector2 = leerVector(true);

const vectorMezclado = mezclarVectores(vector1, vector2);

alert("Vector mezclado:");
alert(vectorMezclado.join(" "));