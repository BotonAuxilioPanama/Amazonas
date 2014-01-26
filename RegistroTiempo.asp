
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
dim fechahoy
fechahoy = Date()
comp = CInt(Request.QueryString("Comp"))


Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
Case Else
paginaTit = "Desconocido"
End Select

cabecera "Registro de Tiempo de Recorrido", paginaTit

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsModalidades = Server.CreateObject("ADODB.RECORDSET")
RsModalidades.Source = "SELECT Modalidad.*FROM Modalidad order by Nombre ASC;" 


%>

          <section class="col-md-12 col-xs-12">
            <form class="form-horizontal col-md-8 col-md-offset-3 col-xs-12" role="form"  action="GuardarTiempo.asp?Comp=<%=comp%>" method="post">

              <div class="form-group" >
                <label for="amazona" class="col-md-2 control-label">Amazona</label>
                <div class="col-md-6">
                 <select class="form-control" id="amazona" name="amazona">
                <%  ObtenerNombres(comp) %>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="Tiempo" class="col-md-2 control-label">Tiempo</label>
                <div class="col-md-6">
                  <input type="number" min="0" step="any"class="form-control" id="tiempo" name="tiempo"
                  placeholder="Tiempo" required>
                </div>
              </div>

              <div class="form-group">
                <label for="faltas" class="col-md-2 control-label">Faltas</label>
                <div class="col-md-6">
                  <input type="number" min="0" max="10" class="form-control" id="faltas" name="faltas"
                  placeholder="# de Obstaculos Derribados: 0, 1, 2, ..." required>
                </div>
              </div>

              <!-- <div class="form-group">
                <label for="fecha" class="col-md-2 control-label">Fecha</label>
                <div class="col-md-6">
                  <input type="date" class="form-control" id="fecha"  name="fecha"
                  placeholder="Fecha" required value="<%= fechahoy %>">
                </div>
              </div> -->

             <!--  <div class="form-group">
                <label for="modalidad" class="col-md-2 control-label">Modalidad</label>
                <div class="col-md-6">
                  <select class="form-control" id="modalidad">
                    <option>Polos</option>
                    <option>Barriles</option>
                  </select>
                </div>
              </div>-->
               
            <div class="form-group">
                <label for="recorrido" class="col-md-2 control-label">Modalidad</label>
                <div class="col-md-6" id="recorrido">
                    
                      <%
                          RsModalidades.Open, Con
                  if not RsModalidades.EOF then
                  Do While not RsModalidades.EOF
                  %>
                     <label class="radio-inline">
                  <input type="radio" id="mod<%=RsModalidades("idModalidad")%>" name="modalidad" value="<%=RsModalidades("idModalidad")%>" required> <%=RsModalidades("Nombre")%>  </label>
                  <%
                  RsModalidades.MoveNext
                  Loop
                  RsModalidades.Close
                  Else%>
                    <label class="radio-inline">
                  <input type="radio" id="mod" name="modalidad" value="1" disabled="disabled" required> Debe Crear Modalidades  </label>
                  <%End If%>
                     </div>
                 </div>
                
              <div class="form-group">
                <label for="recorrido" class="col-md-2 control-label"># de Recorrido</label>
                <div class="col-md-6" id="recorrido">

                <label class="radio-inline">
                  <input type="radio" id="recorNun1" name="recor" value="1" required> 1
                </label>
                <label class="radio-inline">
                  <input type="radio" id="recorNun2" name="recor" value="2" required> 2
                </label>
              </div>
                <!--
                <div class="col-md-6">
                  <input type="number" min="1" max ="2" class="form-control" id="recorrido" 
                  placeholder="# de Recorrido" required>
                </div> -->
              </div>


              <div class="form-group">
                <div class="col-md-offset-2 col-md-6">
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