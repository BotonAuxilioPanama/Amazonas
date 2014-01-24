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
comp = CInt(Request.QueryString("Comp"))

Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
End Select

cabecera("Tabla General </h3> <h3>"&paginaTit)



set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsFechas = Server.CreateObject("ADODB.RECORDSET")
RsFechas.Source = "SELECT Recorridos.Fecha FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo GROUP BY Recorridos.Fecha, Competencia.idCompetencia HAVING (((Competencia.idCompetencia)="& comp &"));"

RsFechas.Open, Con

					


if not RsFechas.EOF then
Do While not RsFechas.EOF
%>
<section class="col-md-12 col-xs-12">
	<h2>Fecha: <%=FormatDateTime(RsFechas("Fecha"),1)&"----"&FormatDateTime(RsFechas("Fecha"),2) %></h2>
	
				
				<%
					dim cont
					dim dia
					dim mes 
					dim anio

					dia = DAY(RsFechas("Fecha"))
					mes = MONTH(RsFechas("Fecha"))
					anio= YEAR(RsFechas("Fecha"))

					set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsAmazonas = Server.CreateObject("ADODB.RECORDSET")
					RsAmazonas.Source = "SELECT Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo FROM ((Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo) INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona WHERE (((Competencia.idCompetencia)=1) AND ((Recorridos.Fecha)=#"&dia&"/"&mes&"/"&anio&"#)) Group BY Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido,Equipos.Nombre ORDER BY Equipos.Nombre, Amazonas.Apellido ;"

					RsAmazonas.Open, Con
					if not RsAmazonas.EOF then
						cont = 1%>
						<article class="table-responsive col-md-10 col-md-offset-1 col-xs-12">
		<table class="table table-condensed table-bordered">
			<tr class="active">
					<th rowspan="3">#</th>
					<th rowspan="3">Amazona</th>
					<th rowspan="3">Equipo</th>
					<th colspan="6" class="success">Polos</th>
					<th colspan="6" class="danger">Barriles</th>
				</tr>

				<tr>
					<td colspan="3" class="success">Recorrido 1</td>
					<td colspan="3" class="active">Recorrido 2</td>
					<td colspan="3" class="danger">Recorrido 1</td>
					<td colspan="3" class="active">Recorrido 2</td>
				</tr>

				<tr>
					<td class="success">Tiempo</td>
					<td class="success">Falta</td>
					<td class="success"><span class="glyphicon glyphicon-edit"> </span></td>


					<td class="active">Tiempo</td>
					<td class="active">Falta</td>
					<td class="active"><span class="glyphicon glyphicon-edit"> </span></td>


					<td class="danger">Tiempo</td>
					<td class="danger">Falta</td>
					<td class="danger"><span class="glyphicon glyphicon-edit"> </span></td>


					<td class="active">Tiempo</td>
					<td class="active">Falta</td>
					<td class="active"><span class="glyphicon glyphicon-edit"> </span></td>
				</tr><%
					Do While not RsAmazonas.EOF %>

							<tr>
							   <td class="active" ><%=cont%></td>
							   <td class="active" ><%=RsAmazonas("Nombre")&" "&RsAmazonas("Apellido")%></td>
							   <td class="active"><%=RsAmazonas("Equipo")%></td>

			             <%

			             	set Con = Server.CreateObject("ADODB.CONNECTION")
							Con.Open = STRCONEXION

							Set RsRecorrido = Server.CreateObject("ADODB.RECORDSET")
							RsRecorrido.Source = "SELECT Recorridos.idRecorrido, Recorridos.idModalidad, Recorridos.NumRecor, Recorridos.Tiempo, Recorridos.Falta FROM Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona WHERE (((Amazonas.idAmazona)="&RsAmazonas("idAmazona")&") AND ((Recorridos.Fecha)=#"&dia&"/"&mes&"/"&anio&"#)) ORDER BY Recorridos.idModalidad, Recorridos.NumRecor;"

							RsRecorrido.Open, Con
							if not RsRecorrido.EOF then
							Do While not RsRecorrido.EOF 

									    dim tempo
										dim falt
										dim id
					             for modal = 1 to 2 step 1

					              for recor = 1 to 2 step 1
									Select Case modal
										Case 1
										clase = "success"
										Case 2
										clase = "danger"
										End Select

									if recor = 2 then 
										clase = "active"
									end if%>
										
                                         <%
										tempo = 0
										falt =" "
										id="#"
										if RsRecorrido("idModalidad") = modal and RsRecorrido("NumRecor") = recor then
											tempo =RsRecorrido("Tiempo")
											falt =RsRecorrido("Falta")
											id =RsRecorrido("idRecorrido")
                                            %>
										<td class="<%=clase%>"><%=tempo%></td>
										<td class="<%=clase%>"><%=falt%></td>
										<td class="<%=clase%>"><a href="Editar.asp?id=<%=id%>"><span class="glyphicon glyphicon-edit"> </span></td>
                                         <%




					                     %>
					                    <% end if%>
										

					            <%next%>
					            

					            <%next %>
							<% 

						   RsRecorrido.MoveNext
							loop
							RsRecorrido.Close
							Else%>
							 <div class="jumbotron  alert alert-danger">
							      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
							    <p>No hay datos Registrados . </p>
							    </div>
							<%End IF


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
RsFechas.MoveNext
loop
RsFechas.Close
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
