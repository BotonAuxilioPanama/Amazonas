<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->
<%

cabecera "Formulario de Creación de Competencia", ""
%>

        
         <section class="col-md-12">
            <br>
            <form class="form-horizontal col-md-8 col-md-offset-2" role="form" method="post" action="GuardarCompetencia.asp">
              <div class="form-group">
                <label for="nombre" class="col-lg-2 control-label">Nombre de la Competencia</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="nombre" name="nombre"
                  placeholder="Nombre de la Competencia" required>
                </div>
              </div>


              <div class="form-group">
                <label for="fechaIni" class="col-md-2 control-label">Fecha Inicial</label>
                <div class="col-md-6">
                  <input type="date" class="form-control" id="fechaIni" name="fechaIni"
                  placeholder="Fecha Inicial" required>
                </div>
              </div>


               <div class="form-group">
                <label for="fechaFin" class="col-md-2 control-label">Fecha Final</label>
                <div class="col-md-6">
                  <input type="date"  class="form-control" id="fechaFin" name="fechaFin"
                  placeholder="Fecha Final" required>
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