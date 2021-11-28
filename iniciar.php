<?php

include_once 'conexion.php';

$user_login = $_POST['user'];
$password_login = $_POST['password'];

$sql = "SELECT * FROM profesor WHERE usuario = '$user_login' AND contrasena = '$password_login'";
$res = $pdo->query($sql);

if ($res) {
    foreach ($res as $dato) {
        $cod_profesor = $dato['cod_profesor'];
    }
    session_start();
    $_SESSION['user'] = $cod_profesor;
}

if (isset($_SESSION['user'])) {
    echo "<script>location='profesores.php';</script>";
} else {
    echo "<script>alert('Usuario no existe');location='index.php'</script>";
    die();
}