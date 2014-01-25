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

if request.Form("amazona") <> empty AND request.Form("tiempo") <> empty AND request.Form("faltas") <> empty AND request.Form("modalidad") <> empty  AND request.Form("recor") <> empty AND IsNumeric(request.Form("tiempo")) then

amazona = CInt(request.Form("amazona"))
tiempo = CDbl(request.Form("tiempo"))
faltas = CINT(request.Form("faltas"))
fecha = Date()
modalidad = CINT(request.Form("modalidad"))
recorrido = CINT(request.Form("recor"))
comp = CInt(Request.QueryString("Comp"))


if modalidad = 1 then 
	faltasT = faltas * 2
	else
	faltasT = faltas * 5
end if 




set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     
     RsAmazona.Source = "Insert Into Recorridos ( idAmazona  ,  idModalidad  ,  Tiempo , Falta,  Fecha, NumRecor ) Values       ("& amazona &", "& modalidad &", "& tiempo &", "& faltasT &" , '"& fecha &"' , " & recorrido & ");"

      RsAmazona.Open, Con 



response.redirect("PagResultado.asp?res=1&Op=2&Comp="&comp )

else
response.redirect("PagResultado.asp?res=2&Op=2" )
end if


%>





