<?php

session_start();
if (!$_SESSION['user']) {
    echo "<script>location='index.php'</script>";
    die();
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!-- Header -->
    <div class="container-fluid position-fixed">
        <div class="container mt-1">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="assets/server.svg" alt="server" width="30px">
                        PROYECTO BASE DE DATOS I
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="institucion.php">Institucion</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="profesores.php">Materias</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="acerca-de.php">Acerca de</a>
                            </li>
                        </ul>
                        <form class="d-flex">
                        <a href="cerrar.php" class="btn btn-outline-danger">Cerrar sesion</a>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="vh-100 vw-100 d-flex flex-column justify-content-center">
        <div class="text-center">
            <span class="fw-bold fs-3">COLEGIO</span><br>
            <span class="fw-bold fs-3">Tecnico Humanistico</span><br>
            <span class="fw-bold fs-3">"JOSE LUIS SUAREZ GUZMAN"</span><br>
            Fund. 3 de Junio 1983<br>
            <img src="assets/Logo_colegio.png" alt="Logo_colegio" width=150px" class="mt-3"><br>
            <span class="fw-bold fs-4">EL ALTO - BOLIVIA</span><br>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>