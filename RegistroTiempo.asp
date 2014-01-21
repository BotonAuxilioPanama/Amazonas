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
dim fechahoy
fechahoy = Date()
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

Set RsModalidades = Server.CreateObject("ADODB.RECORDSET")
RsModalidades.Source = "SELECT Modalidad.*FROM Modalidad;" 


 

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
            <h1>Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas </small></h1>
            <h3>Ingreso del Tiempo para Amazona</h3> 
            <h3>Para Competencia <%=paginaTit%></h3>
          </header>


          <section class="col-md-12 col-xs-12">
            <form class="form-horizontal col-md-8 col-md-offset-3 col-xs-12" role="form"  action="GuardarTiempo.asp" method="post">

              <div class="form-group" >
                <label for="amazona" class="col-md-2 control-label">Amazona</label>
                <div class="col-md-6">
                 <select class="form-control" id="amazona" name="amazona">
                <%  ObtenerNombres(comp) %>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="Tiempo" class="col-md-2 control-label">Tiempo</label>
                <div class="col-md-6">
                  <input type="number" min="0" step="any"class="form-control" id="tiempo" name="tiempo"
                  placeholder="Tiempo" required>
                </div>
              </div>

              <div class="form-group">
                <label for="faltas" class="col-md-2 control-label">Faltas</label>
                <div class="col-md-6">
                  <input type="number" min="0" max="10" class="form-control" id="faltas" name="faltas"
                  placeholder="# de Obstaculos Derribados: 0, 1, 2, ..." required>
                </div>
              </div>

              <div class="form-group">
                <label for="fecha" class="col-md-2 control-label">Fecha</label>
                <div class="col-md-6">
                  <input type="date" class="form-control" id="fecha"  name="fecha"
                  placeholder="Fecha" required value="<%= fechahoy %>">
                </div>
              </div>

             <!--  <div class="form-group">
                <label for="modalidad" class="col-md-2 control-label">Modalidad</label>
                <div class="col-md-6">
                  <select class="form-control" id="modalidad">
                    <option>Polos</option>
                    <option>Barriles</option>
                  </select>
                </div>
              </div>-->
               
            <div class="form-group">
                <label for="recorrido" class="col-md-2 control-label">Modalidad</label>
                <div class="col-md-6" id="recorrido">
                    
                      <%
                          RsModalidades.Open, Con
                  if not RsModalidades.EOF then
                  Do While not RsModalidades.EOF
                  %>
                     <label class="radio-inline">
                  <input type="radio" id="mod<%=RsModalidades("idModalidad")%>" name="modalidad" value="<%=RsModalidades("idModalidad")%>" required> <%=RsModalidades("Nombre")%>  </label>
                  <%
                  RsModalidades.MoveNext
                  Loop
                  RsModalidades.Close
                  Else%>
                    <label class="radio-inline">
                  <input type="radio" id="mod" name="modalidad" value="1" disabled="disabled" required> Debe Crear Modalidades  </label>
                  <%End If%>
                     </div>
                 </div>
                
              <div class="form-group">
                <label for="recorrido" class="col-md-2 control-label"># de Recorrido</label>
                <div class="col-md-6" id="recorrido">

                <label class="radio-inline">
                  <input type="radio" id="recorNun1" name="recor" value="1" required> 1
                </label>
                <label class="radio-inline">
                  <input type="radio" id="recorNun2" name="recor" value="2" required> 2
                </label>
              </div>



                <!--
                <div class="col-md-6">
                  <input type="number" min="1" max ="2" class="form-control" id="recorrido" 
                  placeholder="# de Recorrido" required>
                </div> -->
              </div>


              <div class="form-group">
                <div class="col-md-offset-2 col-md-6">
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