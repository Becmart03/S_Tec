<?php
// Verificar si los datos han sido enviados por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener las calificaciones de los parciales, examen final y trabajo final
    $nombre = $_POST['nombre'];
    $peso = $_POST['peso'];
    $estatura = $_POST['estatura'];


    // Calcular el promedio de los parciales
    $imc = ($peso / ($estatura * $estatura));

    if ($imc < 18.5) {
        $condicion = 'por debajo del peso';
    } elseif ($imc >= 18.5 and $imc < 24.9) {
        $condicion = 'saludable';
    } elseif ($imc >= 25.0 and $imc < 29.9) {
        $condicion = 'sobrepeso';
    } elseif ($imc >= 30.0 and $imc < 39.9) {
        $condicion = 'Obeso';
    } else {
        $condicion = 'Obesidad morbida';
    }



    // Mostrar la nota final
    echo  "<h1>" . $nombre . " tiene una condicion: " . $condicion . "</h1>";
} else {
    echo "No se enviaron datos.";
}
