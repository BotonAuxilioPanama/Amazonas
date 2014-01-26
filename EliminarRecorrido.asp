<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->


<%

dim id
id = CInt(Request.QueryString("id"))

if id <> 0 then 



     set Con = Server.CreateObject("ADODB.CONNECTION")
     Con.Open = STRCONEXION
     
     Set RsAmazona = Server.CreateObject("ADODB.RECORDSET")
     Dim sql
     sql = "Delete FROM Recorridos WHERE Recorridos.idRecorrido = "&id&";"
     RsAmazona.Source = sql

     RsAmazona.Open, Con 


response.redirect("PagResultadoEdicion.asp?res=1&Op=2")

else
response.redirect("PagResultadoEdicion.asp?res=2&Op=2" )
end if


%>





