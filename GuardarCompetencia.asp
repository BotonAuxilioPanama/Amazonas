<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%
dim nombre
dim fechaIni
dim fechaFin

if request.Form("nombre") <> empty AND request.Form("fechaIni") <> empty AND request.Form("fechaFin") <> empty then

nombre = request.Form("nombre")
fechaIni =request.Form("fechaIni") 
fechaFin =request.Form("fechaFin") 


set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     
     RsAmazona.Source = "Insert Into Competencia ( Nombre  ,  FechaInicio, FechaFin ) Values ('"& nombre &"', '"& fechaIni &"','"& fechaFin &"');"

     RsAmazona.Open, Con 



response.redirect("PagResultado.asp?res=1&Op=5" )

else
response.redirect("PagResultado.asp?res=2&Op=5" )
end if


%>





