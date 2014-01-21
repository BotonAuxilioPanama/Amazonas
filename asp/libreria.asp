
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
%>