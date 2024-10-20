<?php
// Verificar si los datos han sido enviados por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener las calificaciones de los parciales, examen final y trabajo final
    $parcial1 = $_POST['parcial1'];
    $parcial2 = $_POST['parcial2'];
    $parcial3 = $_POST['parcial3'];
    $examen_final = $_POST['examen_final'];
    $trabajo_final = $_POST['trabajo_final'];

    // Calcular el promedio de los parciales
    $promedio_parciales = ($parcial1 + $parcial2 + $parcial3) / 3;

    // Calcular la nota final con los respectivos pesos
    $nota_final = ($promedio_parciales * 0.35) + ($examen_final * 0.35) + ($trabajo_final * 0.30);

    // Mostrar la nota final
    echo "<h1>La nota final es: " . number_format($nota_final, 2) . "</h1>";
} else {
    echo "No se enviaron datos.";
}
