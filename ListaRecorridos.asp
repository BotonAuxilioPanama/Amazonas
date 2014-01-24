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

comp = CInt(Request.QueryString("Comp"))

Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
End Select
cabecera("Lista de Recorridos </h3> <h3>"&paginaTit)


%>
<section class="col-md-12 col-xs-12">
	<article class="table-responsive col-md-10 col-md-offset-1 col-xs-12">
		<%
set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsAmazonas = Server.CreateObject("ADODB.RECORDSET")
					RsAmazonas.Source = "SELECT  Recorridos.idRecorrido,Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, Recorridos.Fecha, Modalidad.Nombre AS Modalidad, Recorridos.NumRecor AS [#Recorrido], Recorridos.Tiempo, Recorridos.Falta FROM Modalidad INNER JOIN (((Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo) INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Competencia.idCompetencia)="&comp&")) ORDER BY Amazonas.Nombre, Recorridos.Fecha, Modalidad.Nombre, Recorridos.NumRecor;"

					RsAmazonas.Open, Con
					if not RsAmazonas.EOF then
						cont = 1%>
		<table class="table table-condensed table-bordered">
			<tr class="label-success">
					<th >#</th>
					<th >Amazona</th>
					<th >Equipo</th>
					<th  >Fecha</th>
					<th  >Modalidad</th>
					<th>Recorrido</th>
					<th>Tiempo</th>
					<th>Falta</th>
					<th><span class="glyphicon glyphicon-edit"> </span>Editar</th>
				</tr>
			
	<%Do While not RsAmazonas.EOF 
			dim clas

			if cont mod 2 = 0 then 
			clas = "active"
			Else
			clas ="success"
			end if%>

			<tr>
				<td class="<%=clas%>"><%=cont%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Nombre")&" "&RsAmazonas("Apellido")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Equipo")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Fecha")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Modalidad")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("#Recorrido")%></td>
				<td class="<%=clas%>"><%=formatnumber(RsAmazonas("Tiempo"),3)%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Falta")%></td>
				<td class="<%=clas%>"><a href="Editar.asp?id=<%=RsAmazonas("idRecorrido")%>"><span class="glyphicon glyphicon-edit"> </span></td>
			</tr>
                    <%RsAmazonas.MoveNext
					cont = cont + 1
					loop
					RsAmazonas.Close%>
					</table>
					<%Else%>
					 <div class="jumbotron  alert alert-danger">
					     <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
					    <p>No hay datos Registrados . </p>
					    </div>
					<%End IF%>



</article>
</section>


<%
piePag()
%>




