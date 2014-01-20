<!DOCTYPE html>
<html lang = "es">
<head>
  <title>Registro de Amazona </title>

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
            <h1 >Encuentro de Amazonas 2014 <br> <small>Para Competencia X</small></h1>
            <h3 >Ingrese los datos de la Amazona</h3> 
          </header>

          <section class="col-md-12">
            <br>
            <form class="form-horizontal col-md-8 col-md-offset-2" role="form">
              <div class="form-group">
                <label for="nombre" class="col-lg-2 control-label">Nombre</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="nombre"
                  placeholder="Nombres" required>
                </div>
              </div>

              <div class="form-group">
                <label for="apellido" class="col-lg-2 control-label">Apellido</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="apellido" 
                  placeholder="Apellidos" required>
                </div>
              </div>
              <div class="form-group">
                <label for="edad" class="col-lg-2 control-label">Edad</label>
                <div class="col-lg-10">
                  <input type="number" min="10" max="40" class="form-control" id="edad" 
                  placeholder="Edad" required>
                </div>
              </div>


              <div class="form-group">
                <label for="lugares" class="col-lg-2 control-label">Equipo</label>
                <div class="col-lg-10">
                  <select class="form-control" id="lugares">
                    <option>Panamá</option>
                    <option>Veraguas</option>
                    <option>Bocas del Toro</option>
                    <option>Colon</option>
                    <option>Chorrera</option>
                    <option>Chiriqui</option>
                    <option>Cocle</option>
                    <option>Herrera</option>
                    <option>Los Santos</option>
                    <option class="divider"></option>
                    <option >Venezuela</option>
                    <option value="">Panama</option>
                    <option value="">Cuba</option>
                    <option value="">Puerto Rico</option>

                  </select>
                </div>
              </div>

              <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                  <button type="submit" class="btn btn-primary">
                     <span class=" glyphicon glyphicon-floppy-save"></span>
                  Guardar
                  </button>
                </div>
              </div>

            </form>
          </section>
        </div>

      </div>

      <footer id="footer">
       <div class="container ">
       <p class="text-muted">Club de Amazonas de Verguas 2014</p>
      </div>
    </footer>
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
  </html>