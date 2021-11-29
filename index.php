<?php
session_start();
$_SESSION = array();
session_destroy();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyecto Base de Datos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="shortcut icon" href="assets/GCodDev_Circular.png" type="image/x-icon">
</head>

<body>
    <div class="container">
        <div class="row vh-100 justify-content-center align-items-center">
            <div class="col-auto">
                <!-- Formulario de inicio de sesion (Administrador & Profesores) -->
                <form method="POST" action="iniciar.php"
                    class="form-control p-4 bg-dark bg-opacity-10 border-0 formulario">
                    <h1 class="text-center fs-2">INGRESAR</h1>
                    <label for="user" class="form-check-label">Usuario:</label>
                    <input type="text" name="user" id="user" class="form-control"
                        placeholder="Ingrese nombre de usuario" required>
                    <label for="password" class="form-check-label mt-2">Contraseña:</label>
                    <input type="password" name="password" id="password" class="form-control"
                        placeholder="Ingrese su contraseña" required>

                    <input type="submit" class="btn btn-success mt-3 w-100" value="Iniciar Sesion">
                    <!-- <a href="institucion.html" class="btn btn-success mt-3 w-100" value="Iniciar Sesion">Iniciar Sesion</a> -->
                </form>
            </div>
        </div>
    </div>
</body>

</html>