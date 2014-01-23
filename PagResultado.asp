<!DOCTYPE html>
<html lang = "es">
<%
    
dim res
dim paginaTit
dim op
dim val
dim comp
dim page

res = CInt(Request.QueryString("res"))


Select Case res
Case 1
paginaTit = "Operacion Exitosa"
Case 2
paginaTit = "Error"
Case Else
paginaTit = "Desconocido"
End Select



if res = 1 then 
op = CInt(Request.QueryString("Op"))
comp = CInt(Request.QueryString("Comp"))
Select Case op
Case 1
page = "Registro.asp?Comp="&comp
Case 2 
page = "RegistroTiempo.asp?Comp="&comp
Case 3
page = "RegOrden.asp?Comp="&comp
End Select




end if 


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
    <p>Ha ocurrido un problema durante el almacenamiento de los datos en el servidor. Por favor regrese e intentelo de nuevo. </p>
    <p><a class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-circle-arrow-left">  </span> Regresar</a>
     <a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>   Menu Principal</a></p>
  </div>
</div>
<% elseif res = 1 then %>


 <div class="jumbotron">
  <div class="container alert alert-success">
    <h1> <span class="glyphicon glyphicon-ok-circle"> </span>Datos Guardados</h1>
    <p>La Información enviada se ha almacenado correctamente en el servidor y puede ser utilizada de inmediato.</p>
    <p><a class="btn btn-primary btn-lg" role="button" href="<%=page%>"><span class="glyphicon glyphicon-plus">  </span>   Nueva Inserción</a>
     <a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>   Menu Principal</a></p>
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