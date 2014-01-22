
<%
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


Function GanadoresPromedioInd(comp)
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsPersonas = Server.CreateObject("ADODB.RECORDSET")
RsPersonas.Source = "SELECT TOP 3 Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, Sum([Recorridos].[Tiempo]+[Recorridos].[Falta])/4 AS Promedio FROM Modalidad INNER JOIN (Equipos INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad GROUP BY Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Equipos.idCompetencia HAVING (((Equipos.idCompetencia)="& comp &")) ORDER BY Sum([Recorridos].[Tiempo]+[Recorridos].[Falta])/4;"
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





%>