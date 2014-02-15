<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
dim comp
comp = CInt(Request.QueryString("Comp"))

Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
End Select

cabecera"Orden de Recorrido",paginaTit
%>
<section class="col-md-12 col-xs-12">
	<article class="table-responsive col-md-10 col-md-offset-1 col-xs-12">
	<h2>Orden Para Barriles</h2>

	<%
                    set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsAmazonas = Server.CreateObject("ADODB.RECORDSET")
					RsAmazonas.Source = "SELECT Orden.Posicion, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, Amazonas.Caballo FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN (Amazonas INNER JOIN Orden ON Amazonas.idAmazona = Orden.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)="&comp&") AND ((Orden.idModalidad)=2)) ORDER BY Orden.Posicion; "

					RsAmazonas.Open, Con
					if not RsAmazonas.EOF then
						%>
		<table class="table table-condensed table-bordered">      
			<tr class="label-success">
					<th class="text-center">#</th>
					<th class="text-center">Amazona</th>
					<th class="text-center">Equipo</th>
					<th class="text-center">Caballo</th>
				</tr>
			
	<%Do While not RsAmazonas.EOF 
			dim clas

			if cont mod 2 = 0 then 
			clas = "active"
			Else
			clas ="success"
			end if%>

			<tr>
				<td class="<%=clas%> text-center"><%=RsAmazonas("Posicion")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Nombre")&" "&RsAmazonas("Apellido")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Equipo")%></td>
				<td class="<%=clas%>"><%=RsAmazonas("Caballo")%></td>
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

<article class="table-responsive col-md-10 col-md-offset-1 col-xs-12">
<h2>Orden Para Polos</h2>
	<%
                    set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsAmazonas2 = Server.CreateObject("ADODB.RECORDSET")
					RsAmazonas2.Source = "SELECT Orden.Posicion, Amazonas.Nombre, Amazonas.Apellido, Equipos.Nombre AS Equipo, Amazonas.Caballo FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN (Amazonas INNER JOIN Orden ON Amazonas.idAmazona = Orden.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)="&comp&") AND ((Orden.idModalidad)=1)) ORDER BY Orden.Posicion; "

					RsAmazonas2.Open, Con
					if not RsAmazonas2.EOF then
						%>
		<table class="table table-condensed table-bordered">       
			<tr class="label-success">
					<th class="text-center">#</th>
					<th class="text-center">Amazona</th>
					<th class="text-center">Equipo</th>
					<th class="text-center">Caballo</th>
					
				</tr>
			
	<%Do While not RsAmazonas2.EOF 
			

			if cont mod 2 = 0 then 
			clas = "active"
			Else
			clas ="success"
			end if%>

			<tr>
				<td class="<%=clas%> text-center"><%=RsAmazonas2("Posicion")%></td>
				<td class="<%=clas%>"><%=RsAmazonas2("Nombre")&" "&RsAmazonas2("Apellido")%></td>
				<td class="<%=clas%>"><%=RsAmazonas2("Equipo")%></td>
				<td class="<%=clas%>"><%=RsAmazonas2("Caballo")%></td>
				
			</tr>
                    <%RsAmazonas2.MoveNext
					cont = cont + 1
					loop
					RsAmazonas2.Close%>
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




