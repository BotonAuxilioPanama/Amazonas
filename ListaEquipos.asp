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

cabecera "Lista de Equipos Participantes", paginaTit

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
	<article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
			<table class="table table-condensed table-bordered">
			
			<tr class="label-success">
					<th class="text-center">#</th>
					<th class="text-center">Equipo</th>
			</tr>
			<%dim clas
			for t = 0 to UBound(Equipos,2) step 1
			if t mod 2 = 0 then 
				clas = "active"
			Else
				clas ="success"
			end if

			%>
			<tr>
				<td class="<%=clas%> text-center"><%=t + 1%></td>
				<td class="<%=clas%> text-center"><%=Equipos(1,t)%></td>
				
			</tr>
          <%next%>
		</table>
	

</article>
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




