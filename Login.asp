<!DOCTYPE html>
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
if request.Form("user") <> empty AND request.Form("pass") <> empty then

dim user
dim pass
dim com
com = Chr(34) 

user = request.Form("user")
pass = request.Form("pass")

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsUsuario = Server.CreateObject("ADODB.RECORDSET")
RsUsuario.Source = "SELECT Usuarios.idUser, Usuarios.Nick, Usuarios.Password FROM Usuarios WHERE (((Usuarios.Nick)="&com&user&com&"));"
RsUsuario.Open, Con
if not RsUsuario.EOF then
  if pass = RsUsuario("Password")then
      Session.contents("idUser") = RsUsuario("idUser")
      Session.contents("User") = RsUsuario("Nick")
     response.redirect("Menu.asp" )
     else
     response.redirect("Login.asp?res=1" )
     end if
RsUsuario.Close
else
response.redirect("Login.asp?res=1" )

end if 

end if


%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>Iniciar Sesión</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <link href="css/estilos.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
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
    </header>

      <form class="form-signin" role="form"  method="post">
        <h2 class="form-signin-heading">Inicio de sesion</h2>
        <input type="text" class="form-control" placeholder="Usuario" required autofocus name="user">
        <input type="password" class="form-control" placeholder="Contraseña" required name="pass">
       <!--  <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label> -->
        <button class="btn btn-lg btn-primary btn-block" type="submit">
          <span class="glyphicon glyphicon-log-in"></span>
        Iniciar Sesión</button>
         </form> 
        
  <%
    if request.QueryString("res") <> empty  then
      if (request.QueryString("res") = 1) then
            %>
            <div class="alert alert-danger col-md-6 col-md-offset-3">
             
              <p class="text-center"><strong>Error</strong> Combinación de datos incorrecta!!!.</p>
            </div>

            <%
      end if 
    end if 

  %>
      

    </div> <!-- /container -->
  </div>
  <footer id="footer">
       <div class="container">
       <p class="text-muted"><span class="glyphicon glyphicon-copyright-mark"> </span>Club de Amazonas de Veraguas 2014</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>