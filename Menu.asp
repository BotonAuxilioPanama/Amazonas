
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
  cabecera "Menu Principal <small>Seleccione una Opción</small>", ""
%>


<div class="row"> 
      <section class="col-md-6 col-xs-12">


           <a class="btn btn-primary btn-lg btn-block btn-lg" href="CrearCompetencia.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Nueva Competencia
          </a>

           <a class="btn btn-primary btn-lg btn-block btn-lg" href="CrearEquipo.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Nuevo Equipo
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=1" role="button">
           <span class="glyphicon glyphicon-chevron-right"></span>
           Nueva Amazona
          </a>
          
           <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=3" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Registrar Orden de Recorrido</span>
          </a>


       


          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=2" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Registrar Tiempo</span>
          </a>


                <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=6" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Ver Orden de Recorrido</span>
          </a>

      <!--     <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.html" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Seleccionar Competencia
          </a> -->

          
          </section>
 <section class="col-md-6 col-xs-12 ">


             <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=5" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Lista de Recorridos</span>
          </a>

            <a class="btn btn-primary btn-lg btn-block btn-lg" href="Ranking.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Ranking
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelFecha.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Ranking Diario
          </a>

           <a class="btn btn-primary btn-lg btn-block btn-lg" href="RankingGlobal.asp" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>Ranking Global
          </a>


           <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=4" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Tabla por Fecha</span>
          </a>

          <a class="btn btn-primary btn-lg btn-block btn-lg" href="SelCompetencia.asp?Op=7" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Tabla por Modalidad</span>
          </a>

        
           
       </section>

<!-- <br>
<section class="col-md-6 col-xs-12 col-md-offset-3 btn-block">
           <a class="btn btn-primary btn-lg btn-block btn-lg" href="CerrarSesion.asp" role="button">
            <span class="glyphicon glyphicon-log-out"></span>
            <span class="justificar">Cerrar Sesión</span>
          </a>
 </section> -->
         
        
        </div>
       <%
          piePag()


       %>