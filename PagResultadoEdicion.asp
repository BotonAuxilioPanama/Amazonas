
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->


<%
existe_sesion
dim res
dim paginaTit
dim op
dim msgError
dim tit

res = CInt(Request.QueryString("res"))
op = CInt(Request.QueryString("Op"))


Select Case res
Case 1
paginaTit = "Operacion Exitosa"
Case 2
paginaTit = "Error"
Case Else
paginaTit = "Desconocido"
End Select

cabecera  paginaTit, ""

Select Case op
Case 1
msgError = "Proceso de Actualizacion."
tit = "Actualizados"
Case 2
msgError = "Proceso de Eliminación."
tit = "Eliminados"
Case Else
msgError = "Desconocido"
End Select

%>
    <%  if res = 2 then   %>

          <div class="jumbotron">
  <div class="container alert alert-danger">
    <h1><span class="glyphicon glyphicon-remove-circle"> </span>Error</h1>
    <p>El <strong><%=msgError%></strong> No se realizó correctamente por favor intente de nuevo.</p>
    <p><a class="btn btn-primary btn-lg" role="button" href="javascript:window.history.back();"><span class="glyphicon glyphicon-circle-arrow-left">  </span> Regresar</a>
     <a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>   Menu Principal</a>  
    
 
</button>



     </p>
  </div>
</div>
<% elseif res = 1 then %>


 <div class="jumbotron">
  <div class="container alert alert-success">
    <h1> <span class="glyphicon glyphicon-ok-circle"> </span>Datos <%=tit%></h1>
     <p>El <strong><%=msgError%></strong> Se realizó correctamente.</p>
    <p><a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>  Menu Principal</a></p>
  </div>
</div>

<%end if 
 %>
  <%
    piePag()
  %>