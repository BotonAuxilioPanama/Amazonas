

<%
<!-- Interfase ---------------------------------------------------------------------------------------------->
sub cabecera(nombre)
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
      <div class="container">
      <header class="page-header">
        <h1 >Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas </small></h1>
        <h3 ><%=nombre%></h3> 
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
RsPersonas.Source = "SELECT Amazonas.* FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)= "& comp &"));"
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

<!-- Funciones de Ranking Ganadores--------------------------------------------------------------------------------------------->

Function GanadoresPromedioInd(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT TOP 3 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, AVG([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY AVG([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then
%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th >#</th> <th >Amazona</th> <th >Equipo</th> <th >Promedio</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "success"
Case 2
color = "warning"
Case 3
color = "danger"
End Select

%>

 <tr class="<%=color%>">
    <td><%=pos%></td> <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> <td><%=RsPersonas("Equipo")%></td> <td><%=RsPersonas("Promedio")%></td>
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
RsPersonas.Source = "SELECT TOP 3 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre as Equipo, Min([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Min([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con  
dim pos     
dim color
pos = 1
if not RsPersonas.EOF then
%>
 <table class="table table-condensed">
                 <tr class="active">
                   <th >#</th> <th >Amazona</th> <th >Equipo</th> <th >Tiempo</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "success"
Case 2
color = "warning"
Case 3
color = "danger"
End Select

%>

 <tr class="<%=color%>">
    <td><%=pos%></td> <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> <td><%=RsPersonas("Equipo")%></td> <td><%=RsPersonas("Promedio")%></td>
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
RsPersonas.Source = " SELECT TOP 3 Equipos.Nombre AS Equipo, Sum([Recorridos].[Tiempo]+[Recorridos].[Falta]) AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Sum([Recorridos].[Tiempo]+[Recorridos].[Falta]);"
RsPersonas.Open, Con  
dim pos     
dim color
pos = 1    
if not RsPersonas.EOF then  
%>
  <table class="table table-condensed">
             <tr class="active">
               <th >#</th> <th >Equipo</th> <th >Tiempo</th>
             </tr>
<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "success"
Case 2
color = "warning"
Case 3
color = "danger"
End Select

%>

 <tr class="<%=color%>">
    <td><%=pos%></td> <td><%=RsPersonas("Equipo")%></td> <td><%=RsPersonas("Promedio")%></td>
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
                   <th >#</th> <th >Amazona</th> <th >Equipo</th> <th >Promedio</th>
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
    <td><%=pos%></td> <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> <td><%=RsPersonas("Equipo")%></td> <td><%=RsPersonas("Promedio")%></td>
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
                   <th >#</th> <th >Amazona</th> <th >Equipo</th> <th >Tiempo</th>
                 </tr>

<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "success"
Case 2
color = "warning"
Case 3
color = "danger"
case Else
color = "active"
End Select


%>

 <tr class="<%=color%>">
    <td><%=pos%></td> <td><%=RsPersonas("Nombre")&" "&RsPersonas("Apellido")%></td> <td><%=RsPersonas("Equipo")%></td> <td><%=RsPersonas("Promedio")%></td>
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
               <th >#</th> <th >Equipo</th> <th >Tiempo</th>
             </tr>
<%

Do While not RsPersonas.EOF
Select Case pos
Case 1
color = "success"
Case 2
color = "warning"
Case 3
color = "danger"
case Else
color = "active"
End Select



%>

 <tr class="<%=color%>">
    <td><%=pos%></td> <td><%=RsPersonas("Equipo")%></td> <td><%=RsPersonas("Promedio")%></td>
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