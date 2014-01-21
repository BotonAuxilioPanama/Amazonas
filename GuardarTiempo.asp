<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%
dim amazona
dim tiempo
dim faltas
dim fecha
dim modalidad
dim recorrido

if request.Form("amazona") <> empty AND request.Form("tiempo") <> empty AND request.Form("faltas") <> empty AND request.Form("fecha") <> empty  AND request.Form("modalidad") <> empty  AND request.Form("recor") <> empty AND IsNumeric(request.Form("tiempo")) then

amazona = CInt(request.Form("amazona"))
tiempo = CDbl(request.Form("tiempo"))
faltas = CINT(request.Form("faltas"))
fecha = request.Form("fecha")
modalidad = CINT(request.Form("modalidad"))
recorrido = CINT(request.Form("recor"))



set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     
     RsAmazona.Source = "Insert Into Recorridos ( idAmazona  ,  idModalidad  ,  Tiempo , Falta,  Fecha, NumRecor ) Values       ("& amazona &", "& modalidad &", "& tiempo &", "& faltas &" , '"& fecha &"' , " & recorrido & ");"

      RsAmazona.Open, Con 



response.redirect("PagResultado.asp?res=1&Op=2" )

else
response.redirect("PagResultado.asp?res=2" )
end if


%>





