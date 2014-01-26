
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->

<%
cabecera "Resultados Por Competencias", "Posiciones Finales"
%>

          <div class="row"> 
            <section class="col-md-6 col-xs-12 ">
              <h2>Competencia Nacional</h2>

              <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
                <h3>Mejor Promedio Individual</h3>
               
                  
                  <%GanadoresPromedioInd(1)%>
                  
              
             </article>

             <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
              <h3>Mejor Tiempo Individual</h3>
               <%GanadoresTiempoInd(1)%>

           </article>

           <article class="table-responsive col-md-6  col-md-offset-3 col-xs-12">
            <h3>Mejor Equipo</h3>
            <% GanadoresEquipo(1)%>

         </article>
       </section>


       <section class="col-md-6 col-xs-12">
        <h2>Competencia Internacional</h2>

        <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
          <h3>Mejor Promedio Individual</h3>
           <%GanadoresPromedioInd(2)%>
       </article>

       <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
        <h3>Mejor Tiempo Individual</h3>
            <%GanadoresTiempoInd(2)%>
     </article>

     <article class="table-responsive col-md-6  col-md-offset-3 col-xs-12">
      <h3>Mejor Equipo</h3>
        <% GanadoresEquipo(2)%>
 
   </article>
 </section>
</div>
<%
piePag()
%>