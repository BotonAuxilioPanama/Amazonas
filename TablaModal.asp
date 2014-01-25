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
dim clas
comp = CInt(Request.QueryString("Comp"))

Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
End Select

cabecera "Tabla Por Modalidadd", paginaTit



set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsModal = Server.CreateObject("ADODB.RECORDSET")
RsModal.Source = "SELECT Modalidad.* FROM Modalidad order by Modalidad.Nombre ASC;" 
RsModal.Open, Con

'matriz con las modalidades'
dim modalidades

if not RsModal.EOF then
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

					if not RsAmazonas.EOF then 
					Amazonas = RsAmazonas.GetRows
					RsAmazonas.Close

					if UBound(Amazonas,2) >= 0 then

					Set RsFechas = Server.CreateObject("ADODB.RECORDSET")
					RsFechas.Source = "SELECT Recorridos.Fecha FROM Modalidad INNER JOIN Recorridos ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Modalidad.idModalidad)="&idMod&")) GROUP BY Recorridos.Fecha, Recorridos.Fecha ORDER BY Recorridos.Fecha asc;"
					RsFechas.Open, Con
					

					dim fechas 'Arreglo de fechas'
					if not RsFechas.EOF then 
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
					for h = 0 to UBound(fechas,2) step 1 
							if h mod 2 = 0 then
								clas = "success"
								else 
								clas = "danger"
							end if%>

                        <th colspan="6" class="<%=clas%> text-center"><%=FormatDateTime(fechas(0,h),1)%></th>
					<%next
					%>
					<th rowspan="3 text-center">Total</th>
					</tr>

				<tr>
				<%for y = 0 to UBound(fechas,2) step 1 
							if y mod 2 = 0 then
								clas = "success"
								else 
								clas = "danger"
							end if%>

					<td colspan="3" class="<%=clas%> text-center">Recorrido 1</td>
					<td colspan="3" class="active text-center">Recorrido 2</td>
				<%next%>
					
					
				</tr>

				<tr>
                <%for k = 0 to UBound(fechas,2) step 1 
                	if k mod 2 = 0 then
								clas = "success"
								else 
								clas = "danger"
							end if
                        %>
					<td class="<%=clas%> text-center">Tiempo</td>
					<td class="<%=clas%>  text-center">Falta</td>
					<td class="<%=clas%>  text-center"><span class="glyphicon glyphicon-edit"> </span></td>

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
						

						
					<%for f = 0 to UBound(fechas,2) step 1 
						if f mod 2 = 0 then
								clas = "success"
								else 
								clas = "danger"
							end if
					%>
                       	<%for recor = 1 to 2 step 1 %>
							<%dim Recorrido
							dim fecha
							if recor = 2 then
							clas = "active"
							end if 
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
								<td class="<%=clas%>"></td>
								<td class="<%=clas%>"></td>
								<td class="<%=clas%>"></td>
							<%end if%>
							
							<%next%>
					<%next 'for de fechas
					''espacio para calcular el total por amazona por modalidad
						dim limFecha
						limFecha = UBound(fechas,2)
						dim fecha1
						dim fecha2

						dia = DAY(fechas(0,0))
					    mes = MONTH(fechas(0,0))
					    anio= YEAR(fechas(0,0))
					    fecha1 = dia&"/"&mes&"/"&anio

					    dia = DAY(fechas(0,limFecha))
					    mes = MONTH(fechas(0,limFecha))
					    anio= YEAR(fechas(0,limFecha))
					    fecha2 = dia&"/"&mes&"/"&anio
					    dim tot

					    tot = getSumaModal(fecha1, fecha2, idMod, Amazonas(0,n))
					    if UBound(tot, 2) >= 0 then%>
					    	<td class="<%=clas%> text-center"><%=formatnumber(tot(0,0),3)%></td>
					    	<%else%>
					    		<td class="<%=clas%>">=(</td>
					    	<%'imprime'
					    end if 
					%>

					
					</tr>
				<%next 'for de amazonas%>
				

				<% else
							error
							end if 'de RsFechas
					

				End IF 'fin de if para ver si hay amazonas

				else
							error
				end if 'de RsAmazonas
			%> 
				
			</table>
		</article>
</section>
<%
next 'for de modalidades'
else
		error
end if 'de verificcion de rsModal'

	piePag()
%>
