<!DOCTYPE html>
<html lang = "es">
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->

<%

dim comp
dim paginaTit
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

Set RsEquipos = Server.CreateObject("ADODB.RECORDSET")
RsEquipos.Source = "SELECT Equipos.idEquipo, Equipos.Nombre FROM Equipos WHERE (((Equipos.idCompetencia)="& comp &"));" 
RsEquipos.Open, Con

%>

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
           <h1 >Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas </small></h1>
           <h3 >Registrar Orden de Recorrido</h3> 
           <h3 >Para Competencia <%=paginaTit%></h3>
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
              <label for="equipo" class="col-lg-2 control-label">Equipo</label>
              <div class="col-lg-10">
                <select class="form-control" id="equipo">
                  <%
                  if not RsEquipos.EOF then
                  Do While not RsEquipos.EOF
                  %>
                  <option value ="<%=RsEquipos("idEquipo")%>"><%=RsEquipos("Nombre")%></option>
                  <%
                  RsEquipos.MoveNext
                  Loop
                  RsEquipos.Close
                  Else%>
                  <option value ="0">Debe Crear Equipos</option>
                  <%End If%>
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
       <p class="text-muted"><span class="glyphicon glyphicon-copyright-mark"> </span>Club de Amazonas de Veraguas 2014</p>
     </div>
   </footer>


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://code.jquery.com/jquery.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="js/bootstrap.min.js"></script>
 </body>
 </html>