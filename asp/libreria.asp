<%
function getSumaDia(fecha1, fecha2, idModalidad, idAmazona)
   Set Rs = Server.CreateObject("ADODB.RECORDSET")
  dim sql
  sql = "SELECT sum(Recorridos.Tiempo + Recorridos.Falta) as Suma FROM Modalidad INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Modalidad.idModalidad)="&idModalidad&") AND ((Amazonas.idAmazona)="& idAmazona&")) AND ( Recorridos.Fecha Between #"&fecha1&"# And #"&fecha2&"#);"

          Rs.Source = sql
          Rs.Open, Con
          
          dim ecorrido(0,1) 'Arreglo de recorridos'
          ecorrido(0,0)=0
        if not Rs.EOF then
			 Recorrido = Rs.GetRows
			 
			 if Recorrido(0,0) <> empty then
				
				 getSumaModal = Recorrido
				 
				 Rs.Close
			else
					getSumaModal = ecorrido
		end if
       else
			getRecorrido = ecorrido
         end if 
end function

function getSumaModal(fecha1, fecha2, idModalidad, idAmazona)
  Set Rs = Server.CreateObject("ADODB.RECORDSET")
  dim sql
  sql = "SELECT sum(Recorridos.Tiempo + Recorridos.Falta) as Suma FROM Modalidad INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Modalidad.idModalidad)="&idModalidad&") AND ((Amazonas.idAmazona)="& idAmazona&")) AND ( Recorridos.Fecha Between #"&fecha1&"# And #"&fecha2&"#);"

          Rs.Source = sql
          Rs.Open, Con
          
          dim ecorrido(0,1) 'Arreglo de recorridos'
          ecorrido(0,0)=0
        if not Rs.EOF then
			 Recorrido = Rs.GetRows
			 
			 if Recorrido(0,0) <> empty then
				
				 getSumaModal = Recorrido
				 
				 Rs.Close
			else
					getSumaModal = ecorrido
		end if
       else
			getRecorrido = ecorrido
         end if 
end function


function error()%>
  <div class="jumbotron  alert alert-danger">
    <h1>
        <span class="glyphicon glyphicon-remove-circle"></span>Upps</h1>
    <p>
        No hay datos Registrados .
    </p>
</div>
<%end function


function getRecorrido(idAmazona, idModalidad, fecha, recorrido)
  Set Rs = Server.CreateObject("ADODB.RECORDSET")
  dim sql
  sql = "SELECT Recorridos.idRecorrido, Recorridos.Tiempo, Recorridos.Falta FROM Recorridos WHERE (((Recorridos.idAmazona)="& idAmazona &") AND ((Recorridos.idModalidad)="& idModalidad&") AND ((Recorridos.NumRecor)="& recorrido&") AND ((Recorridos.Fecha)=#"& fecha &"#));"

          Rs.Source = sql
          Rs.Open, Con
          
          dim ecorrido(2,0) 'Arreglo de recorridos'
          ecorrido(0,0)=0
          ecorrido(1,0)=0
          ecorrido(2,0)=0
        if not Rs.EOF then
         getRecorrido = Rs.GetRows
         Rs.Close
         else
         getRecorrido = ecorrido
         end if 
        
  end function

<!-- Sesiones y Usuarios ---------------------------------------------------------------------------------------------->

function existe_sesion()

If Session("User") = "" Then 
	response.redirect("Login.asp")
End If

end function

<!-- Interfase ---------------------------------------------------------------------------------------------->
sub cabecera(nombre, subt)
existe_sesion
%>
<!DOCTYPE html>
<html lang = "es">
<head>
  <title><%=nombre%></title>

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

      
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand">Amazonas 2014</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="menu.asp" ><span class="glyphicon glyphicon-align-justify"></span>&nbsp;Menu</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Crear<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="CrearCompetencia.asp">Crear Competencia</a></li>
          <li><a href="CrearEquipo.asp">Crear Equipo</a></li>
         </ul>
      </li>
      
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Competencia Nacional<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Registro.asp?Comp=1">Registrar Amazona</a></li>
          <li><a href="RegistroTiempo.asp?Comp=1">Registrar Recorrido</a></li>
          <li><a href="RegOrden.asp?Comp=1">Ingresar Orden de Recorrido</a></li>
          <li><a href="VerOrdenRecorrido.asp?Comp=1">Ver Orden de Recorridos</a></li>
          <li class="divider"></li>
          <li><a href="TablaModal.asp?Comp=1">Recorridos por Modalidad</a></li>
          <li><a href="TablaFecha.asp?Comp=1">Recorridos por Fecha</a></li>
          <li><a href="ListaRecorridos.asp?Comp=1">Lista de Recorridos</a></li>
          <li class="divider"></li>
          <li><a href="ListaParticipantes.asp?Comp=1">Participantes</a></li>
          <li><a href="ListaEquipos.asp?Comp=1">Equipos Participantes</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Competencia Internacional<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Registro.asp?Comp=2">Registrar Amazona</a></li>
          <li><a href="RegistroTiempo.asp?Comp=2">Registrar Recorrido</a></li>
          <li><a href="RegOrden.asp?Comp=2">Ingresar Orden de Recorrido</a></li>
          <li><a href="VerOrdenRecorrido.asp?Comp=2">Ver Orden de Recorridos</a></li>
          <li class="divider"></li>
          <li><a href="TablaModal.asp?Comp=2">Recorridos por Modalidad</a></li>
          <li><a href="TablaFecha.asp?Comp=2">Recorridos por Fecha</a></li>
          <li><a href="ListaRecorridos.asp?Comp=2">Lista de Recorridos</a></li>
          <li class="divider"></li>
          <li><a href="ListaParticipantes.asp?Comp=2">Participantes</a></li>
          <li><a href="ListaEquipos.asp?Comp=2">Equipos Participantes</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Rankings<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Ranking.asp">Ranking Oficial</a></li>
          <li><a href="SelFecha.asp">Ranking Diario</a></li>
          <li><a href="RankingGlobal.asp">Ranking Global</a></li>
          <li><a href="RankingMovil.asp">Ranking Para App</a></li>
         </ul>
      </li>
     
    </ul>

    <ul class="nav navbar-nav navbar-right">
       <li class="active"><a href="CerrarSesion.asp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Cerrar Sesion &nbsp;&nbsp;</a></li>
      </ul>
  </div><!-- /.navbar-collapse -->
</nav>
<div class="container">
<br>
      <header class="page-header">
        <h1 >Encuentro de Amazonas 2014 <span class="text-right"> <br> <small>Feria de Sona, Veraguas </small></h1>  
        <h3 ><%=nombre%></h3> 
         <h3 ><%=subt%></h3>
      </header>

<%
end sub 

sub piePag()
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
<%
end sub 


<!-- Creacion de Lista de Amazona ---------------------------------------------------------------------------------------------->

Function ObtenerNombres(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT Amazonas.* FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)= "& comp &")) order by Amazonas.Nombre ASC  ;"
RsPersonas.Open, Con
if not RsPersonas.EOF then
Do While not RsPersonas.EOF
%>
<option value ="<%=RsPersonas("idAmazona")%>"><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></option>
<%
RsPersonas.MoveNext
Loop
RsPersonas.Close
Else%>
<option value ="0">Debe Registar Amazonas</option>
<%End IF
end Function
<!-- Almacenar Orden de Amazonas--------------------------------------------------------------------------------------------->

Function guardarOrden(idAmazona, pos)
 set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     
     RsAmazona.Source = "Insert Into Orden ( idAmazona  ,  Posicion ) Values ("& idAmazona &", "& pos &");"

      RsAmazona.Open, Con 


End Function 

<!-- Funciones de Ranking Ganadores--------------------------------------------------------------------------------------------->

Function GanadoresPromedioInd(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT TOP 5 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, AVG([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY AVG([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then
%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th >#</th>
                    <th class="text-center">Amazona</th> 
                    <th class="text-center">Equipo</th>
                     <th class="text-center">Promedio</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
case Else
color = "active"
End Select

%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td> 
    <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td>
     <td class="text-center"><%=RsPersonas("Equipo")%></td> 
     <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
       <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function

Function GanadoresTiempoInd(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT TOP 5 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre as Equipo, Min([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Min([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con  
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then
%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th class="text-center" >#</th> 
                   <th class="text-center" >Amazona</th>
                    <th class="text-center">Equipo</th> 
                    <th class="text-center">Tiempo</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
case Else
color = "active"
End Select

%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td>
     <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> 
     <td class="text-center"><%=RsPersonas("Equipo")%></td> 
     <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
     <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function


Function GanadoresEquipo(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = " SELECT TOP 5 Equipos.Nombre AS Equipo, Sum([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Sum([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con  
dim pos     
dim color
pos = 1    
if not RsPersonas.EOF then  
%>
  <table class="table table-condensed">
             <tr class="active">
               <th class="text-center">#</th > 
               <th class="text-center">Equipo</th> 
               <th class="text-center">Tiempo</th>
             </tr>
<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
case Else
color = "active"
End Select

%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td>
     <td class="text-center"><%=RsPersonas("Equipo")%></td> 
     <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
        <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function
<!-- Funciones de Ranking Globales ---------------------------------------------------------------------------------------------->

Function PromedioInd(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, AVG([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY AVG([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then
%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th class="text-center">#</th> 
                   <th class="text-center">Amazona</th> 
                   <th class="text-center">Equipo</th> 
                   <th class="text-center">Promedio</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
case Else
color = "active"
End Select

%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td> 
    <td ><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> 
    <td class="text-center"><%=RsPersonas("Equipo")%></td> 
    <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
       <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function

Function TiempoInd(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre as Equipo, Min([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Min([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con  
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then
%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th class="text-center">#</th> 
                   <th class="text-center">Amazona</th> 
                   <th class="text-center">Equipo</th> 
                   <th class="text-center">Tiempo</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos

Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
case Else
color = "active"
End Select


%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td> 
    <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td>
     <td class="text-center"><%=RsPersonas("Equipo")%></td>
      <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
     <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function


Function RankingEquipo(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = " SELECT Equipos.Nombre AS Equipo, Sum([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Sum([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con  
dim pos     
dim color
pos = 1    
if not RsPersonas.EOF then  
%>
  <table class="table table-condensed">
             <tr class="active">
               <th class="text-center">#</th> 
               <th class="text-center">Equipo</th> 
               <th class="text-center">Tiempo</th>
             </tr>
<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
case Else
color = "active"
End Select



%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td>
     <td class="text-center"><%=RsPersonas("Equipo")%></td> 
     <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
        <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function

<!-- Funciones de Ranking Diarios ---------------------------------------------------------------------------------------------->

Function MejorTiempoDia(fecha)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT TOP 5 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, Min([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia, Recorridos.Fecha HAVING (((Equipos.idCompetencia)=1) AND ((Recorridos.Fecha)=#"& fecha &"#)) ORDER BY Min([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then

%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th class="text-center">#</th> 
                   <th class="text-center">Amazona</th>
                    <th class="text-center">Equipo</th> 
                    <th class="text-center">Tiempo</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
Case 4
color = "label-info"
case Else
color = "active"
End Select

%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td> 
    <td ><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td>
     <td class="text-center"><%=RsPersonas("Equipo")%></td>
      <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
       <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function


Function MejorTiempoDiaInter(fecha)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT TOP 5 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, Min([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia, Recorridos.Fecha HAVING (((Equipos.idCompetencia)=2) AND ((Recorridos.Fecha)=#"& fecha &"#)) ORDER BY Min([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then

%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th class="text-center">#</th>
                    <th class="text-center">Amazona</th> 
                    <th class="text-center">Equipo</th> 
                    <th class="text-center">Tiempo</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "label-success"
Case 2
color = "label-warning"
Case 3
color = "label-danger"
Case 4
color = "label-info"
case Else
color = "active"
End Select

%>

 <tr class="<%=color%>">
    <td class="text-center"><%=pos%></td>
     <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> 
     <td class="text-center"><%=RsPersonas("Equipo")%></td> 
     <td class="text-center"><%=formatnumber(RsPersonas("Promedio"),3)%></td>
  </tr>

<%
pos = pos + 1
RsPersonas.MoveNext
Loop
%>
</table>
<%
RsPersonas.Close
Else%>
       <div class="jumbotron  alert alert-danger">
      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
    <p>No hay datos Registrados para esta Categoria. </p>
    </div>
<%End IF

end Function


%>