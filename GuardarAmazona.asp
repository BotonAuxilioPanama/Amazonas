<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%
dim nombre
dim apellido
dim edad
dim idEquipo

if request.Form("nombre") <> "" AND request.Form("apellido") <> "" AND request.Form("edad") <> "" AND request.Form("equipo") <> "" then

nombre = request.Form("nombre")
apellido =request.Form("apellido") 
edad = CINT(request.Form("edad"))
equipo = CINT(request.Form("equipo"))

response.redirect("PagResultado.asp?res=1" )

else
response.redirect("PagResultado.asp?res=2" )
end if


%>





