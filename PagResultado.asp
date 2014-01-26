
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
dim val
dim comp
dim page
dim det
dim msgError

res = CInt(Request.QueryString("res"))


Select Case res
Case 1
paginaTit = "Operacion Exitosa"
Case 2
paginaTit = "Error"
Case Else
paginaTit = "Desconocido"
End Select

cabecera  paginaTit, ""

if res = 1 then 
  op = CInt(Request.QueryString("Op"))
  if op < 4 then 
    comp = CInt(Request.QueryString("Comp"))
      Select Case op
        Case 1
        page = "Registro.asp?Comp="&comp
        Case 2 
        page = "RegistroTiempo.asp?Comp="&comp
        Case 3
        page = "RegOrden.asp?Comp="&comp
      End Select
  else 
      Select Case op
        Case 4
        page = "CrearEquipo.asp"
        Case 5 
        page = "CrearCompetencia.asp"
      End Select
  end if 
end if 

if res = 2 then 
    op = CInt(Request.QueryString("Op"))
    if op =3 then 
      msgError = "Se seleccionó 1 amazona para 2 o mas posiciones."
    else   
      msgError = "Problemas con los datos introducidos."
    end if
    
end if 


%>
   


          <%  if res = 2 then   %>

          <div class="jumbotron">
  <div class="container alert alert-danger">
    <h1><span class="glyphicon glyphicon-remove-circle"> </span>Error</h1>
    <p>Ha ocurrido un problema durante la relización del procedimiento. Por favor regrese e intentelo de nuevo. </p>
    <p><a class="btn btn-primary btn-lg" role="button" href="javascript:window.history.back();"><span class="glyphicon glyphicon-circle-arrow-left">  </span> Regresar</a>
     <a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>   Menu Principal</a>  
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Detalles de Error
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Detalles de Error</h4>
      </div>
      <div class="modal-body">
        <p> <%= msgError%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

     </p>
  </div>
</div>
<% elseif res = 1 then %>


 <div class="jumbotron">
  <div class="container alert alert-success">
    <h1> <span class="glyphicon glyphicon-ok-circle"> </span>Datos Guardados</h1>
    <p>La Información enviada se ha almacenado correctamente en el servidor y puede ser utilizada de inmediato.</p>
    <p><a class="btn btn-primary btn-lg" role="button" href="<%=page%>"><span class="glyphicon glyphicon-plus">  </span>   Nueva Inserción</a>
     <a class="btn btn-primary btn-lg" role="button" href="Menu.asp"><span class="glyphicon glyphicon-align-justify">  </span>   Menu Principal</a></p>
  </div>
</div>

<%end if 
 %>
  
      <%
        piePag()
      %>