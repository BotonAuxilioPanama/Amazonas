<!DOCTYPE html>
<html lang = "es">
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->

<%

dim comp
dim paginaTit
dim cantidad
dim v 
comp = CInt(Request.QueryString("Comp"))


Select Case comp
Case 1
paginaTit = "Nacional"
Case 2
paginaTit = "Internacional"
Case Else
paginaTit = "Desconocido"
End Select

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsCantidad = Server.CreateObject("ADODB.RECORDSET")
RsCantidad.Source = "SELECT Count(Amazonas.idAmazona) AS Cantidad FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER  JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)= "& comp &"));"

RsCantidad.Open, Con


 if not RsCantidad.EOF then
 cantidad = RsCantidad("Cantidad")
 RsCantidad.Close
 else
cantidad = 0
end if
 

%>
<head>
  <title>Orden de Recorrido </title>

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
        <h3 >Registrar Orden de Recorrido</h3> 
        <h3 >Para Competencia <%=paginaTit%></h3>
      </header>
      

       <section class="col-md-12">
        <form class="form-horizontal col-md-10 col-md-offset-2" role="form">

            
            <% 
           
            for v = 1 to cantidad  Step 1   %>  
            
             <div class="form-group" >
                <label for="amazona<%=v%>" class="col-md-2 control-label">#<%=v%></label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona<%=v%>" name="amazona<%=v%>">
                   <%ObtenerNombres(comp)%>
                  </select>
                </div>
              </div>
            
            <% next %>

       
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