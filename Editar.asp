<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->



<%

cabecera "Edicion de Recorrido", ""
existe_sesion
dim id

id = CInt(Request.QueryString("id"))

if id <> 0 then 

set Con = Server.CreateObject("ADODB.CONNECTION")
Con.Open = STRCONEXION

Set RsRecorrido = Server.CreateObject("ADODB.RECORDSET")
RsRecorrido.Source = "SELECT Amazonas.idAmazona, Amazonas.Nombre, Amazonas.Apellido, Modalidad.idModalidad, Modalidad.Nombre AS Modalidad, Recorridos.Tiempo, Recorridos.Falta, Recorridos.NumRecor,  Recorridos.Fecha FROM Modalidad INNER JOIN (Amazonas INNER JOIN Recorridos ON Amazonas.idAmazona = Recorridos.idAmazona) ON Modalidad.idModalidad = Recorridos.idModalidad WHERE (((Recorridos.idRecorrido)="&id&"));" 
RsRecorrido.Open, Con
if not RsRecorrido.EOF then 
	dim Recorridos 
	Recorridos = RsRecorrido.GetRows()
	RsRecorrido.Close
	
	dim idAmazona '--> 0
	dim nombreAmazona '-->1 + 2
	dim idMod '--> 3
	dim modalidad '-->4
	dim tiempo '--> 5
	dim falta '-->6
	dim numRecor '-->7
	dim fechaOriginal '-->8
	dim fecha 
	dim calcfalta
	
	
	
	 idAmazona = Recorridos( 0,0)
	 nombreAmazona = Recorridos(1,0) &" "&Recorridos(2,0) 
	 idMod = Recorridos( 3,0)
	 modalidad = Recorridos(4,0)
	 tiempo = Recorridos( 5,0)
	 falta = Recorridos(6,0)
	 numRecor = Recorridos(7,0)
	 fechaOriginal = Recorridos(8,0)

	 if idMod = 1 then 
	 calcfalta = falta/2
	 else 
	 calcfalta = falta/5 
	 end if
	 
	dia = DAY(fechaOriginal)
	mes = MONTH(fechaOriginal)
	anio= YEAR(fechaOriginal)

	fecha = dia&"/"&mes&"/"&anio
	 
	
%>
          <section class="col-md-12 col-xs-12">
            <form class="form-horizontal col-md-8 col-md-offset-3 col-xs-12" role="form"  action="ActualizarTiempo.asp?id=<%=id%>" method="post">

              <div class="form-group" >
                <label for="amazona" class="col-md-2 control-label">Amazona</label>
                <div class="col-md-6">
                  <p class="form-control-static"><%=nombreAmazona%></p>
                </div>
              </div>

              <div class="form-group">
                <label for="Tiempo" class="col-md-2 control-label">Tiempo</label>
                <div class="col-md-6">
                  <input type="number" min="0" step="any"class="form-control" id="tiempo" name="tiempo"
                  placeholder="Tiempo"  value = "<%=tiempo%>" required>
                </div>
              </div>

              <div class="form-group">
                <label for="faltas" class="col-md-2 control-label">Faltas</label>
                <div class="col-md-6">
                  <input type="number" min="0" max="10" class="form-control" id="faltas" name="faltas"
                  placeholder="# de Obstaculos Derribados: 0, 1, 2, ..." 
                  value = "<%=calcfalta%>" required>
                </div>
              </div>

               <div class="form-group">
                <label for="fecha" class="col-md-2 control-label">Fecha</label>
                <div class="col-md-6">
                  <input type="text" class="form-control" id="fecha" name="fecha" pattern="(0[1-9]|[12][0-9]|3[01])[/]([1-9]|1[012])[/](20)\d\d"
                  placeholder="Fecha" required value="<%=fecha%>">
                </div>
              </div> 

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
					set Con = Server.CreateObject("ADODB.CONNECTION")
					Con.Open = STRCONEXION

					Set RsModalidades = Server.CreateObject("ADODB.RECORDSET")
					RsModalidades.Source = "SELECT Modalidad.*FROM Modalidad order by Nombre ASC;" 
					RsModalidades.Open, Con

                  if not RsModalidades.EOF then
                  Do While not RsModalidades.EOF
                  %>
                  <label class="radio-inline">
                  <input type="radio" id="mod<%=RsModalidades("idModalidad")%>" 
                  		 name="modalidad" 
                  		 value="<%=RsModalidades("idModalidad")%>" 
                  		 <%if RsModalidades("idModalidad") = idMod then %>checked<% end if%>  
                  		 required> <%=RsModalidades("Nombre")%>  </label>
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
                  <input type="radio" id="recorNun1" name="recor" value="1" required  checked 
                  <%if 1 =  numRecor then %>checked<% end if%>> 1
                </label>
                <label class="radio-inline">
                  <input type="radio" id="recorNun2" name="recor" value="2" required
                 <%if 2 =  numRecor then %>checked<% end if%>> 2
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
                   Guardar Edición
                 </button>
			       </div>
             </div>
			
			<div class="form-group">
                <div class="col-md-offset-2 col-md-6">
                  <a class="btn btn-danger" href="EliminarRecorrido.asp?id=<%=id%>"><span class="glyphicon glyphicon-remove"></span> Eliminar Recorrido</a>
			       </div>
             </div>
			</form>
         </section>
    <%
	else%>
	  <div class="jumbotron  alert alert-danger">
    <h1>
        <span class="glyphicon glyphicon-remove-circle"></span>Upps</h1>
    <p>
        Se Selecciono un <Strong>campo </Strong>sin resgistro.
    </p>
</div>
	<%end if
	else %>
	  <div class="jumbotron  alert alert-danger">
    <h1>
        <span class="glyphicon glyphicon-remove-circle"></span>Upps</h1>
    <p>
        Se Selecciono un <Strong>campo </Strong>sin resgistro.
    </p>
</div>
	
	<%end if %>

	<%piePag()%>
	
	
	