<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%
dim nombre
dim apellido
dim edad
dim idEquipo
dim comp


if request.Form("nombre") <> empty AND request.Form("apellido") <> empty AND request.Form("edad") <> empty AND request.Form("equipo") <> empty then

nombre = request.Form("nombre")
apellido =request.Form("apellido") 
edad = CINT(request.Form("edad"))
equipo = CINT(request.Form("equipo"))
comp = CInt(Request.QueryString("Comp"))

set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     
     RsAmazona.Source = "Insert Into Amazonas ( Nombre  ,  Apellido  ,  Edad  ,   idEquipo ) Values ('"& nombre &"', '"& apellido &"', "& edad &", "& equipo &");"

      RsAmazona.Open, Con 



response.redirect("PagResultado.asp?res=1&Op=1&Comp="&comp )

else
response.redirect("PagResultado.asp?res=2" )
end if


%>





