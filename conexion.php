<?php
$link = 'mysql:host=localhost;dbname=proyecto_bd';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO($link, $user, $pass);
} catch (PDOException $e) {
    echo "Error: $e<br>";
    die();
}