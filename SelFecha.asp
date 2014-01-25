<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
cabecera "Selecione la Fecha deseada", "Ranking Diario"

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsFechas = Server.CreateObject("ADODB.RECORDSET")
RsFechas.Source = "SELECT Recorridos.Fecha FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Equipos.idEquipo = Amazonas.idEquipo GROUP BY Recorridos.Fecha;"

RsFechas.Open, Con
if not RsFechas.EOF then

%>
<section class="col-md-6 col-xs-12 col-md-offset-3">
<%
Do While not RsFechas.EOF

					dim dia
					dim mes 
					dim anio

					dia = DAY(RsFechas("Fecha"))
					mes = MONTH(RsFechas("Fecha"))
					anio= YEAR(RsFechas("Fecha"))


%>


 <a class="btn btn-primary btn-lg btn-block btn-lg" href="RankingDia.asp?d=<%=dia&"&m="&mes&"&a="&anio%>"role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class=""><%=FormatDateTime(RsFechas("Fecha"),1)%></span></a>


<%
RsFechas.MoveNext
Loop
%></section><%
RsFechas.Close
Else%>

<div class="jumbotron  alert alert-danger">
					      <h1><span class="glyphicon glyphicon-remove-circle"> </span>Upps</h1>
					    <p>No hay datos Registrados . </p>
					    </div>



<%End IF%>



<%
piePag()
%>




