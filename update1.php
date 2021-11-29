<?php
session_start();
include_once 'conexion.php';

$cod_paralelo = $_POST['cod_paralelo'];
$cod_materia = $_POST['cod_materia'];
$cod_notas = $_POST['cod_notas'];
$practicas_1t = $_POST['practicas_1t'];
$proyectos_1t = $_POST['proyectos_1t'];
$examen_1t = $_POST['examen_1t'];

$nota_1t = ($practicas_1t + $proyectos_1t + $examen_1t) / 3;
$nota_final = $nota_1t / 3;

$pdo->query("UPDATE notas SET practicas_1t = $practicas_1t, proyectos_1t = $proyectos_1t, examen_1t = $examen_1t, nota_1t = $nota_1t, nota_final = nota_final + $nota_final WHERE cod_notas = $cod_notas");

echo "<script>location='alumnos.php?cod_paralelo=$cod_paralelo&cod_materia=$cod_materia'</script>";
