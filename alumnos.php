<?php
session_start();

if (!$_SESSION['user']) {
    echo "<script>location='index.php'</script>";
    die();
}

include_once 'conexion.php';
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

    <!-- Header -->
    <div class="container mt-1">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="assets/server.svg" alt="server" width="30px"> PROYECTO BASE DE DATOS I
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

    <div class="container-fluid mt-3">
        <div class="container">
            <?php
            $paralelo = $pdo->query("SELECT * FROM paralelo WHERE cod_paralelo = $cod_paralelo");
            foreach ($paralelo as $p) :
                $paralelo_n = $p['paralelo_n'];

                $materia = $pdo->query("SELECT * FROM materia WHERE cod_materia = '$cod_materia'");
                foreach ($materia as $m) :
                    $nombre_m = $m['nombre_m'];
            ?>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="fw-bold fs-6">
                            <?php echo $paralelo_n ?>
                        </div>
                        <div class="fw-bold fs-6">
                            <?php echo $nombre_m ?>
                        </div>
                        <div>
                            <a href="profesores.php" class="btn btn-warning"><img src="assets/arrow-return-left.svg" alt="back"> Volver</a>
                        </div>
                    </div>

            <?php endforeach;
            endforeach ?>
        </div>
        <h1 class="text-center">Lista de alumnos</h1>
        <div class="table-responsive">
            <table class="table table-hover">
                <tr>
                    <th class="text-center">Nº</th>
                    <th>Ap. Paterno</th>
                    <th>Ap. Materno</th>
                    <th>Nombres</th>
                    <th>Practicas</th>
                    <th>Proyectos</th>
                    <th>Examen</th>
                    <th class="text-center">1er Trim.</th>
                    <th class="text-center">Practicas</th>
                    <th class="text-center">Proyectos</th>
                    <th class="text-center">Examen</th>
                    <th class="text-center">2do Trim.</th>
                    <th class="text-center">Practicas</th>
                    <th class="text-center">Proyectos</th>
                    <th class="text-center">Examen</th>
                    <th class="text-center">3er Trim.</th>
                    <th class="text-center">Nota Final</th>
                    <th class="text-center">Estado</th>
                    <th class="text-center">Actualizar</th>
                </tr>
                <?php
                $paralelo_datos = $pdo->query("SELECT * FROM estudiante WHERE cod_paralelo = '$cod_paralelo'");
                foreach ($paralelo_datos as $dato) :
                ?>
                    <tr>
                        <td class="text-center">
                            <?php echo $dato['n_lista'] ?>
                        </td>
                        <td>
                            <?php echo $dato['ap_paterno'] ?>
                        </td>
                        <td>
                            <?php echo $dato['ap_materno'] ?>
                        </td>
                        <td>
                            <?php echo $dato['nombres_e'] ?>
                        </td>
                        <?php
                        $n_rude = $dato['n_rude'];
                        $cod_notas_consulta = $pdo->query("SELECT * FROM mat_est_not WHERE cod_materia = '$cod_materia' and n_rude = $n_rude");
                        foreach ($cod_notas_consulta as $n) {
                            $cod_notas = $n['cod_notas'];
                        }
                        $notas = $pdo->query("SELECT * FROM notas WHERE cod_notas = $cod_notas");
                        foreach ($notas as $nota) :
                        ?>
                            <td class="text-center">
                                <?php
                                $nt = $nota['practicas_1t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                $nt = $nota['proyectos_1t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                $nt = $nota['examen_1t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center fw-bold">
                                <?php
                                $nt = $nota['nota_1t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>

                            <td class="text-center">
                                <?php
                                $nt = $nota['practicas_2t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                $nt = $nota['proyectos_2t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                $nt = $nota['examen_2t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center fw-bold">
                                <?php
                                $nt = $nota['nota_2t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>

                            <td class="text-center">
                                <?php
                                $nt = $nota['practicas_3t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                $nt = $nota['proyectos_3t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                $nt = $nota['examen_3t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>
                            <td class="text-center fw-bold">
                                <?php
                                $nt = $nota['nota_3t'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>

                            <td class="text-center fw-bold">
                                <?php
                                $nt = $nota['nota_final'];
                                if ($nt == 0) {
                                    echo "-";
                                } else {
                                    echo $nt;
                                }
                                ?>
                            </td>

                            <?php if ($nota['nota_final'] >= 51) : ?>
                                <td class="fw-bold text-center bg-success bg-opacity-50">
                                    Aprobado
                                </td>
                            <?php endif;
                            if ($nota['nota_final'] < 51) : ?>
                                <td class="fw-bold text-center bg-danger bg-opacity-50">
                                    Reprobado
                                </td>
                            <?php endif ?>

                            <td class="text-center">
                                <a href="añadir_nota.php?n_rude=<?php echo $n_rude ?>&cod_notas=<?php echo $cod_notas ?>&cod_paralelo=<?php echo $cod_paralelo ?>&cod_materia=<?php echo $cod_materia ?>">Ver</a>
                            </td>
                    </tr>
            <?php endforeach;
                    endforeach ?>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>