<!DOCTYPE html>
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
existe_sesion
%>

<html lang = "es">
<head>
  <title>Menu Principal </title>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Login del Sistema">
  <meta name="author" content="@jockrlos22">


  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/estilos.css" rel="stylesheet">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
    </head>
    <body>
     
      <div id="wrap">
      <div class="container">
      <header class="page-header">
        <h1 >Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas </small></h1>
        <h3 >Menu Principal</h3> 
      </header>

      <section class="col-md-6 col-xs-12 col-md-offset-3">


           <a class="btn btn-primary btn-lg btn-block btn-lg" href="CrearCompetencia.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Nueva Competencia
          </a>

           <a class="btn btn-primary btn-lg btn-block btn-lg" href="CrearEquipo.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Nuevo Equipo
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=1" role="button">
           <span class="glyphicon glyphicon-chevron-right"></span>
           Nueva Amazona
          </a>
          
           <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=3" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Registrar Orden de Recorrido</span>
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=2" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Registrar Tiempo</span>
          </a>

      <!--     <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.html" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Seleccionar Competencia
          </a> -->

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="Ranking.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Ver Ranking
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelFecha.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Mejor por Fecha
          </a>

           <a class="btn btn-primary btn-lg btn-block btn-lg" href="RankingGlobal.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Ver Ranking Global
          </a>

           <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=4" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Tabla Detallada por Fecha</span>
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=7" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Tabla por Modalidad</span>
          </a>

             <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=5" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Lista de Recorridos</span>
          </a>
            <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=6" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Orden de Recorrido</span>
          </a>

           <a class="btn btn-primary btn-lg btn-block btn-lg" href="CerrarSesion.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Cerrar Sesión</span>
          </a>

         
        </section>
        </div>
      </div>

    <footer id="footer">
       <div class="container">
       <p class="text-muted"><span class="glyphicon glyphicon-copyright-mark"> </span>Club de Amazonas de Veraguas 2014</p>
      </div>
    </footer>

      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://code.jquery.com/jquery.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="js/bootstrap.min.js"></script>
    </body>
    </html>