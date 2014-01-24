<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
if request.Form("user") <> empty AND request.Form("pass") <> empty then

dim user
dim pass
dim com
com = Chr(34) 

user = request.Form("user")
pass = request.Form("pass")

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsUsuario = Server.CreateObject("ADODB.RECORDSET")
RsUsuario.Source = "SELECT Usuarios.idUser, Usuarios.Nick, Usuarios.Password FROM Usuarios WHERE (((Usuarios.Nick)="&com&user&com&"));"
RsUsuario.Open, Con
if not RsUsuario.EOF then
  if pass = RsUsuario("Password")then
      Session.contents("idUser") = RsUsuario("idUser")
      Session.contents("User") = RsUsuario("Nick")
     response.redirect("Menu.asp" )
     else
     response.redirect("Login.asp?res=1" )
     end if
RsUsuario.Close
else
response.redirect("Login.asp?res=1" )

end if 

end if


%>