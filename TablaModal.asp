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

'matriz con las modalidades'
dim modalidades
modalidades = RsModal.GetRows '0--> id, 1--> Modlidad '
RsModal.Close

'cantidd de columnas que devuelve la consutlad e modalidades matriz(cXF)'
dim modal_cant
modal_cant = UBound(modalidades,2)


for g = 0 to UBound(modalidades,2)
%>
<section class="col-md-12 col-xs-12">
	<h2>Fecha: <%=modalidades(1,g)%></h2>
		<%
					dim idMod
					idMod = modalidades(0,g)	
					
					set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsAmazonas = Server.CreateObject("ADODB.RECORDSET")
					RsAmazonas.Source = "SELECT Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo FROM Modalidad INNER JOIN ((Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo) ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Competencia.idCompetencia)="& comp &")) GROUP BY Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre, Modalidad.idModalidad HAVING (((Modalidad.idModalidad)="&idMod&")) ORDER BY Equipos.Nombre, Amazonas.Apellido; "

					RsAmazonas.Open, Con
					dim Amazonas 
					Amazonas = RsAmazonas.GetRows
					RsAmazonas.Close

					if UBound(Amazonas,2) >= 0 then

					Set RsFechas = Server.CreateObject("ADODB.RECORDSET")
					RsFechas.Source = "SELECT Recorridos.Fecha FROM Modalidad INNER JOIN Recorridos ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Modalidad.idModalidad)="&idMod&")) GROUP BY Recorridos.Fecha, Recorridos.Fecha ORDER BY Recorridos.Fecha asc;"
					RsFechas.Open, Con
					

					dim fechas 'Arreglo de fechas'
					fechas = RsFechas.GetRows
					RsFechas.Close
					
					dim cant_fechas
					cant_fechas = UBound(fechas,2)

					dim dia
					dim mes 
					dim anio
					%>
						<article class="table-responsive col-md-10 col-md-offset-1 col-xs-12">
						<table class="table table-condensed table-bordered">
						<tr class="active">
							<th rowspan="3 text-center">#</th>
							<th rowspan="3 text-center">Amazona</th>
							<th rowspan="3 text-center">Equipo</th>
					<%
					for h = 0 to UBound(fechas,2) step 1 %>
                        <th colspan="6" class="success text-center"><%=FormatDateTime(fechas(0,h),1)%></th>
					<%next
					%>
					</tr>

				<tr>
				<%for y = 0 to UBound(fechas,2) step 1 %>
					<td colspan="3" class="success text-center">Recorrido 1</td>
					<td colspan="3" class="active text-center">Recorrido 2</td>
				<%next%>

					
				</tr>

				<tr>
                <%for k = 0 to UBound(fechas,2) step 1 %>
					<td class="success text-center">Tiempo</td>
					<td class="success text-center">Falta</td>
					<td class="success text-center"><span class="glyphicon glyphicon-edit"> </span></td>


					<td class="active text-center">Tiempo</td>
					<td class="active text-center">Falta</td>
					<td class="active text-center"><span class="glyphicon glyphicon-edit"> </span></td>
				<%next%>
				</tr>
				
				<%for n = 0 to  UBound(Amazonas,2) %>
					<tr >
					<td class="active text-center"><%=n +1 %></td>
					<td class="active"><%=Amazonas(1,n) &" "& Amazonas(2,n) %></td>
					<td class="active"><%=Amazonas(3,n)%></td>
						

						
					<%for f = 0 to UBound(fechas,2) step 1 %>
                       	<%for recor = 1 to 2 step 1 %>
							<%dim Recorrido
							dim fecha
							dim clas
							clas = "active"
							dia = DAY(fechas(0,f))
					        mes = MONTH(fechas(0,f))
					        anio= YEAR(fechas(0,f))

					        fecha = dia&"/"&mes&"/"&anio

							Recorrido = getRecorrido(Amazonas(0,n), idMod, fecha, recor) 
							if UBound(Recorrido, 2) >= 0 then%>

								<td class="<%=clas%> text-center"><%=formatnumber(Recorrido(1,0),3)%> </td>
								<td class="<%=clas%> text-center"><%=Recorrido(2,0)%> </td>
								<td class="<%=clas%> text-center"><a href="Editar.asp?id=<%=Recorrido(0,0)%>"><span class="glyphicon glyphicon-edit"> </span></td>
								
							<%else%>
								<td class="<%=clas%>">c</td>
								<td class="<%=clas%>"></td>
								<td class="<%=clas%>"></td>
							<%end if%>
							
							<%next%>
					<%next%>

					</tr>
				<%next%>
				

				<%End IF 'fin de if para ver si hay amazonas%> 
				
			</table>
		</article>
</section>
<%
next 'for de modalidades'
	piePag()
%>
