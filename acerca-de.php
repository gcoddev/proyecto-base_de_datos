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
                        <a href="cerrar.php" class="btn btn-outline-danger" type="submit">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <div class="container mt-2">
        <div class="text-center">
            <span class="fw-bold fs-3">Universidad Publica de El Alto</span><br><br>
            <div>
                <img src="assets/Logo_upea.png" alt="Logo UPEA" width="130px">
                <img src="assets/GCodDev.png" alt="Logo GCodDev" width="130px">
            </div><br>
            <span class="fw-bold fs-5">@Autor: </span>Gary Limbert Apaza Mamani<br>
            <span class="fw-bold fs-5">@E-mail: </span><a href="" class="link-primary">geco.yak77@gmail.com</a><br>
            <span class="fw-bold fs-5">@Gitgub: </span><a href="https://github.com/gcoddev/" class="link-primary"
                target="_blank">gcoddev</a><br>
            <span class="fw-bold fs-5">@WhatsApp: </span><a href="https://wa.me/+59167032056?text=Hola" class="link-primary"
                target="_blank">+591 67032056</a><br>
            <span class="fw-bold fs-5">@Carrera: </span>Ingenieria de Sistemas<br>
            <span class="fw-bold fs-5">@Semestre: </span>4to Semestre "A"<br>
            <span class="fw-bold fs-5">@Materia: </span>Base de Datos I<br>
            <span class="fw-bold fs-5">@Docente: </span>Christian Roman Campero<br>
            <br>
            <span class="fs-6 d-flex justify-content-center align-items-center"><span
                    class="fw-bold fs-4">&copy;</span>Todos los derechos reservados 2021 -&nbsp;<span
                    class="fw-bold">@GCodDev</span></span>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>