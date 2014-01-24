<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->

<%
dim usuer
dim pass

user = Re

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsUsuario = Server.CreateObject("ADODB.RECORDSET")
RsUsuario.Source = "SELECT Amazonas.* FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)= "& comp &")) order by Amazonas.Nombre ASC  ;"
RsUsuario.Open, Con
if not RsUsuario.EOF then
Do While not Rsusuario.EOF

RsUsuario.MoveNext
Loop
RsUsuario.Close
else


end if 





%>