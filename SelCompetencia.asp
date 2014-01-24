<!DOCTYPE html>
<html lang = "es">
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>


<%
dim op
dim pagina
op = CInt(Request.QueryString("Op"))


Select Case op
Case 1
pagina = "Registro.asp"
Case 2
pagina = "RegistroTiempo.asp"
Case 3
pagina = "RegOrden.asp"
Case 4
pagina = "TablaGeneral.asp"
Case Else
pagina = "Menu.asp"
End Select

%>

<head>
  <title>Seleccione la Competencia  </title>

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
            <h3 >Seleccione la Competencia</h3> 
          </header>

          <section class="col-md-6 col-xs-12 col-md-offset-3">
            <a class="btn btn-primary btn-lg btn-block btn-lg" href="<%=pagina+"?Comp=1"%>" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            Competencia Nacional</a>

            <a class="btn btn-primary btn-lg btn-block btn-lg" href="<%=pagina+"?Comp=2"%>" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Competencia Internacional</span></a>
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