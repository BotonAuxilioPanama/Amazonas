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
	<h2>Fecha: <%=FormatDateTime(RsFechas("Fecha"),1) %></h2>
	
				
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
					<th rowspan="3 text-center">#</th>
					<th rowspan="3 text-center">Amazona</th>
					<th rowspan="3 text-center">Equipo</th>
					<th colspan="6" class="success text-center">Polos</th>
					<th colspan="6" class="danger text-center">Barriles</th>
				</tr>

				<tr>
					<td colspan="3" class="success text-center">Recorrido 1</td>
					<td colspan="3" class="active text-center">Recorrido 2</td>
					<td colspan="3" class="danger text-center">Recorrido 1</td>
					<td colspan="3" class="active text-center">Recorrido 2</td>
				</tr>

				<tr>
					<td class="success text-center">Tiempo</td>
					<td class="success text-center">Falta</td>
					<td class="success text-center"><span class="glyphicon glyphicon-edit"> </span></td>


					<td class="active text-center">Tiempo</td>
					<td class="active text-center">Falta</td>
					<td class="active text-center"><span class="glyphicon glyphicon-edit"> </span></td>



					<td class="danger text-center">Tiempo</td>
					<td class="danger text-center">Falta</td>
					<td class="danger text-center"><span class="glyphicon glyphicon-edit"> </span></td>



					<td class="active text-center">Tiempo</td>
					<td class="active text-center">Falta</td>
					<td class="active text-center"><span class="glyphicon glyphicon-edit"> </span></td>

				</tr>
				<%Do While not RsAmazonas.EOF %>

							<tr>
							   <td class="active text-center" ><%=cont%></td>
							   <td class="active" ><%=RsAmazonas("Nombre")&" "&RsAmazonas("Apellido")%></td>
							   <td class="active "><%=RsAmazonas("Equipo")%></td>

			             <%

			             	set Con = Server.CreateObject("ADODB.CONNECTION")
							Con.Open = STRCONEXION

							Set RsRecorrido = Server.CreateObject("ADODB.RECORDSET")
							RsRecorrido.Source = "SELECT Recorridos.idRecorrido, Recorridos.idModalidad, Recorridos.NumRecor, Recorridos.Tiempo, Recorridos.Falta FROM Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona WHERE (((Amazonas.idAmazona)="&RsAmazonas("idAmazona")&") AND ((Recorridos.Fecha)=#"&dia&"/"&mes&"/"&anio&"#)) ORDER BY Recorridos.idModalidad, Recorridos.NumRecor;"

							RsRecorrido.Open, Con

							 for i = 0 to 4 step 1
                                       	  tempo(i) = 0
											falt(i) =" "
											id(i) ="#"
                                        next
                                        clases(0) ="success"
                                        clases(1) ="active"
                                         clases(2) ="danger"
                                         clases(3) ="active"

							if not RsRecorrido.EOF then
							Do While not RsRecorrido.EOF 


                                        if 	RsRecorrido("idModalidad") = 1 and  RsRecorrido("NumRecor") = 1 then
                                        		tempo(0) =RsRecorrido("Tiempo")
											falt(0) =RsRecorrido("Falta")
											id(0) =RsRecorrido("idRecorrido")
                                            

                                        elseif 	RsRecorrido("idModalidad") = 1 and  RsRecorrido("NumRecor") = 2 then
                                        tempo(1) =RsRecorrido("Tiempo")
											falt(1) =RsRecorrido("Falta")
											id(1) =RsRecorrido("idRecorrido")
                                           

                                        elseif 	RsRecorrido("idModalidad") = 2 and  RsRecorrido("NumRecor") = 1 then

                                         tempo(2) =RsRecorrido("Tiempo")
											falt(2) =RsRecorrido("Falta")
											id(2) =RsRecorrido("idRecorrido")
                                           

                                        elseif 	RsRecorrido("idModalidad") = 2 and  RsRecorrido("NumRecor") = 2 then
                                        	 tempo(3) =RsRecorrido("Tiempo")
											falt(3) =RsRecorrido("Falta")
											id(3) =RsRecorrido("idRecorrido")
                                            
                                      end if
						    RsRecorrido.MoveNext
							loop
							 for j = 0 to 3 step 1%>
                                  <td class="<%=clases(j)%> text-center"><%=formatnumber(tempo(j),3)%></td>
								<td class="<%=clases(j)%> text-center"><%=falt(j)%></td>
							<td class="<%=clases(j)%> text-center"><a href="Editar.asp?id=<%=id(j)%>"><span class="glyphicon glyphicon-edit"> </span></td>
                            <% 
                            next
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
