
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->
<%

cabecera "Crear Equipo", ""
set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsEquipos = Server.CreateObject("ADODB.RECORDSET")
RsEquipos.Source = "SELECT Competencia.idCompetencia, Competencia.Nombre FROM Competencia;" 
RsEquipos.Open, Con

%>
       
         <section class="col-md-12">
            <br>
            <form class="form-horizontal col-md-8 col-md-offset-2" role="form" method="post" action="GuardarEquipo.asp">
              <div class="form-group">
                <label for="nombre" class="col-lg-2 control-label">Nombre</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="nombre" name="nombre" 
                  placeholder="Nombre del Equipo" required>
                </div>
              </div>


              <div class="form-group">
                <label for="competencia" class="col-lg-2 control-label">Competencia</label>
                <div class="col-lg-10">
                  <select class="form-control" id="competencia" name="competencia">
                  <%
                  if not RsEquipos.EOF then
                  Do While not RsEquipos.EOF
                  %>
                  <option value ="<%=RsEquipos("idCompetencia")%>"><%=RsEquipos("Nombre")%></option>
                  <%
                  RsEquipos.MoveNext
                  Loop
                  RsEquipos.Close
                   Else%>
                  <option value ="0">Debe Crear Competencias</option>
                  <%End If%>
                   </select>
                </div>
              </div>

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