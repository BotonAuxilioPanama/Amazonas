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

cabecera "Lista de Participantes", paginaTit

    set Con = Server.CreateObject("ADODB.CONNECTION")
	Con.Open = STRCONEXION

	Set RsEquipos = Server.CreateObject("ADODB.RECORDSET")
	RsEquipos.Source = "SELECT Equipos.idEquipo, Equipos.Nombre FROM Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia WHERE (((Competencia.idCompetencia)="&comp&")) Order By Equipos.Nombre asc;"

	RsEquipos.Open, Con
	if not RsEquipos.EOF then
	dim Equipos
	Equipos = RsEquipos.GetRows
	RsEquipos.Close
	
%>
<section class="col-md-12 col-xs-12">
	
	<%for t = 0 to UBound(Equipos,2) step 1%>

	<article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
	<h2>Equipo: <%=Equipos(1,t)%></h2>

	<%set Con = Server.CreateObject("ADODB.CONNECTION")
		Con.Open = STRCONEXION

		Set RsAmazonas = Server.CreateObject("ADODB.RECORDSET")
		RsAmazonas.Source = "SELECT Amazonas.Nombre, Amazonas.Apellido, Amazonas.Edad FROM Equipos INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Equipos.idEquipo)="&Equipos(0,t)&")) ORDER BY Amazonas.Nombre;"

		RsAmazonas.Open, Con
		if not RsAmazonas.EOF then
		dim Amazonas
		Amazonas = RsAmazonas.GetRows
		RsAmazonas.Close
	%>

		<table class="table table-condensed table-bordered">
			
			<tr class="label-success">
					<th class="text-center">#</th>
					<th class="text-center">Amazona</th>
					<th class="text-center">Edad</th>
			</tr>
			<%dim clas
			for k = 0 to UBound(Amazonas,2) step 1
			if k mod 2 = 0 then 
				clas = "active"
			Else
				clas ="success"
			end if

			%>
			<tr>
				<td class="<%=clas%> text-center"><%=k + 1%></td>
				<td class="<%=clas%>"><%=Amazonas(0,k)&" "&Amazonas(1,k)%></td>
				<td class="<%=clas%> text-center"><%=Amazonas(2,k)%></td>
				
			</tr>
            <%next%>
		</table>
	
	<%Else%>

	 <div class="jumbotron  alert alert-danger">
	     <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
	    <p>No hay datos Registrados . </p>
	 </div>
	 
	<%End IF%>
	</article>
<%next%>
</section>
	<%Else%>
	 <div class="jumbotron  alert alert-danger">
	     <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
	    <p>No hay datos Registrados . </p>
	    </div>
	<%End IF%>

<%
piePag()
%>




