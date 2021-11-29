<?php
session_start();

if (!$_SESSION['user']) {
    echo "<script>location='index.php'</script>";
    die();
}

include_once 'conexion.php';
$id = $_REQUEST['id'];
$cod_notas = $_REQUEST['cod_notas'];
$n_rude = $_REQUEST['n_rude'];
$cod_paralelo = $_REQUEST['cod_paralelo'];
$cod_materia = $_REQUEST['cod_materia'];
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
    <div class="container mt-1">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="assets/server.svg" alt="server" width="30px">
                    PROYECTO BASE DE DATOS I
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
        <h1 class="text-center">Añadir Nota</h1>
        <div class="row">
            <?php
            $estudiante = $pdo->query("SELECT * FROM estudiante WHERE n_rude = $n_rude");
            foreach ($estudiante as $est) :
                $par = $est['cod_paralelo'];
                $paralelo = $pdo->query("SELECT * FROM paralelo WHERE cod_paralelo = $par");
                foreach ($paralelo as $p) :
            ?>
                    <div class="col-md-2 col-4">
                        <div class="fw-bold">Nº de lista</div>
                        <div class="fw-bold">Estudiante</div>
                        <div class="fw-bold">Curso</div>
                    </div>
                    <div class="col-md-4 col-8">
                        <div id="lista"><?php echo $est['n_lista'] ?></div>
                        <div id="estudiante"><?php echo $est['ap_paterno'], " ", $est['ap_materno'], " ", $est['nombres_e'] ?></div>
                        <div><span><?php echo $p['paralelo_n'] ?></span>&nbsp;de Secundaria</div>
                    </div>

                    <div class="col-md-2 col-4">
                        <div class="fw-bold">CI</div>
                        <div class="fw-bold">Nº Rude</div>
                        <div class="fw-bold">Gestion</div>
                    </div>
                    <div class="col-md-3 col-8">
                        <div id="estudiante"><?php echo $est['ci_estudiante'] ?></div>
                        <div id="lista"><?php echo $est['n_rude'] ?></div>
                        <div>2021</div>
                    </div>
            <?php endforeach;
            endforeach ?>
        </div>
    </div>

    <?php
    if ($id == 1) :
    ?>
        <div class="container-fluid mt-3">
            <form action="update1.php" method="POST" class="form-control">
                <input type="text" name="cod_notas" hidden value="<?php echo $cod_notas ?>">
                <input type="text" name="cod_paralelo" hidden value="<?php echo $cod_paralelo ?>">
                <input type="text" name="cod_materia" hidden value="<?php echo $cod_materia ?>">
                <?php
                $notas_consulta = $pdo->query("SELECT * FROM notas WHERE cod_notas = $cod_notas");
                foreach ($notas_consulta as $nota) :
                ?>
                    <div class="fs-4 mt-3">Primer Trimestre</div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_practicas" class="form-check-label">Practicas</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_practicas" name="practicas_1t" placeholder="Ingrese su nota" value="<?php echo $nota['practicas_1t'] ?>" required>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_proyectos" class="form-check-label">Proyectos</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_proyectos" name="proyectos_1t" placeholder="Ingrese su nota" value="<?php echo $nota['proyectos_1t'] ?>" required>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_examen" class="form-check-label">Examen</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_examen" name="examen_1t" placeholder="Ingrese su nota" value="<?php echo $nota['examen_1t'] ?>" required>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mt-1">
                            <label class="form-check-label">Nota Primer Trimestre</label>
                            <div type="text" class="alert alert-info">
                                <?php echo $nota['nota_1t'] ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
                <div class="d-flex justify-content-center mb-2">
                    <input type="submit" value="Actualizar datos" class="btn btn-success mx-1">
                    <a href="alumnos.php?cod_paralelo=<?php echo $cod_paralelo ?>&cod_materia=<?php echo $cod_materia ?>" class="btn btn-warning mx-1">Volver</a>
                </div>
            </form>
        </div>
    <?php
    endif;
    if ($id == 2) :
    ?>
        <div class="container-fluid mt-3">
            <form action="update2.php" method="POST" class="form-control">
                <input type="text" name="cod_notas" hidden value="<?php echo $cod_notas ?>">
                <input type="text" name="cod_paralelo" hidden value="<?php echo $cod_paralelo ?>">
                <input type="text" name="cod_materia" hidden value="<?php echo $cod_materia ?>">
                <?php
                $notas_consulta = $pdo->query("SELECT * FROM notas WHERE cod_notas = $cod_notas");
                foreach ($notas_consulta as $nota) :
                ?>
                    <div class="fs-4 mt-3">Segundo Trimestre</div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_practicas" class="form-check-label">Practicas</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_practicas" name="practicas_2t" placeholder="Ingrese su nota" value="<?php echo $nota['practicas_2t'] ?>" required>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_proyectos" class="form-check-label">Proyectos</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_proyectos" name="proyectos_2t" placeholder="Ingrese su nota" value="<?php echo $nota['proyectos_2t'] ?>" required>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_examen" class="form-check-label">Examen</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_examen" name="examen_2t" placeholder="Ingrese su nota" value="<?php echo $nota['examen_2t'] ?>" required>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mt-1">
                            <label class="form-check-label">Nota Segundo Trimestre</label>
                            <div class="alert alert-info">
                                <?php echo $nota['nota_2t'] ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
                <div class="d-flex justify-content-center mb-2">
                    <input type="submit" value="Actualizar datos" class="btn btn-success mx-1">
                    <a href="alumnos.php?cod_paralelo=<?php echo $cod_paralelo ?>&cod_materia=<?php echo $cod_materia ?>" class="btn btn-warning mx-1">Volver</a>
                </div>
            </form>
        </div>
    <?php
    endif;
    if ($id == 3) :
    ?>
        <div class="container-fluid mt-3">
            <form action="update3.php" method="POST" class="form-control">
                <input type="text" name="cod_notas" hidden value="<?php echo $cod_notas ?>">
                <input type="text" name="cod_paralelo" hidden value="<?php echo $cod_paralelo ?>">
                <input type="text" name="cod_materia" hidden value="<?php echo $cod_materia ?>">
                <?php
                $notas_consulta = $pdo->query("SELECT * FROM notas WHERE cod_notas = $cod_notas");
                foreach ($notas_consulta as $nota) :
                ?>
                    <div class="fs-4 mt-3">Tercer Trimestre</div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_practicas" class="form-check-label">Practicas</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_practicas" name="practicas_3t" placeholder="Ingrese su nota" value="<?php echo $nota['practicas_3t'] ?>">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_proyectos" class="form-check-label">Proyectos</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_proyectos" name="proyectos_3t" placeholder="Ingrese su nota" value="<?php echo $nota['proyectos_3t'] ?>">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <label for="pt_examen" class="form-check-label">Examen</label>
                            <input type="number" min="0" max="100" class="form-control" id="pt_examen" name="examen_3t" placeholder="Ingrese su nota" value="<?php echo $nota['examen_3t'] ?>">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mt-1">
                            <label class="form-check-label">Nota Tercer Trimestre</label>
                            <div class="alert alert-info">
                                <?php echo $nota['nota_3t'] ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
                <div class="d-flex justify-content-center mb-2">
                    <input type="submit" value="Actualizar datos" class="btn btn-success mx-1">
                    <a href="alumnos.php?cod_paralelo=<?php echo $cod_paralelo ?>&cod_materia=<?php echo $cod_materia ?>" class="btn btn-warning mx-1">Volver</a>
                </div>
            </form>
        </div>
    <?php endif; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>