<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
dim comp
dim paginaTit
dim clase
dim tempo(4)
dim falt(4)
dim id(4)
dim clases(4)
comp = CInt(Request.QueryString("Comp"))

Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
End Select

cabecera "Tabla General", paginaTit



set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsModal = Server.CreateObject("ADODB.RECORDSET")
RsModal.Source = "SELECT Modalidad.* FROM Modalidad;"
RsModal.Open, Con

if not RsModal.EOF then
Do While not RsModal.EOF
Set RsModal2 = Server.CreateObject("ADODB.RECORDSET")
RsModal2.Source = "SELECT Count(Modalidad.nombre) AS Cuenta FROM Modalidad;"
RsModal2.Open, Con
dim modal_cant
if not RsModal2.EOF then
	modal_cant = RsModal2("Cuenta")
	else
	modal_cant = 0
	end if 
%>
<section class="col-md-12 col-xs-12">
	<h2>Fecha: <%=RsModal("Nombre") %></h2>
	
				
				<%
					dim cont
										dim idMod
					idMod = RsModal("idModalidad")	
					
					set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsAmazonas = Server.CreateObject("ADODB.RECORDSET")
					RsAmazonas.Source = "SELECT Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo FROM Modalidad INNER JOIN ((Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Competencia.idCompetencia)="& comp &")) GROUP BY Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Modalidad.idModalidad HAVING (((Modalidad.idModalidad)="&idMod&")) ORDER BY Equipos.Nombre, Amazonas.Apellido; "

					RsAmazonas.Open, Con
					Set RsFechas = Server.CreateObject("ADODB.RECORDSET")
					RsFechas.Source = "SELECT Recorridos.Fecha FROM Modalidad INNER JOIN Recorridos ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Modalidad.idModalidad)="&idMod&")) GROUP BY Recorridos.Fecha, Recorridos.Fecha ORDER BY Recorridos.Fecha;"
					RsFechas.Open, Con

					dim cant_fechas
					cant_fechas = cuentaFechas
					dim dia
					dim mes 
					dim anio
					dim cont2
					cont2 = 0

					dim fechas()
					redim fechas(cant_fechas)
					if not RsFechas.EOF then
						
						Do While not RsFechas.EOF
							dia = DAY(RsFechas("Fecha"))
							mes = MONTH(RsFechas("Fecha"))
							anio= YEAR(RsFechas("Fecha"))
							fechas(cont2) = dia&"/"&mes&"/"&anio
							cont2 = cont2 + 1 
						Loop

					end if

					if not RsAmazonas.EOF then
						cont = 1%>
						<article class="table-responsive col-md-10 col-md-offset-1 col-xs-12">
		<table class="table table-condensed table-bordered">
			<tr class="active">
					<th rowspan="3 text-center">#</th>
					<th rowspan="3 text-center">Amazona</th>
					<th rowspan="3 text-center">Equipo</th>
					<%
					for g = 1 to cant_fechas step 1 %>
                        <th colspan="6" class="success text-center"><%=fechas(g)%></th>
					<%next
					%>
					</tr>

				<tr>
				<%for g = 1 to cant_fechas step 1 %>
					<td colspan="3" class="success text-center">Recorrido 1</td>
					<td colspan="3" class="active text-center">Recorrido 2</td>
				<%next%>

					
				</tr>

				<tr>
<%for g = 1 to cant_fechas step 1 %>
					<td class="success text-center">Tiempo</td>
					<td class="success text-center">Falta</td>
					<td class="success text-center"><span class="glyphicon glyphicon-edit"> </span></td>


					<td class="active text-center">Tiempo</td>
					<td class="active text-center">Falta</td>
					<td class="active text-center"><span class="glyphicon glyphicon-edit"> </span></td>
				<%next%>

				</tr>
				<%Do While not RsAmazonas.EOF %>

							

<%
					RsAmazonas.MoveNext
					cont = cont + 1
					loop
					RsAmazonas.Close
					Else%>
					 <div class="jumbotron  alert alert-danger">
					      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
					    <p>No hay datos Registrados . </p>
					    </div>
					<%End IF%>
            </tr>
			</table>
		</article>
</section>
<%
RsModal.MoveNext
loop
RsModal.Close
Else%>
<div class="jumbotron  alert alert-danger">
    <h1>
        <span class="glyphicon glyphicon-remove-circle"></span>Upps</h1>
    <p>
        No hay datos Registrados .
    </p>
</div>
<%End IF%>
<%
	piePag()
%>
