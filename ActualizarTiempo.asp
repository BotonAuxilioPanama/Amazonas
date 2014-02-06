<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%
dim amazona
dim tiempo
dim faltas
dim faltasT
dim fecha
dim modalidad
dim recorrido
dim comp
dim id

dim dia 
dim mes
dim anio
dim fecha2
dim fechaSQL


if  request.Form("tiempo") <> empty AND request.Form("faltas") <> empty AND request.Form("modalidad") <> empty  AND request.Form("recor") <> empty AND IsNumeric(request.Form("tiempo")) then

id = CInt(Request.QueryString("id"))
tiempo = CDbl(request.Form("tiempo"))
faltas = CINT(request.Form("faltas"))
fecha = request.Form("fecha")
modalidad = CINT(request.Form("modalidad"))
recorrido = CINT(request.Form("recor"))

dia = DAY(fecha)
mes = MONTH(fecha)
anio= YEAR(fecha)

fecha2 = dia&"/"&mes&"/"&anio
fechaSQL =mes&"/"&dia&"/"&anio





if modalidad = 1 then 
	faltasT = faltas * 2
	else
	faltasT = faltas * 5
end if 




     set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     Dim sql
     sql = "Update Recorridos set  Recorridos.idModalidad = "& modalidad &" ,  Recorridos.Tiempo = "&tiempo &", Recorridos.Falta = "& faltasT &",  Recorridos.Fecha = #"& fechaSQL &"#, Recorridos.NumRecor = "& recorrido &" WHERE Recorridos.idRecorrido = "&id&";"
     RsAmazona.Source = sql

     RsAmazona.Open, Con 



response.redirect("PagResultadoEdicion.asp?res=1&Op=1")

else
response.redirect("PagResultadoEdicion.asp?res=2&Op=1" )
end if


%>





