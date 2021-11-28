<?php
session_start();

if (!$_SESSION['user']) {
    echo "<script>location='index.php'</script>";
    die();
}

include_once 'conexion.php';
$id = $_SESSION['user'];
$res = $pdo->query("SELECT * FROM profesor where cod_profesor = $id");
foreach ($res as $dato):
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!-- Header -->
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

    <div class="container mt-3">
        <h1 class="fs-2 text-center">Datos Profesor</h1>
        <div class="row">
            <div class="col-md-2 col-4">
                <div class="fw-bold">Codigo Prof.</div>
                <div class="fw-bold">Docente</div>
                <div class="fw-bold">Nº de celular</div>
            </div>
            <div class="col-md-4 col-8">
                <div><?php echo $dato['cod_profesor'] ?></div>
                <div><?php echo $dato['nombres_p'], " ", $dato['apellidos_p'] ?></div>
                <div><?php echo $dato['n_celular_p'] ?></div>
            </div>

            <div class="col-md-2 col-4">
                <div class="fw-bold">CI</div>
                <div class="fw-bold">Usuario</div>
                <div class="fw-bold">Gestion</div>
            </div>
            <div class="col-md-3 col-8">
                <div><?php echo $dato['ci_profesor'] ?></div>
                <div><?php echo $dato['usuario'] ?></div>
                <div>2021</div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid mt-4">
        <h1 class="text-center fs-3"><--  Paralelos inscritos  --></h1>
        <div class="row">
            <?php 
            $paralelos = $pdo->query("SELECT * FROM prof_mat_par WHERE cod_profesor = $id");
            foreach ($paralelos as $pp):
                $cod_paralelo = $pp['cod_paralelo'];
                $cod_materia = $pp['cod_materia'];

                $paralelo = $pdo->query("SELECT * FROM paralelo WHERE cod_paralelo = $cod_paralelo");
                foreach ($paralelo as $p):
                    $paralelo_n = $p['paralelo_n'];

                $materia = $pdo->query("SELECT * FROM materia WHERE cod_materia = '$cod_materia'");
                foreach ($materia as $m):
                    $nombre_m = $m['nombre_m'];
            ?>
            <div class="col-md-4 col-sm-6 col-12 mb-3 mt-3">
                <a href="alumnos.php?cod_paralelo=<?php echo $cod_paralelo ?>&cod_materia=<?php echo $cod_materia ?>" class="btn btn-outline-dark h-100 w-100">
                    <?php echo $paralelo_n, "<br>", $nombre_m ?>
                </a>
            </div>
            <?php 
            endforeach;
            endforeach;
            endforeach;
            endforeach; 
            ?>
        </div>
    </div>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>

