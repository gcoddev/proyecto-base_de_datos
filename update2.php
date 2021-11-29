<?php
session_start();
include_once 'conexion.php';

$cod_paralelo = $_POST['cod_paralelo'];
$cod_materia = $_POST['cod_materia'];
$cod_notas = $_POST['cod_notas'];
$practicas_2t = $_POST['practicas_2t'];
$proyectos_2t = $_POST['proyectos_2t'];
$examen_2t = $_POST['examen_2t'];

$nota_2t = ($practicas_2t + $proyectos_2t + $examen_2t) / 3;
$nota_final = $nota_2t / 3;

$pdo->query("UPDATE notas SET practicas_2t = $practicas_2t, proyectos_2t = $proyectos_2t, examen_2t = $examen_2t, nota_2t = $nota_2t, nota_final = nota_final + $nota_final WHERE cod_notas = $cod_notas");

echo "<script>location='alumnos.php?cod_paralelo=$cod_paralelo&cod_materia=$cod_materia'</script>";
