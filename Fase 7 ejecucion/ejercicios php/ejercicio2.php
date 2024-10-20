<?php
// Verificar si los datos han sido enviados por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener las calificaciones de los parciales, examen final y trabajo final
    $nombre = $_POST['nombre'];
    $automoviles = $_POST['automoviles'];
    $precio = $_POST['precio'];


    // Calcular el promedio de los parciales
    $total = (737000 + $automoviles * 50000 + $precio * 0.5);


    // Mostrar la nota final
    echo  "<h1>" . $nombre . " tiene una comision de : " . number_format($total, 2) . "</h1>";
} else {
    echo "No se enviaron datos.";
}
