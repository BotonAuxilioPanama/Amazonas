<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%
dim nombre
dim comp



if request.Form("nombre") <> empty AND request.Form("competencia") <> empty then

nombre = request.Form("nombre")
comp =CINT(request.Form("competencia") )


set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     
     RsAmazona.Source = "Insert Into Equipos ( Nombre  ,  idCompetencia ) Values ('"& nombre &"', "& comp &");"

     RsAmazona.Open, Con 



response.redirect("PagResultado.asp?res=1&Op=4" )

else
response.redirect("PagResultado.asp?res=2&Op=4" )
end if


%>





