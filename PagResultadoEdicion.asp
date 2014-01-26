<!DOCTYPE html>
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->


<html lang = "es">
<%
existe_sesion
dim res
dim paginaTit
dim op
dim msgError
dim tit

res = CInt(Request.QueryString("res"))
op = CInt(Request.QueryString("Op"))


Select Case res
Case 1
paginaTit = "Operacion Exitosa"
Case 2
paginaTit = "Error"
Case Else
paginaTit = "Desconocido"
End Select

Select Case op
Case 1
msgError = "Proceso de Actualizacion."
tit = "Actualizados"
Case 2
msgError = "Proceso de Eliminación."
tit = "Eliminados"
Case Else
msgError = "Desconocido"
End Select

%>


<head>
  <title> <%=paginaTit%></title>

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
        <h1 >Encuentro de Amazonas 2014 <br> <small>Feria de Sona,Veraguas </small></h1>
        <h3 >Resultado de la Operación</h3> 
      </header>
      


          <%  if res = 2 then   %>

          <div class="jumbotron">
  <div class="container alert alert-danger">
    <h1><span class="glyphicon glyphicon-remove-circle"> </span>Error</h1>
    <p>El <strong><%=msgError%></strong> No se realizó correctamente por favor intente de nuevo.</p>
    <p>
     <a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>   Menu Principal</a>  
    
 
</button>



     </p>
  </div>
</div>
<% elseif res = 1 then %>


 <div class="jumbotron">
  <div class="container alert alert-success">
    <h1> <span class="glyphicon glyphicon-ok-circle"> </span>Datos <%=tit%></h1>
     <p>El <strong><%=msgError%></strong> Se realizó correctamente.</p>
    <p><a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>  Menu Principal</a></p>
  </div>
</div>

<%end if 
 %>
  
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