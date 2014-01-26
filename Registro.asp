
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
comp = CInt(Request.QueryString("Comp"))

Select Case comp
Case 1
paginaTit = "Competencia Nacional"
Case 2
paginaTit = "Competencia Internacional"
Case Else
paginaTit = "Desconocido"
End Select

cabecera "Registro de Amazonas", paginaTit

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsEquipos = Server.CreateObject("ADODB.RECORDSET")
RsEquipos.Source = "SELECT Equipos.idEquipo, Equipos.Nombre FROM Equipos WHERE (((Equipos.idCompetencia)="& comp &"));" 
RsEquipos.Open, Con

%>

         <section class="col-md-12">
          <br>
          <form class="form-horizontal col-md-8 col-md-offset-2" role="form" action="GuardarAmazona.asp?Comp=<%=comp%>" method="post"   >
            <div class="form-group">
              <label for="nombre" class="col-lg-2 control-label">Nombre</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="nombre" name="nombre"
                placeholder="Nombres" required>
              </div>
            </div>

            <div class="form-group">
              <label for="apellido" class="col-lg-2 control-label">Apellido</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="apellido" name="apellido" 
                placeholder="Apellidos" required>
              </div>
            </div>
            <div class="form-group">
              <label for="edad" class="col-lg-2 control-label">Edad</label>
              <div class="col-lg-10">
                <input type="number" min="10" max="40" class="form-control" id="edad" 
                placeholder="Edad" required name="edad">
              </div>
            </div>


            <div class="form-group">
              <label for="equipo" class="col-lg-2 control-label">Equipo</label>
              <div class="col-lg-10">
                <select class="form-control" id="equipo" name="equipo">
                  <%
                  if not RsEquipos.EOF then
                  Do While not RsEquipos.EOF
                  %>
                  <option value ="<%=RsEquipos("idEquipo")%>"><%=RsEquipos("Nombre")%></option>
                  <%
                  RsEquipos.MoveNext
                  Loop
                  RsEquipos.Close
                   Else%>
                  <option value ="0">Debe Crear Equipos</option>
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