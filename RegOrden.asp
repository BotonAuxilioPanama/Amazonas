<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->

<%

dim comp
dim paginaTit
dim cantidad
dim v 
comp = CInt(Request.QueryString("Comp"))


Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
Case Else
paginaTit = "Desconocido"
End Select

cabecera "Registro de Orden de Recorrido", paginaTit

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsCantidad = Server.CreateObject("ADODB.RECORDSET")
RsCantidad.Source = "SELECT Count(Amazonas.idAmazona) AS Cantidad FROM (Competencia INNER JOIN Equipos ON Competencia.idCompetencia = Equipos.idCompetencia) INNER JOIN Amazonas ON Equipos.idEquipo = Amazonas.idEquipo WHERE (((Competencia.idCompetencia)= "&comp&") AND ((Amazonas.Suplente)=0));"

RsCantidad.Open, Con


 if not RsCantidad.EOF then
 cantidad = RsCantidad("Cantidad")
 RsCantidad.Close
 else
cantidad = 0
end if
 

%>
    

       <section class="col-md-12">
        <form class="form-horizontal col-md-10 col-md-offset-2" role="form" method="post" action="GuardarOrdenRecorrido.asp?cant=<%=cantidad%>&Comp=<%=comp%>">
            
             <div class="form-group">
                <label for="modalidad" class="col-md-2 control-label">Modalidad</label>
                <div class="col-md-6">
                  <select class="form-control" id="modalidad" name="modalidad">
                    <option value ="1">Polos</option>
                    <option value ="2">Barriles</option>
                  </select>
                </div>
              </div>
            
            <% 
           
            for v = 1 to cantidad  Step 1   %>  
            
             <div class="form-group" >
                <label for="amazona<%=v%>" class="col-md-2 control-label">#<%=v%></label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona<%=v%>" name="amazona<%=v%>">
                   <%ObtenerNombres(comp)%>
                  </select>
                </div>
              </div>
            
            <% next %>

       
             <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                  <button type="submit" class="btn btn-primary">
                     <span class=" glyphicon glyphicon-floppy-save"></span>
                  Guardar
                  </button>
                </div>
              </div>


            

        </form>
      </section>
      <%
    piePag()
      %>