<!DOCTYPE html>
<html lang = "es">
<head>
  <title>Crear Competencia </title>

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
        <h1 >Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas</small></h1>
        <h3 >Formulario de Creación de Competencia</h3> 
      </header>
        
         <section class="col-md-12">
            <br>
            <form class="form-horizontal col-md-8 col-md-offset-2" role="form" method="post" action="GuardarCompetencia.asp">
              <div class="form-group">
                <label for="nombre" class="col-lg-2 control-label">Nombre de la Competencia</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="nombre" name="nombre"
                  placeholder="Nombre de la Competencia" required>
                </div>
              </div>


              <div class="form-group">
                <label for="fechaIni" class="col-md-2 control-label">Fecha Inicial</label>
                <div class="col-md-6">
                  <input type="date" class="form-control" id="fechaIni" name="fechaIni"
                  placeholder="Fecha Inicial" required>
                </div>
              </div>


               <div class="form-group">
                <label for="fechaFin" class="col-md-2 control-label">Fecha Final</label>
                <div class="col-md-6">
                  <input type="date"  class="form-control" id="fechaFin" name="fechaFin"
                  placeholder="Fecha Final" required>
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